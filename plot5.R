## Download dataset from : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

## Set your working directory to destination folder

setwd("/Users/Desktop/Data Science/4. Exploratory Data Analysis/Week 4/02 Course Project 2/exdata-data-NEI_data")

## Read the two files into R

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Question 5 : How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 

## Subset and aggregate total motor emissions from each of the years in Baltimore City

NEI$year <- factor(NEI$year, levels = c("1999", "2002", "2005", "2008"))
motorEmissionsBl <- subset(NEI, fips == 24510 & type == "ON-ROAD")
motorEmissionsBaltimore <- aggregate(motorEmissionsBl[, 'Emissions'], by=list(motorEmissionsBl$year), sum)
colnames(motorEmissionsBaltimore) <- c("year", "Emissions")

## Load ggplot package from library 

library(ggplot2)

## Create Plot 5 using ggplot2

png("plot5.png", width = 480, height = 480)
ggplot(motorEmissionsBaltimore, aes(factor(year), Emissions)) + geom_bar(stat = "identity") + guides(fill = FALSE) + xlab("Year") + ylab("PM2.5 Emissions") + ggtitle ("Total PM2.5 Emissions of Motor Vehicle Sources in Baltimore")
dev.off()

## Response : Emissions from motor vehicle sources have significantly decreased in Baltimore City from 99 to 08. 
