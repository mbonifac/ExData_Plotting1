plot2<-function(){
  
  ## Plot 2
  ## Goal is to plot Global Active Power vs day from 2007-02-01 to 2007-02-02 as a line graph
  
  ## First read the data as a table, replace "?" as na.
  pwrdata <-read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = c("?"))

  ## Keep only data for date range of interest
  pwrdatawork<-pwrdata[(pwrdata$Date == "1/2/2007") | (pwrdata$Date == "2/2/2007"),]

  ## Create new column that contains both time and date
  pwrdatawork$datetime<-paste(pwrdatawork$Date, pwrdatawork$Time, sep = " ")

  ## Convert datetime column from character to Date/Time
  pwrdatawork$datetime<-strptime(pwrdatawork$datetime, "%d/%m/%Y %H:%M:%S")

  ## Plot line graph
  plot(pwrdatawork$datetime, pwrdatawork$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

  ## Save plot as png file
  dev.copy(png, "plot2.png", width = 480, height = 480)
  dev.off()
  
  ## Print message indicating location of file
  message("The file plot2.png is located at ", getwd())
  }