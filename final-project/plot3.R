library(dplyr)
library(ggplot2)
unzip("./final-project/exdata_data_NEI_data.zip", exdir = "./final-project")
NEI = readRDS("./final-project/summarySCC_PM25.rds")
SCC = readRDS("./final-project/Source_Classification_Code.rds")

baltimore = subset(NEI, fips=="24510")
byYear = group_by(baltimore, year, type) %>% summarise(total_emissions = sum(Emissions))

png('./final-project/plot3.png')
plot = ggplot(byYear, aes(year, total_emissions, col=type)) + geom_line() + labs(title="Baltimore Pollution By Year and Type", xlab="year", ylab="PM25")
plot(plot)
dev.off()