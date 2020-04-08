## Getting and Cleaning data from accelerometters in Samsung Galaxy S

#1. Loading the data and merging to 1 table

subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
X_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
y_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt")

subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")
X_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
y_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt")

library(dplyr)
names(subject_train) <- "subject"
names(y_train) <- "activity"
names(subject_test) <- "subject"
names(y_test) <- "activity"
train <- cbind(subject_train,y_train,X_train)
train <- mutate(train,data = "train")
test <- cbind(subject_test,y_test,X_test)
test <- mutate(test,data = "test")
data <- rbind(train,test)

#Remove unnecessary data
rm(list=c("train","test","subject_train","subject_test","X_train","X_test",
          "y_train","y_test"))

#2. Selecting the measurements of the mean and standard deviations

features <- read.table(".\\UCI HAR Dataset\\features.txt")
colnames(data)[3:563] <- as.character(features[,2])
i <- grep("mean",names(data))  
j <- grep("std",names(data))
data <- data[,c(1,2,564,i,j)]
rm(list=c("features","i","j"))

#3. Include descriptive activity names

labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
data <- merge(data,labels,by.x="activity",by.y="V1")
data$activity <- NULL
data <- data %>% rename(activity=V2) %>%
    select(c(1,82,2,3:81)) %>%
    arrange(subject)
rm(labels)    

#4. Remove undesirable characters from variable names

names(data) <- gsub("[[:punct:]]","",names(data))

#5. Create a new data set with the average of each variable for each activity 
# and subject

group <- group_by(data,activity,subject)
group$data <- NULL
tidy <- summarize_all(group,mean)
rm(group)
write.table(tidy,".\\UCI HAR Dataset\\tidy.txt", row.names=FALSE) 
