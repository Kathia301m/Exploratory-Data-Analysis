library(ggplot2)

#Set working directory where it contains the data
setwd("./exdata%2Fdata%2FNEI_data/")

#Read data NEI and SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## ---------------------------------- QUESTION 5 -----------------------------------
## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# 1- Subsetting only the SCC rows that correspond to Motor Vehicles combustion from the database corresponding to Baltimore City (balt)
motor_balt <- balt[which(balt$SCC %in% SCC[grep("Motor",SCC$Short.Name,ignore.case = TRUE),"SCC"]),]

# 2- Drawing the plot
png(file = "plot5.png",width = 800,height = 400,units = "px")

g_motor_balt <- ggplot(motor_balt, aes(x=year, y=Emissions))
g_motor_balt+geom_line(stat = "summary", fun.y="sum",size=1)+
    labs(x="year",y="PM2.5 Emissions") +
    labs(title = "PM2.5 Emissions from Motor Vehicules-related sources in Baltimore City")

dev.off()

# 3- Answer to the question

# 3 Phases of changes in emissions from motor vehicles sources in Baltimore(1999-2008)
# First, an exponential increase of Emission from motor vehicle sources from 1999 to 2002
# Then, it reached a ceiling from 2002 to 2005
# Finally, it decreased from 2005 to 2008

