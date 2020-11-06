setwd('C:/Users/User/Documents/R_tutorial/Exploratory_Assignment2')
library(ggplot2)
NEI <- readRDS("./R/summarySCC_PM25.rds")
SCC <- readRDS("./R/Source_Classification_Code.rds")
NEI <- NEI[NEI$fips == "24510", ]
NEISCC <- merge(NEI, SCC, by = "SCC")
coal <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
NEISCC <- NEISCC[coal,]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year, NEISCC, sum)

png('plot4.png')
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions))
g <- g + geom_line() +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions of coal from 1999 to 2008')
print(g)

dev.off()
