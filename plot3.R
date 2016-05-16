## Download dataset from : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

## Set your working directory with destination folder

setwd("/Users/carlamusi/Desktop/Data Science/4. Exploratory Data Analysis/Week 4/02 Course Project 2/exdata-data-NEI_data")

## Read the two files into R

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Question 3 : Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

## Aggregate total emissions from each of the years in Baltimore City

baltimoreNEIdata <- NEI[NEI$fips=="24510",]
aggregateEmissionsBaltimore <- aggregate(Emissions ~ year, baltimoreNEIdata,sum)

##  Load ggplot package from library 

library(ggplot2)

## Create Plot 3 using ggplot2 

png("plot3.png”)
ggplot(baltimoreNEIdata, aes(factor(year), Emissions, fill = type)) + geom_bar(stat= "identity") + theme_bw() + facet_grid(. ~ type, scales = "free", space = "free") + labs(x = "Year", y=expression("PM2.5 Emissions")) + labs(title = expression("Total PM2.5 Emissions in Baltimore City by Source"))
dev.off()

## Response : From the four types of sources, non-road, nonpoint and on-road have seen decreases in emission from 99 to 08 in Baltimore City, although, in a very different scale. For example, nonpoint has decreased more, but the levels are significantly higher than all the rest. 
## The source point has seen an increase, especially in 05. 
