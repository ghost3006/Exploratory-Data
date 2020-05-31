#reading the two files
emi <- readRDS("summarySCC_PM25.rds")


#getting the sum of emission
emisum= aggregate(emi$Emissions, by=list(year=emi$year), sum)


## create the plot
png(filename = "plot1.png")
plot(emisum$year, emisum$x, type = "l", 

     main = "Total Emissions of PM2.5 from all sources",
     
     ylab = "Total emissions of PM2.5 (tons)",
     
     xlab = "Year")

dev.off()
