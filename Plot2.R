#reading the two files
emi <- readRDS("summarySCC_PM25.rds")


#getting the sum of emission
baltimore <- subset(emi, emi$fips=="24510")
emisum= aggregate(baltimore$Emissions, by=list(year=baltimore$year), sum)


## create the plot
png(filename = "plot2.png")
plot(emisum$year, emisum$x, type = "l", 
     
     main = "Total Emissions of PM2.5 from Baltimore City",
     
     ylab = "Total emissions of PM2.5 (tons)",
     
     xlab = "Year")

dev.off()