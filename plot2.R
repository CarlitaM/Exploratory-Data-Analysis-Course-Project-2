## Download dataset from : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

## Set your working directory with destination folder

setwd("/Users/Desktop/Data Science/4. Exploratory Data Analysis/Week 4/02 Course Project 2/exdata-data-NEI_data")

## Read the two files into R

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Question 2 : Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Aggregate total emissions from each of the years in Baltimore City

baltimoreNEI <- NEI[NEI$fips=="24510",]
aggregateEmissionsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

## Create Plot 2 

png("plot2.png", width = 480, height = 480)
barplot(aggregateEmissionsBaltimore$Emissions, names.arg = aggregateEmissionsBaltimore$year, xlab = "Year", ylab = "PM2.5 Emissions", col = "Blue", lwd = 3, main = "Total PM2.5 Emissions in Baltimore City")
dev.off() 

## Response : Yes, total emissions in Baltimore city have decreased from 1999 to 2008 in general terms, although, it first decreased from 1999 to 2002, then increased again in 2005 to finally decrease to the lowest point in 2008. 
