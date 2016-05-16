## Download dataset from : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

## Set your working directory with destination folder

setwd("/Users/carlamusi/Desktop/Data Science/4. Exploratory Data Analysis/Week 4/02 Course Project 2/exdata-data-NEI_data")

## Read the two files into R

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Question 2 : Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

