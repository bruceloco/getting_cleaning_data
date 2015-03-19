library(dplyr)
# filename = file to read, cofInfo is the table that contains the row numbers we want + variable names
# col info is a table of 2 columns, the first is a numeric list of line numbers and the 2nd one a char of row names 
read_x <- function(colInfo,filename="") {
  temp_data<-read.table(file=filename,header=FALSE, colClasses=c("numeric"))
  temp_data<-temp_data[,as.vector(t(colInfo[1]))]  
  colnames(temp_data)<-as.vector(t(colInfo[2]))
  read_x <-temp_data
}

# we only need the following variables, so grep for mean and std in the features table
col_info <- read.table("UCI HAR Dataset/features.txt", sep=" ", colClasses = c("numeric","character"))
col_info <-col_info[grepl("std\\(",col_info$V2)|grepl("mean\\(",col_info$V2),]

# read the train data
# x are the inputs used to calculate the outputs y
# subject is an id of the person whose measurements were taken from
# there 30 subjects in total
# length(unique(subject_train)) > 21 subjects
# coalesce the training data
train_data<-read_x(col_info,"UCI HAR Dataset/train/X_train.txt")
y_train<-scan("UCI HAR Dataset/train/y_train.txt")
subject_train<-scan("UCI HAR Dataset/train/subject_train.txt")

# first merge the train data > x, subject, y
train_data$subject <-subject_train
train_data$y <-y_train
remove(y_train, subject_train)

# read the test data
# length(unique(subject_test)) > 9 subjects
# coalesce the test data
test_data<-read_x(col_info,"UCI HAR Dataset/test/X_test.txt")
y_test<-scan("UCI HAR Dataset/test/y_test.txt")
subject_test<-scan("UCI HAR Dataset/test/subject_test.txt")

# first merge the train data > x, subject, y
test_data$subject <-subject_test
test_data$y <-y_test
remove(y_test, subject_test)

combined_data<-rbind(train_data,test_data)
remove(train_data)

# load activity names
y_labels<-read.table("UCI HAR Dataset/activity_labels.txt", sep=" ", colClasses = c("numeric","character"),col.names=c("y","activity"))

combined_data<-inner_join(combined_data,y_labels,by=c("y"))
combined_data$y<-NULL

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data<-combined_data %>% group_by(activity,subject) %>% summarise_each(funs(mean))
write.table(tidy_data,file="tidy_features.txt", row.names=FALSE)
