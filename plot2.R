plot2<-function() {
  # Load the data and make transformations to Date and Time
  data<-read.table("household_power_consumption.txt",header=TRUE, sep=";", nrows=2075260,na.strings = "?")
  data<-data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
  data$Date<-as.Date(data$Date, format="%d/%m/%Y")
  data$Time <- paste(data$Date, data$Time)
    
  # Construct plot2
  Sys.setlocale("LC_TIME", "English")
  png(file = "plot2.png", width = 480, height = 480)
  par(bg=NA)
  plot(as.factor(data$Time), data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", xaxt = "n", type="n")
  lines(as.factor(data$Time), data$Global_active_power)
  axis(side = 1, at=c(1,length(data$Time)/2,length(data$Time)), labels=weekdays(c(data$Date[1],data$Date[1441],(data$Date[2880])+1), abbreviate=TRUE))
  dev.off()
  
}