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
  baltimore <<- vehiclesNEI[vehiclesNEI$fips == 24510,]
}

createPlot = function() {

  byYear = group_by(baltimore, year) %>% summarise(total_emissions = sum(Emissions))
  png('./final-project/plot5.png')
  plot = ggplot(byYear, aes(year, total_emissions)) + geom_line() + labs(title="Baltimore Motor Vehicle Pollution By Year", xlab="year", ylab="PM25")
  plot(plot)
  dev.off()
}
