setwd('C:/Users/User/Documents/R_tutorial/Exploratory_Assignment2')
library(ggplot2)
NEI <- readRDS("./R/summarySCC_PM25.rds")
SCC <- readRDS("./R/Source_Classification_Code.rds")
NEI <- NEI[NEI$fips == "24510", ]
NEISCC <- merge(NEI, SCC, by = "SCC")
NEISCC <- NEISCC[NEISCC$type == "ON-ROAD" & NEISCC$fips == "24510",]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year, NEISCC, sum)

png('plot5.png')
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions))
g <- g + geom_line() +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions of vehicle from 1999 to 2008')
print(g)

dev.off()
