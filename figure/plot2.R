
#read data
df <- read.table("household_power_consumption.txt",sep=";",header = T,
                 colClasses = c("character","character","numeric","numeric","numeric",
                                "numeric","numeric","numeric","numeric"),na.strings="?")

#conver to r time format
df$Date <- as.Date(df$Date,"%d/%m/%Y")

#filter dates
df <- df[df$Date>="2007-02-01" & df$Date<="2007-02-02",]

#create datetime
df$Datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(df$Datetime)

##name of file
png(file = "Plot2.png",width=480,height=480)

#create line plot
with(df,plot(x=Datetime,y=Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))


#save the file
dev.off()