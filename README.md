# Getting and Cleaning Data Project

This repository was created for storage of the artifacts for the Course Project (Getting and Cleaning Data Coursera Data Course). Below is a brief description taken from the course page:


## Project Objective
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

## Repository Content

  * readme.MD  - the file you are currently viewing
  * run_analysis.R – R script for uploading raw data files and creating a tidy data set
  * Codebook.MD – information about source data, transformations performed to clean the data and variables created in the process. 
######Please review CodeBook.md file for information on source data and transformations that were done during the analysis.

##Pre-requisite for script to work
the code requires package plyr. If you do not have this package, please run the following code in
R studio to obtain this package
  install.packages(“plyr”)
#### Note: this script uploads and unzips source data in your working directory in a folder Data
####
####if you want to save tidy data set to a .txt tab delimited file, please uncomment code in line 85

