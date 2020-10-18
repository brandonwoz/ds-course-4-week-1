library(dplyr)
library(ggplot2)
unzip("./final-project/exdata_data_NEI_data.zip", exdir = "./final-project")
NEI = readRDS("./final-project/summarySCC_PM25.rds")
SCC = readRDS("./final-project/Source_Classification_Code.rds")

emissionsByYear = group_by(NEI, year) %>% summarise(total_emissions = sum(Emissions))

png("./final-project/plot1.png")
plot(emissionsByYear$year, emissionsByYear$total_emissions/1000000, type="l", xlab ="Year", ylab="Tons of PM25 Emissions (millions)", main="Emissions from 1999-2008")
dev.off()