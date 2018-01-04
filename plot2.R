#Set working directory where it contains the data
setwd("./exdata%2Fdata%2FNEI_data/")

#Read data NEI and SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## ---------------------------------- QUESTION 2 -----------------------------------

## Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
## system to make a plot answering this question.

# 1-  Subsetting data only from Baltimore
balt <- subset(NEI, fips == "24510")

# 2-  Computing the total PM2.5 Emissions from Baltimore
tot_pm_balt <- aggregate(Emissions~year, balt, sum)

# 3-  Drawing a plot
png(file = "plot2.png",width = 480,height = 480,units = "px")

with(tot_pm_balt,plot(year,Emissions,type="l",
                      xlab = "Year",
                      ylab = "Total PM2.5 in Baltimore", 
                      main = "total PM2.5 Emission from all sources in Baltimore")
)

dev.off()

# 4- Answer to the question

# The total PM2.5 emissions seems to have decreased the first time from 1999 to 2002 to
# approx 2500T, Then increased from 2002 to late 2005 to 3100T, and finally decreased 
# drastically from late 2005 to 2008. Therefore, in total, there is a decrease from 1999 to 2008