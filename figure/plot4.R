#read data
df <- read.table("household_power_consumption.txt",sep=";",header = T,
                 colClasses = c("character","character","numeric","numeric","numeric",
                                "numeric","numeric","numeric","numeric"),na.strings="?")

#conver to r time format
df$Date <- as.Date(df$Date,"%d/%m/%Y")

#filter dates
df <- df[df$Date>="2007-02-01" & df$Date<="2007-02-02",]

#create datetime
df$Datetime <- paste(as.Date(df$Date),df$Time)
df$Datetime <- as.POSIXct(df$Datetime)

##name of file
png(file = "Plot4.png",width=480,height=480)


#create multiple plot

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(df, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

#save the file
dev.off()