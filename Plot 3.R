#reading the data
emi <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

#subsetting and aggregating data
baltimore<- subset(emi, emi$fips=="24510")
emisum <- aggregate(baltimore$Emissions, by=list(baltimore$type, baltimore$year), sum)
colnames(emisum) <- c("Type", "Year", "Emissions")

#plotting
library(ggplot2)
png(filename = "Plot3.png")
plot3 <- qplot(Year, Emissions, data=emisum, facets = . ~ Type) +  
  geom_line() +
  xlab("Year") +
  ylab('PM2.5 Emissions (tons)') +
  ggtitle('Total PM2.5 Emissions in Baltimore City')
print(plot3)
dev.off()