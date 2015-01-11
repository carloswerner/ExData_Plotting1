plot3<-function() {
  # Load the data and make transformations to Date and Time
  data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", nrows=2075260,na.strings = "?")
  data<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
  data$Date<-as.Date(data$Date, format="%d/%m/%Y")
  data$Time <- paste(data$Date, data$Time)
    
  # Construct plot3
  Sys.setlocale("LC_TIME", "English")
  png(file = "plot3.png", width = 480, height = 480)
  par(bg=NA)
  plot(as.factor(data$Time), data$Sub_metering_1, xlab="", ylab="Energy sub metering", xaxt = "n", type = "n")
  lines(as.factor(data$Time), data$Sub_metering_1, col="black")
  lines(as.factor(data$Time), data$Sub_metering_2, col="red")
  lines(as.factor(data$Time), data$Sub_metering_3, col="blue")
  legend("topright",lty=1, lwd=2, col=(c("black","red","blue")), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  axis(side = 1, at=c(1,length(data$Time)/2,length(data$Time)), labels=weekdays(c(data$Date[1],data$Date[1441],(data$Date[2880])+1), abbreviate=TRUE))
  dev.off()
  
}