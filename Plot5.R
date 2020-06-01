
#reading the two files
emi <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

#vehicle data
vehicleSCC<- scc[grep("Vehicle",scc$EI.Sector),]

#filter NEI to vehicle data
baltimore <- emi[emi$fips == "24510",]
baltimoreVehicleEMI <- baltimore[(baltimore$SCC %in% vehicleSCC$SCC),]

# aggregate total emissions
baltimoreVehicleTotals <- aggregate(Emissions~year, data=baltimoreVehicleEMI, sum)

#plotting the data
png(filename = "plot5.png")
plot <- ggplot(baltimoreVehicleTotals,
               aes(x=factor(year), y=Emissions, fill = Emissions)) +
  geom_bar(stat="identity") +
  scale_fill_gradient("Count", low = "green", high = "red") +
  labs(title = "Total PM2.5 Vehicle Emissions in Baltimore City 1999-2008",
       x = "Year", y = "Total PM2.5 Vehicle Emissions (tons)")
print(plot)
dev.off()
