require(LaF)
require(dplyr)
source("get_and_clean_observations.R")

# 1. Download the raw dataset (if required)
# We assume the dataset has been downloaded if the root folder
# of the dataset already exists

data_folder = './data'

if(!file.exists('./data')) {
  dir.create('./data')
}

dataset_name <- 'UCI HAR Dataset'
dataset_location <- paste0('./data/', dataset_name)
if(!file.exists(dataset_location)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  zipfilepath <- paste0(data_folder, '/smartphonedata.zip')
  download.file(fileURL, destfile = zipfilepath)
  unzip(zipfilepath, exdir = './data')
}


# 2. Read in raw data

feature_names <- read.table(paste0(dataset_location, '/features.txt'))
activity_labels <- read.table(paste0(dataset_location, '/activity_labels.txt'))

names(feature_names) <- c('index', 'name')
names(activity_labels) <- c('index', 'label')

features_train = paste0(dataset_location, '/train/X_train.txt')
activities_train = paste0(dataset_location, '/train/y_train.txt')
subjects_train = paste0(dataset_location, '/train/subject_train.txt')
features_test = paste0(dataset_location, '/test/X_test.txt')
activities_test = paste0(dataset_location, '/test/y_test.txt')
subjects_test = paste0(dataset_location, '/test/subject_test.txt')

train_set_clean <- get_and_clean_observations(features_train, activities_train, subjects_train)
test_set_clean <- get_and_clean_observations(features_test, activities_test, subjects_test)

clean_set <- merge(train_set_clean, test_set_clean, all = TRUE)
clean_set <- clean_column_names(clean_set)
clean_set <- clean_set %>%
             group_by(activity, subject) %>%
             summarize_each(funs(mean))

rm(train_set_clean)
rm(test_set_clean)