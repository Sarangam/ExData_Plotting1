
#read data
df <- read.table("household_power_consumption.txt",sep=";",header = T,
                 colClasses = c("character","character","numeric","numeric","numeric",
                 "numeric","numeric","numeric","numeric"),na.strings="?")

#conver to r time format
df$Date <- as.Date(df$Date,"%d/%m/%Y")

#filter dates
df <- df[df$Date>="2007-02-01" & df$Date<="2007-02-02",]

##name of file
png(file = "Plot1.png",width=480,height=480)

#create hist
hist(df$Global_active_power,col = "Red",xlab="Global Active Power (kilowatts)")

#save the file
dev.off()