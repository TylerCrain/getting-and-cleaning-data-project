# Combining all of the training data into one data frame
training <-  read.csv("UCI HAR Dataset/train/X_train.txt", sep = "",
                      header = FALSE)
training[562] <- read.csv("UCI HAR Dataset/train/Y_train.txt", sep = "",
                          header = FALSE)
training[563] <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep = "",
                          header = FALSE)

# Combining all of the test data into one data frame
test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep = "",
                 header = FALSE)
test[562] <- read.csv("UCI HAR Dataset/test/Y_test.txt", sep = "",
                      header = FALSE)
test[563] <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep = "",
                      header = FALSE)

# combings Training and Test data
data <- rbind(training, test)

# Getting the activity labels
activityLabels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep = "",
                          header = FALSE)
# Getting the features
features <- read.csv("UCI HAR Dataset/features.txt", sep = "",
                     header = FALSE)

# Using gsub to make the features more readable
features[,2] <- gsub('-mean', 'mean', features[,2])
features[,2] <- gsub('-std' , 'std' , features[,2])
features[,2] <- gsub("-|\\()", "", features[,2])
features[,2] <- gsub('[()]', '', features[,2])
features[,2] <- tolower(features[,2])

# Replaces activity numbers with words
for (i in 1:length(data$V1.1)){
    if (data$V1.1[i] == 1){
        data$V1.1[i] <- "Walking"
    }
    else if (data$V1.1[i] == 2){
        data$V1.1[i] <- "Walking Upstairs"
    }
    else if (data$V1.1[i] == 3){
        data$V1.1[i] <- "Walking Downstairs"
    }
    else if (data$V1.1[i] == 4){
        data$V1.1[i] <- "Sitting"
    }
    else if (data$V1.1[i] == 5){
        data$V1.1[i] <- "Standing"
    }
    else if (data$V1.1[i] == 6){
        data$V1.1[i] <- "Laying"
    }
}

# Change the column names
colnames(data) <- c(features$V2, "Activity", "Subject")

# Extracting columns with mean and STD
meanSD <- grep(".*mean.*|.*std.*", features[,2])
extractedCols <- c(562,563, meanSD)
data <- data[extractedCols]

# Makes a new tidy data set
tidyData <- aggregate(data, by = list(activity = data$Activity, subject =
                                          data$Subject), mean)

# Remove empty tidy data columns
tidyData[,3] = NULL
tidyData[,3] = NULL

# Puts tidy data into text file
write.table(tidyData, file = "tidyData.txt",row.name = FALSE, sep = "\t")