# run_analysis.R CodeBook

The run_analysis.R script file loads, combines, and cleans messy data sets into a tidy one that can be used for analysis and outputs the data files.

### Step 1: Download and load data files
After downloading the following files from the UCI HAR website, each file is loaded read into R as a dataframe

- **X_train** <- X_train.txt: 7352 observations of 561 variables.  
*Each row contains data for one 'feature' for one subject across all 561 features*
- **subject_train** <- subject_train.txt: 7352 observations of 1 variable.  
*Each row identifies the subject who performed the activity for each window sample; ranges from 1 to 30*
- **y_train** <- y_train.txt: 7352 observations of 1 variable.  
*Each row identifies what activity is being performed by the subject for each matching row of the X_train data; ranges from 1 to 6*
- **X_test** <- X_test.txt: 2947 observations of 561 variables.  
*Each row contains data for one 'feature' for one subject across all 561 features*
- **subject_test** <- subject_test.txt: 2947 observations of 1 variable.  
*Each row identifies the subject who performed the activity for each window sample; ranges from 1 to 30*
- **y_test** <- y_train.txt: 2947 observations of 1 variable.  
*Each row identifies what activity is being performed by the subject for each matching row of the X_test data; ranges from 1 to 6*
- **features** <- features.txt: 561 observations of 2 variables.  
*Provides variable labels for each measurement variable in the 'X_train' and 'X_test' data files*
- **activity_labels** <- activity_lables.txt: 6 observations of 2 variables.  
*Provides value labels for each activity in the 'y_train' and 'y_test' data files*
      - 1 = Walking
      - 2 = Walking Upstairs
      - 3 = Walking Downstairs
      - 4 = Sitting
      - 5 = Standing
      - 6 = Laying
      
### Step 2: Remove unwanted variables from **features**
Only **mean** and **standard deviation** measurements are wanted, so this step removes any feature that doesn't meet this criteria.

### Step 3: Apply activity labels to **y_train** and **y_test**
Using the **activity_labels** data, this step assigns the value labels to the **y_train** and **y_test** data frames, while removing the code-only variable.

### Step 4: Remove unneeded variables from **X_test** and **X_train**
Using the updated **features** data frame from Step 2, this step keeps only those variables in the **X_test** and **X_train** data frames, and applies the appropriate variable name.

### Step 5: Merge data frames
This step first merges the three data frames each for the train data (**subject_train**, **y_train**, and **X_train**) and the test data (**subject_test**, **y_test**, and **X_test**) by binding columns. Then, the train data and test data are combined into a single tidy data frame, **dataAll** and written to a '.csv' file: dataAll.csv

### Step 6: Create summary data frame
This step uses the **dataAll* data frame to summarize (with mean) all the data by subject and activity. This tidy data frame, **dataSummary** is then written to a '.csv' file: dataSummary.csv
