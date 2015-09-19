clean_column_names <- function(observations) {
  # The purpose of this function is to make the variable names
  # from the raw data more descriptive
  
  observations <- observations %>%
    rename_(.dots=setNames(names(.), gsub("^f", "Frequency", names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub('^t', 'Time', names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub('Acc', 'Acceleration', names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub('[.]', '', names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub('mean', 'Mean', names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub('std', 'StandardDeviation', names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub('Mag', 'Magnitude', names(.)))) %>%
    rename_(.dots=setNames(names(.), gsub('BodyBody', 'Body', names(.))))
  
}