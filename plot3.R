#Plot 3

#read the data as table make ? values into NA
df_house <- read.table ("household_power_consumption.txt", header = TRUE, sep= ";",na.strings= c("?"))
# I had issues with the as.date function so decided because of the time to read is as character
# and subset it accordingly
df_house$Date <- as.character(df_house$Date)
df_house_2 <- subset(df_house, Date == "1/2/2007"| Date =="2/2/2007")
df_house_2$DateTime <- paste(df_house_2$Date,df_house_2$Time, sep= " ")
df_house_2$Date <- as.Date(df_house_2$Date, format = "%d/%m/%Y")
df_house_2$DateTime <- strptime(df_house_2$DateTime,format= "%Y-%m-%d %H:%M:%S")

#create the histogramg and save it to plot3.png
png(file = "plot3.png", bg = "transparent", width= 768, height= 768)
plot(df_house_2$DateTime,df_house_2$Sub_metering_1,type = "l",ylab="Energy sub metering",xlab = "")
lines(df_house_2$DateTime,df_house_2$Sub_metering_2,type="l", col="red")
lines(df_house_2$DateTime,df_house_2$Sub_metering_3, type= "l", col= "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c("black","red","blue"),lty= 1)
dev.off()

