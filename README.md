# Getting and Cleaning Data Project

This repository is for the Courera Getting and Cleaning Data course project.  In this project, the goal is to load, combine, and clean messy data sets into a tidy one that can be used for analysis, and output the files.


Data: The data come from experiments completed using a smartphone's accelermoeter and gyroscope. The goal of the experiments was to predict human activity based on the the data.  The data a further described in the CodeBook.md file.


Files:

+ README.md: The current document describing the repository.
+ CodeBook.md: Describes the variables, data, and work performed to clean up the data.
+ run_analysis.R: An R script that will complete the required steps in project requirements. Briefly, this script loads the data sets, merges them while selecting only the necessary variables, provides descriptive variable names, and writes the result to a .csv file. Then, the script summarizes the data by subject and activity and writes the result to a .txt file.
