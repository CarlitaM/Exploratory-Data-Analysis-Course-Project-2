## Download dataset from : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

## Set your working directory with destination folder

setwd("/Users/carlamusi/Desktop/Data Science/4. Exploratory Data Analysis/Week 4/02 Course Project 2/exdata-data-NEI_data")

## Read the two files into R

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Question 1 : Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## Aggregate total emissions from each of the years

aggregateEmissions <- aggregate(Emissions ~ year,NEI, sum)

## Create Plot 1

png("plot1.png", , width = 480, height = 480)
barplot(aggregateEmissions$Emissions, names.arg = aggregateEmissions$year, xlab = "Year", ylab = "PM2.5 Emissions", main = "Total PM2.5 Emissions in the United States", col = "Red")
dev.off()

## Response : Yes, total emissions from PM2.5 decreased significantly in the United States from 1999 to 2008. 
