setwd('C:/Users/User/Documents/R_tutorial/Exploratory_Assignment2')

NEI <- readRDS("./R/summarySCC_PM25.rds")
SCC <- readRDS("./R/Source_Classification_Code.rds")
NEI <- NEI[NEI$fips == "24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot2.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, 
        xlab="years", 
        ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()
