plot1<-function() {
  # Load the data and make transformations to Date and Time
  data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", nrows=2075260,na.strings = "?")
  data<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
  data$Date<-as.Date(data$Date, format="%d/%m/%Y")
  data$Time <- paste(data$Date, data$Time)
    
  # Construct plot1
  png(file = "plot1.png", width = 480, height = 480)
  par(bg=NA)
  hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()
  
}