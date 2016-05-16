## Download dataset from : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

## Set your working directory with destination folder

setwd("/Users/Desktop/Data Science/4. Exploratory Data Analysis/Week 4/02 Course Project 2/exdata-data-NEI_data")

## Read the two files into R

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Question 4 : Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

## Search coal combustion-related sources

coalEmissions <- unique(grep("coal", SCC$EI.Sector, ignore.case=TRUE, value=TRUE)) 

## Subset total emissions from each of the years on coal

coalSCC <- subset(SCC, EI.Sector %in% coalEmissions)
coalNEI <- subset(NEI, SCC %in% coalSCC$SCC)

## Load ggplot package from library 

library(ggplot2)

## Create Plot 4 using ggplot2

png("plot4.png",  width = 480, height = 480)
ggplot(coalNEI, aes(factor(year), Emissions)) + geom_bar(stat="identity") + xlab("Year") + ylab("PM2.5 Emissions") + ggtitle ("Total PM2.5 Emissions in the US from coal combustion-related sources")
dev.off()

## Response : Total emissions from coal combustion-related sources across the US have decreased significantly from 99 to 08. 
