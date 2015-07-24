# Getting-and-Cleaning-Data
Course Project for Getting and Cleaning Data

This is a repository for the course project for the Getting and Cleaning Data course.

## Project Description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

## Repo Requirements

1: a tidy data set, ("tidy.txt")

2: run_analysis.R 

3: CodeBook.md

4: README.md

## Analysis Steps

Prep - Get Data
- Get the Human Activity Recognition Using Smartphones Dataset Version 1.0 at the link provided in the course project assignment.
- Download the dataset.
- Unzip the dataset.

Prep - Load Data
- Read the data files into R.

Merge the data into 1 dataset

Extract only the means and standard deviations for each measurement

Use descriptive activity names

Use descriptive variable/column names

Remove Mean Freq columns

Create a summary file of the averages of each variable for each activity and each subject

Write a file entitled "tidy.txt" using the write.table() and row.names=FALSE
