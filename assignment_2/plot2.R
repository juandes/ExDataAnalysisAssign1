#Importing datasets
sccDS <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
neiDS <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
baltimoreCityEmissions <- neiDS[neiDS$fips == "24510",]
emissions <- with(baltimoreCityEmissions, aggregate(Emissions, by = list(year), sum))
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(emissions, type = "b", pch = 15, xlab = "Year", ylab = "Emissions", main = "Amount of emission per year in Baltimore City")
dev.off()