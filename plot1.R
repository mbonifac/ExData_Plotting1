plot1<-function(){
  
  ## Plot 1
  ## Goal is to plot histogram of Global Active Power from 2007-02-01 to 2007-02-02
  ## The file should be unzipped and in your working directory
  
  ## First read the data as a table, replace "?" as na.
  pwrdata <-read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = c("?"))

  ## Change class of Date from "factor" to "Date".
  pwrdata$Date<-as.Date(pwrdata$Date, "%d/%m/%Y")

  ## Keep only data for date range of interest
  pwrdatawork<-pwrdata[(pwrdata$Date == "2007-02-01") | (pwrdata$Date == "2007-02-02"),]

  ## Plot histogram
  hist(pwrdatawork$Global_active_power, col = "red", main = paste("Histogram of", "Global Active Power"), xlab = "Global Active Power (kilowatts)")
  
  ## Save histogram as png file  
  dev.copy(png, "plot1.png", width = 480, height = 480)
  dev.off()
  
  ## Print message indicating location of file
  message("The file plot1.png is located in ", getwd())
  }