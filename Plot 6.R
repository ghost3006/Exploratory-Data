#reading the two files
emi <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

## subset data from Baltimore City, LA county and from type "on road"
car <- subset(emi, emi$fips=="24510" |
                            emi$fips=="06037" &
                            emi$type=="ON-ROAD")
car_year <- aggregate(car$Emissions, 
                             by=list(car$fips, car$year),
                             sum)
colnames(car_year) <- c("City", "Year", "Emissions")

## create plot 
library(ggplot2)
png(filename = "plot6.png")
qplot(Year, Emissions, data = car_year, color = City, geom = "line") +
  ggtitle("Emissions of PM2.5 in Baltimore City and LA County") + 
  ylab("Total Emissions from motor vehicles (tons)") + 
  xlab("Year") 
dev.off()
