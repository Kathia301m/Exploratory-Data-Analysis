library(ggplot2)

#Set working directory where it contains the data
setwd("./exdata%2Fdata%2FNEI_data/")

#Read data NEI and SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# ---------------------------------- QUESTION 4 -----------------------------------

#Across the United States, how have emissions from coal combustion-related sources 
#changed from 1999-2008?

# 1- Subsetting only the SCC rows that correspond to coal combustion 
coal <- NEI[which(NEI$SCC %in% SCC[grep("coal",SCC$Short.Name,ignore.case = TRUE),"SCC"]),]

# 2- Drawing the fourth plot
png(file = "plot4.png",width = 800,height = 400,units = "px")

g_coal <- ggplot(coal, aes(x=year, y=Emissions))
g_coal+geom_line(stat = "summary", fun.y="sum",size=1, color ="blue")+
    labs(x="year",y="PM2.5 Emissions from coal combustion-related sources") +
    labs(title = "PM2.5 Emissions from coal combustion-related sources across the US")

dev.off()

# 3- Answer to the question

# In total, there is a decrease of Emissions from coal combusion related sources
# from 1999 to 2008 across the US. 