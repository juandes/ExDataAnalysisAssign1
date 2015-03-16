sccDS <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
neiDS <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
coal <- sccDS[grepl("coal", sccDS$Short.Name, ignore.case=TRUE),]
mergeDS <- merge(x = neiDS, y = coal, by = "SCC")
mergeDS<- aggregate(mergeDS[, 'Emissions'], by=list(mergeDS$year), sum)
names(mergeDS) <- c("year", "emissions")
png(filename = "plot4.png", width = 550, height = 550, units = "px")
ggplot(data = mergeDS, aes(x = year, y = emissions)) + geom_line(aes(group= 1 , col = emissions)) + geom_point(aes(size = 1, col = emissions)) + ggtitle("Emissions from coal related sources")
dev.off()