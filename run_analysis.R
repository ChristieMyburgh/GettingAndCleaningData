#Load all libraries used in function.
library(plyr)
library(dplyr)
run_analyses <- function()
{
    #This function performs the ananlyses as described in Course Assignment for
    #Getting and Cleaning Data at Johns Hopkins.
    #Data set used => "UCI HAR Dataset"
    
    #Reading, cleaning and create a filter from "features" to select only
    #columns that contains the mean and standard deviation.
    features <- read.table("features.txt")
    features <- gsub("\\(\\)|\\-","",features[,2])
    features <- tolower(features)
    filter <- subset(features, grepl("^.+(mean|std)$", features))
    
    #Reading in the test and training data.    
    #These 2 tables contain the activity type.
    y_test <- read.table("./test/y_test.txt", col.names="activity")
    y_train <- read.table("./train/y_train.txt", col.names="activity")
    
    #These 2 tables contains the measurement data.
    x_test <- read.table("./test/X_test.txt", col.names=features)
    x_train <- read.table("./train/X_train.txt", col.names=features)
    
    #These 2 tables contains the id's of the subjects that took part in study.
    subj_test <- read.table("./test/subject_test.txt", col.names="subject")
    subj_train <- read.table("./train/subject_train.txt", col.names="subject")
    
    #Read in activity labels
    activity_labels <- read.table("activity_labels.txt")
    
    #Now merging all the training and testing tables into one large table
    
    #Step 1 - rbind the 2 measurement tables.
    training_set <- rbind(x_train, x_test)
    
    #Step 2 - rbind the 2 activity tables.
    activity_set <- rbind(y_train, y_test)
    
    #Step 3 - rbind the 2 subject tables.
    subjects_set <- rbind(subj_train, subj_test)
    
    #Step4 -cbind all the tables created in steps 1 to 3.
    combo_set <- cbind(subjects_set, activity_set, training_set)
    
    #Add additional id and activity columns to filter.
    filter <- c("subject", "activity", filter)
    
    #Select columns in filter
    colNums <- match(filter, names(combo_set))
    tidy_set <- select(combo_set, colNums)
    
    #Convert activity column in to factor column assinging labels
    tidy_set$activity <- factor(tidy_set$activity, labels=activity_labels$V2)
    
    #Finally calculate the mean by ID by activity
    tidy_set_mean <- ddply(tidy_set, .(subject, activity), numcolwise(mean))
    
    #Dump data to disk
    write.table(tidy_set_mean,"tidy_set_mean.txt",row.name=FALSE) 
    
    #Return the final table.
    return (tidy_set_mean)
}