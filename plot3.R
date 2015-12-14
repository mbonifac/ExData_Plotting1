plot3<-function(){
  
  ## Plot 3
  ## Goal is to plot Sub Metering Readings from 2007-02-01 to 2007-02-02 as a line graph
  
  ## First read the data as a table, replace "?" as na.
  pwrdata <-read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = c("?"))
  
  ## Keep only data for date range of interest
  pwrdatawork<-pwrdata[(pwrdata$Date == "1/2/2007") | (pwrdata$Date == "2/2/2007"),]
  
  ## Create new column that contains both time and date
  pwrdatawork$datetime<-paste(pwrdatawork$Date, pwrdatawork$Time, sep = " ")
  
  ## Convert datetime column from character to Date/Time
  pwrdatawork$datetime<-strptime(pwrdatawork$datetime, "%d/%m/%Y %H:%M:%S")
  
  ## Open png file
  library(grDevices)
  png("plot3.png", width = 480, height = 480)
  
  ## Plot Sub_metering_1 data
  plot(pwrdatawork$datetime, pwrdatawork$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  
  ## Add plot for Sub_metering_2 and set to red
  lines(pwrdatawork$datetime, pwrdatawork$Sub_metering_2, type = "l", col = "red")
  
  ## Add plot for Sub_metering_3 and set to blue
  lines(pwrdatawork$datetime, pwrdatawork$Sub_metering_3, type = "l", col = "blue")
  
  ## Add legend
  legend("topright",pch = "_", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## Close device
  dev.off()
  
  ## Print message indicating location of file
  message("The file plot3.png is located at ", getwd())
  }