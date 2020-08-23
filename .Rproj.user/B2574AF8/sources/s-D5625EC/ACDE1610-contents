plot_4 = function(df) {
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