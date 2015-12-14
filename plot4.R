plot4<-function(){

  ## Plot 4
  ## Goal is four plots in a 2 x 2 graphic from 2007-02-01 to 2007-02-02
  ##   Global Active Power line plot (Plot 2)
  ##   Voltage
  ##   Sub Metering (Plot 3)
  ##   Global Reactive Power

  ## First read the data as a table, replace "?" as na.
  pwrdata <-read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = c("?"))

  ## Keep only data for date range of interest
  pwrdatawork<-pwrdata[(pwrdata$Date == "1/2/2007") | (pwrdata$Date == "2/2/2007"),]

  ## Create new column that contains both time and date
  pwrdatawork$datetime<-paste(pwrdatawork$Date, pwrdatawork$Time, sep = " ")

  ## Convert datetime column from character to Date/Time
  pwrdatawork$datetime<-strptime(pwrdatawork$datetime, "%d/%m/%Y %H:%M:%S")

  ## Change class of Date from "factor" to "Date".
  pwrdatawork$Date<-as.Date(pwrdatawork$Date, "%d/%m/%Y")

  ## Set plotting area to 2 x 2
  par(mfrow=c(2,2))
  
  ## Plot Global Active Power
  plot(pwrdatawork$datetime, pwrdatawork$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

  ## Plot Voltage
  plot(pwrdatawork$datetime, pwrdatawork$Voltage,type = "l", ylab = "Voltage", xlab = "datetime")

  ## Plot Sub Metering
  ## Plot Sub_metering_1 data
  plot(pwrdatawork$datetime, pwrdatawork$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  
  ## Add plot for Sub_metering_2 and set to red
  lines(pwrdatawork$datetime, pwrdatawork$Sub_metering_2, type = "l", col = "red")
  
  ## Add plot for Sub_metering_3 and set to blue
  lines(pwrdatawork$datetime, pwrdatawork$Sub_metering_3, type = "l", col = "blue")
  
  ## Add legend
  legend("topright",pch = "_", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  ## Plot Global Reactive Power
  plot(pwrdatawork$datetime, pwrdatawork$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
  
  ## Save plot as png file
  dev.copy(png, "plot4.png", width = 480, height = 480)
  
  ## Close device
  dev.off()
  
  ## Print message indicating location of file
  message("The file plot4.png is located at ", getwd())
  }