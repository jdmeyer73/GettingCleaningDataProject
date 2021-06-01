## Load packages
library(stringr)
library(dplyr)
## Load Data Files from Working Directory

### Get file names
filenames <- list.files(pattern = c("train.txt|test.txt|features.txt|activity_labels.txt")
                        ,recursive=TRUE)
filenames <- filenames[lapply(filenames, function(x) length(grep("Inertial", x, 
                              value=FALSE)))==0]

### Load files and save as data frames
for(i in filenames) {
      df <- read.table(i)
      assign((str_remove(basename(i), ".txt")), df)
      rm(df)
}

## Mutate and Filter 'features' to better labels and keeping only mean/std

features <- features %>%
      mutate(V3=paste0("V",V1), V4=str_remove_all(V2, "[-(),]")) %>% 
      filter(str_detect(V4,"mean|std"))

## Apply activity labels to 'y' dataframes
y_test <- y_test %>% 
            left_join(activity_labels, by="V1") %>% 
            rename(activity=V2) %>% 
            select(-V1)
y_train <- y_train %>% 
            left_join(activity_labels, by="V1") %>% 
            rename(activity=V2) %>% 
            select(-V1)

## Remove unneeded variables in test and train

### Create vector of variables to keep
keep <- features$V3

### Create list of 'X' data frames
Xlist <- list(X_test=X_test, X_train=X_train)

### Remove unneeded variables from data frames and apply variable names
for (i in names(Xlist)) {
      Xlist[[i]] <- Xlist[[i]][keep]
      Xlist[[i]] <- Xlist[[i]] %>% 
            rename_at(vars(features$V3), ~features$V4)
}

## Merge dataframes horizontally then vertically and rename subject/activity

dataTest <- bind_cols(subject_test, y_test, Xlist$X_test)
dataTrain <- bind_cols(subject_train, y_train, Xlist$X_train)
dataAll <- bind_rows(dataTest,dataTrain) %>% 
      rename(subject=V1)

## Write data file to '.csv' file
write.csv(dataAll, file="dataAll.csv")

## Remove unnecessary objects in environment
rm(list=setdiff(ls(), "dataAll"))

## Summarize by subject, activity
dataSummary <- dataAll %>% 
      group_by(subject, activity) %>% 
      summarize_all(mean)

## Write data summary file to '.txt' file
write.table(dataSummary, file="dataSummary.txt", row.name = FALSE)
