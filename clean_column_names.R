clean_column_names <- function(observations) {
  # The purpose of this function is to make the variable names
  # from the raw data more descriptive
  
  # We need to add '.''s in appropriate places, since in step 3
  # of the run_analysis.R script, we will separate the columns using
  # the '.' character as a separator.
  observations <- observations %>%
    rename_(.dots=setNames(names(.), gsub('[.]', '', names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub("^f", "Frequency.", names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub('^t', 'Time.', names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub('Acc', 'Acceleration', names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub('mean', '.Mean.', names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub('std', '.StandardDeviation.', names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub('Mag', 'Magnitude', names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub('BodyBody', 'Body', names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub('(Body|Gravity)', '\\1.', names(.), perl = TRUE))) %>%
    rename_(.dots=setNames(names(.), gsub('^\\.', '', names(.))))
}