
create_plots = function() {
  library(data.table)
  library(lubridate)
  
  read_data = function() {
    filepath =  "./week-1-assignment/data/exdata_data_household_power_consumption.zip"
    file = unzip(filepath, exdir = "./week-1-assignment/data")
    power.df = fread(file, sep=";", header=T)
    power.df$Date = as.POSIXct(power.df$Date, format="%d/%m/%Y")
    power.df = power.df[power.df$Date == "2007-02-01" | power.df$Date == "2007-02-02"]
  }
  
  clean_data = function(df) {
    df$Global_active_power = as.numeric(df$Global_active_power)
    df$Global_reactive_power = as.numeric(df$Global_reactive_power)
    df$Voltage = as.numeric(df$Voltage)
    df$Global_intensity = as.numeric(df$Global_intensity)
    df$Sub_metering_1 = as.numeric(df$Sub_metering_1)
    df$Sub_metering_2 = as.numeric(df$Sub_metering_2)
    df$Sub_metering_3 = as.numeric(df$Sub_metering_3)
    colnames(df) = c("date", "time", "active", "reactive", "voltage", 
                     "intensity", "sub1", "sub2", "sub3")
    df$time = as.POSIXct(df$time, format="%H:%M:%S")
    df$time = strftime(df$time, format="%H:%M:%S")
    df$datetime = as.POSIXct(paste(df$date, df$time, sep=" "), format="%Y-%m-%d %H:%M:%S")
    df
  }
  
  make_plots = function(df) {
    
    png("./week-1-assignment/output/plot_1.png")
    hist(df$active, col="red", main="Global Active Power",
         ylab="Frequency", xlab="Global Active Power (kilowatts)")
    dev.off()
    
    png("./week-1-assignment/output/plot_2.png")
    plot(df$datetime, df$active, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
    
    png("./week-1-assignment/output/plot_3.png")
    plot(df$datetime, df$sub1, type="l", xlab="", ylab="Energy sub metering")
    lines(df$datetime, df$sub2, col="red")
    lines(df$datetime, df$sub3, col="blue")
    legend("topright", col=c("black", "red", "blue"), 
           c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
           lty=c(1, 1), lwd=c(1, 1))
    dev.off()
    
    png("./week-1-assignment/output/plot_4.png")
    par(mfrow=c(2, 2))
    plot(df$datetime, df$active, xlab="", ylab="Global Active Power", type="l")
    plot(df$datetime, df$voltage, type="l", xlab="datetime", ylab="Voltage")
    
    plot(df$datetime, df$sub1, type="l", xlab="", ylab="Energy sub metering")
    lines(df$datetime, df$sub2, col="red")
    lines(df$datetime, df$sub3, col="blue")
    legend("topright", col=c("black", "red", "blue"), 
           c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
           lty=c(1,1), lwd=c(1, 1), bty="n")
    
    plot(df$datetime, df$reactive, type="l", xlab="datetime", 
         ylab="Global_reactive_power")
    dev.off()
     
  }
  
  data = read_data();
  tidy_data = clean_data(data)
  make_plots(tidy_data)
}
