# Load necessary libraries
library(dplyr)
library(data.table)

# Step 1: Download and unzip dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "dataset.zip")
unzip("dataset.zip")

# Step 2: Read data into R
path <- "UCI HAR Dataset"
features <- read.table(file.path(path, "features.txt"), col.names = c("index", "feature"))
activities <- read.table(file.path(path, "activity_labels.txt"), col.names = c("code", "activity"))
subject_train <- read.table(file.path(path, "train", "subject_train.txt"), col.names = "subject")
x_train <- read.table(file.path(path, "train", "X_train.txt"))
y_train <- read.table(file.path(path, "train", "y_train.txt"), col.names = "code")
subject_test <- read.table(file.path(path, "test", "subject_test.txt"), col.names = "subject")
x_test <- read.table(file.path(path, "test", "X_test.txt"))
y_test <- read.table(file.path(path, "test", "y_test.txt"), col.names = "code")

# Step 3: Merge training and test sets
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
merged_data <- cbind(subject_data, y_data, x_data)

# Step 4: Extract mean and standard deviation measurements
mean_std_features <- grep("-(mean|std)\\(\\)", features$feature)
mean_std_features_names <- features[mean_std_features, 2]
data_mean_std <- merged_data[, c(1, 2, mean_std_features + 2)]

# Step 5: Use descriptive activity names
data_mean_std$code <- activities[data_mean_std$code, 2]

# Step 6: Appropriately label the dataset with descriptive variable names
names(data_mean_std)[2] <- "activity"
names(data_mean_std)[3:ncol(data_mean_std)] <- mean_std_features_names
names(data_mean_std) <- gsub("Acc", "Accelerometer", names(data_mean_std))
names(data_mean_std) <- gsub("Gyro", "Gyroscope", names(data_mean_std))
names(data_mean_std) <- gsub("BodyBody", "Body", names(data_mean_std))
names(data_mean_std) <- gsub("Mag", "Magnitude", names(data_mean_std))
names(data_mean_std) <- gsub("^t", "Time", names(data_mean_std))
names(data_mean_std) <- gsub("^f", "Frequency", names(data_mean_std))
names(data_mean_std) <- gsub("tBody", "TimeBody", names(data_mean_std))
names(data_mean_std) <- gsub("-mean\\(\\)", "Mean", names(data_mean_std), ignore.case = TRUE)
names(data_mean_std) <- gsub("-std\\(\\)", "STD", names(data_mean_std), ignore.case = TRUE)
names(data_mean_std) <- gsub("-freq\\(\\)", "Frequency", names(data_mean_std), ignore.case = TRUE)
names(data_mean_std) <- gsub("angle", "Angle", names(data_mean_std))
names(data_mean_std) <- gsub("gravity", "Gravity", names(data_mean_std))

# Step 7: Create a second tidy dataset
tidy_data <- data_mean_std %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean))

# Step 8: Write the tidy dataset to a file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
