library(ggplot2)

# Set working directory where it contains the data
setwd("./exdata%2Fdata%2FNEI_data/")

# Read data NEI and SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## ---------------------------------- QUESTION 3 -----------------------------------

## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
## variable, which of these four sources have seen decreases in emissions from 1999-2008 
## for Baltimore City? Which have seen increases in emissions from 1999-2008?
## Use the ggplot2 plotting system to make a plot answer this question.

# 1- Subsetting data only from Baltimore
balt <- subset(NEI, fips == "24510")

# 2- Computing the total PM2.5 Emissions from Baltimore
tot_pm_balt <- aggregate(Emissions~year, balt, sum)

# 3- Drawing the plot for Baltimore city
png(file = "plot3.png",width = 1000,height = 500,units = "px")

g_typ <-  ggplot(data = balt, mapping = aes(x= factor(year), y= Emissions, fill =type))
g_typ+geom_bar(stat = "summary", fun.y="sum")+facet_grid(.~ type)+theme_bw()+
    labs(x="year",y="PM2.5 Emissions in Baltimore") + 
    labs(title = "Baltimore's PM2.5 Emissions by Source Types")

dev.off()

# 4-  Answer to the question

# 3 types sources have seen decreases in Baltimore city (1999-2008): Non-road, non-point,on-road
# 1 Type have seen an increase in Baltimore city(1999-2008): POINT

