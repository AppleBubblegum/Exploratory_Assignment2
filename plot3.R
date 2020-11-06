setwd('C:/Users/User/Documents/R_tutorial/Exploratory_Assignment2')
library(ggplot2)
NEI <- readRDS("./R/summarySCC_PM25.rds")
SCC <- readRDS("./R/Source_Classification_Code.rds")
NEI <- NEI[NEI$fips == "24510", ]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, NEI, sum)

png('plot3.png')
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)

dev.off()
