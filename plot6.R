library(ggplot2)

#Set working directory where it contains the data
setwd("./exdata%2Fdata%2FNEI_data/")

#Read data NEI and SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## ---------------------------------- QUESTION 6 -----------------------------------
## Compare emissions from motor vehicle sources in Baltimore City with emissions 
## from motor vehicle sources in Los Angeles County, California (fips == "06037").
## Which city has seen greater changes over time in motor vehicle emissions?

# 1- Subsetting only the SCC rows that correspond to Motor Vehicles combustion 

motor_NEI <- NEI[which(NEI$SCC %in% SCC[grep("Motor",SCC$Short.Name,ignore.case = TRUE),"SCC"]),]

# 2- Subsetting only the data corresponding to the cities: Baltimore and LA
cities <- c("06037","24510");motor_cities <- subset(motor_NEI, fips %in% cities)

# 3- Drawing the plot
png(file = "plot6.png",width = 400,height = 400,units = "px")

g_motor_cities <- ggplot(motor_cities, aes(x=year, y=Emissions, color = fips))
g_motor_cities +geom_line(stat = "summary", fun.y="sum",size=1)+
    labs(x="year",y="PM2.5 Emissions") +
    labs(title = "PM2.5 Emissions from Motor Vehicules-related sources in Los Angeles and Baltimore")+
    scale_colour_discrete(name = "Cities", label = c("Los Angeles","Baltimore"))

dev.off()

# 4- Answer to the question

# We have two main observations:
# First, The total emissions from motor vehicle sources in LA is greater
# than the total emissions in Baltimore
# Second, LA is the city that has greater changes over time in motor vehicle 
# emissions, as it increased from 1999 to 2005 and reached a ceiling from
# 2005 to 2008.
