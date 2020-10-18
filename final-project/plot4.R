library(dplyr)
library(ggplot2)
loadData = function() {
  unzip("./final-project/exdata_data_NEI_data.zip", exdir = "./final-project")
  NEI <<- readRDS("./final-project/summarySCC_PM25.rds")
  SCC <<- readRDS("./final-project/Source_Classification_Code.rds") 
}

createPlot = function() {
  merged = merge(NEI, SCC, by="SCC")
  coal = merged[which(merged$EI.Sector=="Fuel Comb - Electric Generation - Coal"),]
  byYear = group_by(coal, year) %>% summarise(total_emissions=sum(Emissions))
  png('./final-project/plot4.png')
  plot = ggplot(byYear, aes(year, total_emissions)) + geom_line() + labs(title="US Coal Combustion Pollution By Year", xlab="year", ylab="PM25")
  plot(plot)
  dev.off()
}
