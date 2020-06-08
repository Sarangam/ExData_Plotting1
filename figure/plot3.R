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
png(file = "Plot3.png",width=480,height=480)

#create multiple line plot
with(df,{
  plot(y=Sub_metering_1,x=Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(y=Sub_metering_2,x=Datetime,col='Red')
  lines(y=Sub_metering_3,x=Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#save the file
dev.off()