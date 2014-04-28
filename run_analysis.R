library(reshape2)

##download and unzip data
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="data.zip")
unzip("data.zip",exdir="data")

##get files names and activity and features names
labelFilename <- file.path('data','UCI HAR Dataset')
list1<-list.files(labelFilename,full.names=TRUE)
activity<-read.table(list1[1])
features<-read.table(list1[2])

##create test dataset
files1<-list.files(file.path('data','UCI HAR Dataset','test'),full.names=TRUE)
testdata<-do.call(cbind, lapply(files1[c(2,4,3)],read.table))

##create train dataset
files2<-list.files(file.path('data','UCI HAR Dataset','train'),full.names=TRUE)
traindata<-do.call(cbind, lapply(files2[c(2,4,3)],read.table))

##merge both datasets
data<-rbind(testdata,traindata)
colnames(data)<-c("subject", "activity",as.character(features$V2))

##subtrack mean and std columns
means<-grep("mean",colnames(data))
std<-grep("std",colnames(data))
data<-data[,c(1:2,means,std)]
meanf<-grep("meanFre",colnames(data))
data<-data[,-meanf]

##change activity to readable names
data$activity<-as.factor(data$activity)
levels(data$activity)<-activity$V2

##create a tidy dataset with means
melt<-melt(data,id=c("subject","activity"),measure.vars=4:ncol(data))
tidy<-dcast(melt,activity+subject ~ variable,mean)

##create seperate .txt file
write.table(tidy,"tidy.txt",sep="\t")
