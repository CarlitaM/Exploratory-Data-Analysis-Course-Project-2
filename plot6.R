## Download dataset from : https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

## Set your working directory 

setwd("/Users/Desktop/Data Science/4. Exploratory Data Analysis/Week 4/02 Course Project 2/exdata-data-NEI_data")

## Read the two files into R

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Question 6 : Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). 
## Which city has seen greater changes over time in motor vehicle emissions?

## Compare emissions from Baltimore City (BL) and Los Angeles County (LA) 

motorBL <- subset(NEI, fips == '24510' & type == "ON-ROAD")
motorLA <- subset(NEI, fips == '06037' & type == "ON-ROAD")

## Aggregate total motor emissions from each of the years in Baltimore City

BLemissions <- aggregate(motorBL[, 'Emissions'], by=list(motorBL$year), sum)
colnames(BLemissions) <- c("year", "Emissions")
BLemissions$City <- paste(rep("BL", 4))

## Aggregate total motor emissions from each of the years in Los Angeles County

LAemissions <- aggregate(motorLA[, "Emissions"], by = list(motorLA$year), sum)
colnames(LAemissions) <- c("year", "Emissions")
LAemissions$City <- paste(rep("LA", 4))

## Bind both aggregates

motorLAandBL <- as.data.frame(rbind(BLemissions, LAemissions)) 

## Create Plot 6 using ggplot2

png("plot6.png", width = 480, height = 480))
ggplot(motorLAandBL, aes(x=factor(year), y=Emissions, fill=city)) + geom_bar(aes(fill=year),stat="identity") + facet_grid(. ~ City) + guides(fill=FALSE) + xlab("Year") + ylab("PM2.5 Emissions") + ggtitle ("Total PM2.5 Emissions from Motor Vehicle Sources in Baltimore and Los Angeles")
dev.off()

## Response : Los Angeles County has seen greater changes over time in motor vehicle emissions. 



