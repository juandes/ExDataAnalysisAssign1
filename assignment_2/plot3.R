#Importing datasets
sccDS <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
neiDS <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
baltimoreCityEmissions <- neiDS[neiDS$fips == "24510",]
baltimoreCityEmissions$year <- factor(baltimoreCityEmissions$year, levels=c('1999', '2002', '2005', '2008'))
png(filename = "plot3.png", width = 720, height = 480, units = "px")
ggplot(data=baltimoreCityEmissions, aes(x=year, y= Emissions)) + facet_grid(. ~ type) + geom_line() + ggtitle("Emissions in Baltimore City by type")
dev.off()