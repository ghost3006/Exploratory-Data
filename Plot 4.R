#reading the files
emi <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

#getting coal combustion related sources
scc.coal <- scc[grep("Coal", scc$EI.Sector, ), ]

emicoal<- emi [emi$SCC %in% scc.coal$SCC, ]
#aggregating the data
emisum <- aggregate(Emissions~year, data=emicoal, sum)

#plotting the data
library(ggplot2)
png(filename = "plot4.png")
plot <- ggplot(emisum, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="identity") +
  scale_fill_gradient("Count", low = "orange", high = "red") +
  labs(title = "Total PM2.5 Coal Emissions in United States 1999-2008",
       x = "Year", y = "Total PM2.5 Coal Emissions (tons)")
print(plot)
dev.off()
