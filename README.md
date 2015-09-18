# 'Getting and Cleaning Data' course project

This repository contains the files required for the the '[Getting and Cleaning Data](https://class.coursera.org/getdata-032/)' course on Coursera.
* The tidy dataset is called clean_set.txt, and can be found in the data folder,
* The code book is called <...>
* The script to generate the tidy dataset is run_analysis.R. Please see the instructions below on how to run this.

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
On the merged set it does a summarization (mean) on by activity and subject. Finally it writes the resulting clean dataset to disk ('clean_set.txt').
