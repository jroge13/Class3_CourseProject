## This the Getting and Cleaning Data Course Project

##Set your working directory to have the contents of the
##downloaded zip file "UCI HAR Dataset"

##The test set, call it test
test<-cbind(cbind.data.frame(activity=readLines("test/Y_test.txt"),
                               subject=readLines("test/subject_test.txt")),
                read.delim("test/X_test.txt",sep="",header=FALSE, 
                   col.names = readLines("features.txt")))
##The training set, call it training
train<-cbind(cbind.data.frame(activity=readLines("train/Y_train.txt"),
                                subject=readLines("train/subject_train.txt")),
               read.delim("train/X_train.txt",sep="",header=FALSE, 
                          col.names = readLines("features.txt")))

##Now to get the complete dataset, call it complete
complete<-rbind(test,train)

##Extract only variables on mean and std; all variables with
##mean and std will be chosen while keeping the identifier
##variables as well; call this dataset mean_std 

X<-c("mean","Mean","std","Std","activity","subject")
mean_std<-complete[, grepl(paste(X,collapse = "|"), colnames(complete))]

##Now to rename the activities in the mean_std dataset
##The read lines is just to double check correct labels

readLines("activity_labels.txt")
mean_std$activity<-factor(mean_std$activity,levels = c(1,2,3,4,5,6),
                          labels = c("WALKING","WALKING_UPSTAIRS",
                                     "WALKING_DOWNSTAIRS","SITTING",
                                     "STANDING","LAYING"))

##The column variable names need to be slightly modified. This next
##part will help make them a little more readable
names(mean_std)<-sub("X.","",names(mean_std))
names(mean_std)<-gsub("[.]","",names(mean_std))
names(mean_std)<-gsub("\\d","",names(mean_std))

##Final step, create means for all variables by subject and activity
##This will be called mean_var

library(dplyr)
mean_std<-mutate(mean_std, id = paste(subject,"_",activity))

##Because a new identifier has been made, activity and subject can
##be dropped
mean_std$activity<-mean_std$subject<-NULL

mean_var<-mean_std %>% group_by(id) %>% summarise_each(funs(mean))