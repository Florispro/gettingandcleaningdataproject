# 'Getting and Cleaning Data' course project

This repository contains the files required for the the '[Getting and Cleaning Data](https://class.coursera.org/getdata-032/)' course on Coursera.
* The tidy dataset is called 'clean_set.txt', and can be found in the data folder,
* The code book is called 'Project code book.txt'
* The script to generate the tidy dataset is 'run_analysis.R'. Please see the instructions below on how to run this.

## Background
The data that we're interested in for this project, comes from a ['wearable computing' experiment](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Instructions on getting the tidy data
To run the script to get the tidy data, you have to

1. Get the all R scripts in this repository in your R working directory. These are the required R scripts:
  - run_analysis.R
  - get_and_clean_observations.R
  - clean_column_names.R
2. Run the run_analysis.R script.
3. The tidy dataset will end up in '/data/clean_set.txt' in your working directory.

## How the script works

This script downloads and reads in the raw data from the experiment. It then cleans the data as follows:
- Gather all the variables of each observation in one table
- Rename the variables and values to be more descriptive
- Get only the variables for the mean and standard deviation measurements
- Merge the observations in one dataset
- On the merged set it does a summarization (mean) by activity and subject. 
- It splits the columns into several columns, to turn the dataset into long-form
- Finally it writes the resulting clean dataset to disk ('clean_set.txt').

We will go through the cleaning process in detail.

#### Gather all the variables in one table

The raw data has put the data on the measurements, activity and subject per observation in two different files. That means the data for one observation is spread over three files. This script merges all this data, so that each observation has all its data in one table.

#### Rename the variable and values

The variables in the raw data contain a lot of abbreviations. To make sure it is clear from the variable name what has been measured, the abbreviations are replaced with the full description of the measurement. 

The activity data are encoded as numbers. The raw data does provide a mapping of numbers to descriptive activity names like 'WALKING'. We modify the table with observation data to use the descriptive names instead of the numbers.

#### Get only the variables for the mean and standard deviation measurements

The raw data includes a lot of estimations of different variables per observation. For this project we are only interested in the estimations of the mean and standard deviation variables. So the script filters out all the other variables from the raw data.

#### Merge the observations in one dataset

The raw data is split into a 'train' and 'test' set of observations. The subjects were split into 'train' and 'test' subjects. The types of activities and variables measured are the same across the two sets of data. So in this project we merge the two sets of observations into one big set.

#### Split columns
The columns are split to get the data in long form format. The following columns are extracted:
- Domain (time or frequency)
- Signal source (body or gravity)
- Measured quantity (acceleration, jerk, et cetera)
- Measured function (mean or standard deviation)
- Axis (x, y, z or none)
- Function value

#### Summarization (mean) by activity and subject

The raw data includes a total of 10299 observations. The observations were made on the activities (six types of activities) of thirty test subjects. A natural summarization is to show the average of each measured variable by subject and activity. The output of the script is exactly this summarization.
