library(dplyr)
library(ggplot2)
unzip("./final-project/exdata_data_NEI_data.zip", exdir = "./final-project")
NEI = readRDS("./final-project/summarySCC_PM25.rds")
SCC = readRDS("./final-project/Source_Classification_Code.rds")

baltimore = subset(NEI, fips=="24510")
byYear = group_by(baltimore, year) %>% summarise(total_emissions = sum(Emissions))

png('./final-project/plot2.png')
plot(byYear$year, byYear$total_emissions/1000000, type="l", xlab = "Year", ylab="PM25", main="Baltimore Emissions By Year")
dev.off()