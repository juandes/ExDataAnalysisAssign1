#Importing datasets
sccDS <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
neiDS <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
emissions <- with(neiDS, aggregate(Emissions, by = list(year), sum))
png(filename = "plot1.png", width = 480, height = 480, units = "px")
plot(emissions, type = "b", pch = 15, xlab = "Year", ylab = "Emissions", main = "Amount of emission per year")
dev.off()