library(dplyr)
library(ggplot2)
setData = function() {
  rm(list=ls())
  unzip("./final-project/exdata_data_NEI_data.zip", exdir = "./final-project")
  NEI <<- readRDS("./final-project/summarySCC_PM25.rds")
  SCC <<- readRDS("./final-project/Source_Classification_Code.rds") 
  vehicles <<- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
  vehiclesSCC <<- SCC[vehicles,]$SCC
  vehiclesNEI <<- NEI[NEI$SCC %in% vehiclesSCC,]
  cities <<- vehiclesNEI[(vehiclesNEI$fips == "24510" | vehiclesNEI$fips == "06037"),]
}

createPlot = function() {
  
  byYear <<- group_by(cities, year, fips) %>% summarise(total_emissions = sum(Emissions))
  byYear$city = ifelse(byYear$fips=="24510", "Baltimore", "LA")
  png('./final-project/plot6.png')
  plot = ggplot(byYear, aes(year, total_emissions, col=city)) + geom_line() + labs(title="Pollution By Year LA & Baltimore", xlab="year", ylab="PM25")
  plot(plot)
  dev.off()
}