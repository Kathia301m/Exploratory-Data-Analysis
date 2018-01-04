#Set working directory where it contains the data
setwd("./exdata%2Fdata%2FNEI_data/")

#Read data NEI and SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## ---------------------------------- QUESTION 1 -----------------------------------

## Using the base plotting system, now we plot the total PM2.5 Emission 
## from all sources

# 1- Compute total PM2.5 per year and for all the sources

tot_pm <- aggregate(Emissions~year, NEI, sum)

# 2- Drawing the plot

png(file = "plot1.png",width = 480,height = 480,units = "px")

with(tot_pm,plot(year,Emissions,type="l",
                 ylab = "Total PM2.5 Emissions",
                 xlab = "year", 
                 main = "total PM2.5 Emission from all sources")
)

dev.off()

# 3- Answer to the question 
# There is a decrease of rge total PM2.5 Emission from 1999 to 2018
# (it has to be confirmed with statistical analysis though)
