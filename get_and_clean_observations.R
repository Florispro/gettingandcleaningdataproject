get_and_clean_observations <- function(observations_raw, activities_raw, subjects_raw) {
  # The purpose of this function is to get the raw set of data - which is
  # either the train or test set - and do the required cleaning:
  # - Select only the variables for the mean and std measurements
  # - Get the acitivity and subject variables in the same table as the rest of the variables
  # - Turn the acitivity variable into a factor with descriptive names
  
  # 1. Get the raw data  
  
  observations_laf <- laf_open_fwf(observations_raw, 
                                   column_widths = rep(16, times = 561), 
                                   column_types = rep("numeric", times = 561))  
  activities <- read.table(activities_raw)
  subjects <- read.table(subjects_raw)
  observations_tbl <- tbl_df(observations_laf[,])
  rm(observations_laf)
  
  
  # 2. Clean the raw data
  
  # The variable names in the raw data do not adhere to the R syntax
  # In particular, the (, ), and - symbols are used.
  # We fix this using make.names, to replace them with .'s
  names(observations_tbl) <- feature_names$name
  valid_column_names <- make.names(names=names(observations_tbl), unique=TRUE, allow_ = TRUE)
  names(observations_tbl) <- valid_column_names
  
  # Do the required cleaning
  observations_tbl <- observations_tbl %>%
                      select(grep('mean[..]|std[..]', names(observations_tbl))) %>%
                      mutate(activity = factor(activities[,1], labels = activity_labels$label)) %>%
                      mutate(subject = subjects[,1]) 
  
  rm(activities)
  
  observations_tbl
}