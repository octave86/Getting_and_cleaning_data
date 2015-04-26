

run_analysis<-function(){
     ##Read the feature names
     feature_label<-read.table("features.txt",colClasses="character",col.names=c("No","feature"))
     
     ##Read the activity labels
     activity_labels<-read.table("activity_labels.txt",colClasses="character",
                                 col.names=c("No","activity_labels"))
     
     ##Read the train set
     train_subject<-read.table("train/subject_train.txt",col.names="subject")
     train_label<-read.table("train/y_train.txt",col.names="label")
     train_set<-read.table("train/X_train.txt",col.names=as.vector(feature_label$feature))
     
     ##Read the test set
     test_subject<-read.table("test/subject_test.txt",col.names="subject")
     test_label<-read.table("test/y_test.txt",col.names="label")
     test_set<-read.table("test/X_test.txt",col.names=as.vector(feature_label$feature))
     
     ##Merge two data
     mergedData <- merge(cbind(train_subject,train_label,train_set),cbind(test_subject,test_label,test_set),
                         all=TRUE)
     
     ##Extracts only the measurements on the mean and standard deviation for each measurement. 
     extractedData<-cbind(mergedData[,c(1,2)],mergedData[,grepl("(mean|std)", names(mergedData))])
     
     ##Uses descriptive activity names to name the activities in the data set
     library(plyr)
     extractedData[[2]]<-factor(extractedData[[2]], levels = c(1,2,3,4,5,6), 
                                labels=activity_labels$activity_labels)
     tidyData<-ddply(extractedData, .(subject,label),numcolwise(mean))
     
     ##Write tidyData to a txt file
     write.table(tidyData,file="tidyData.txt",row.names=FALSE)
     
     tidyData
}