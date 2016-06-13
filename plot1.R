#Plot 1

#read the data as table make ? values into NA
df_house <- read.table ("household_power_consumption.txt", header = TRUE, sep= ";",na.strings= c("?"))
# I had issues with the as.date function so decided because of the time to read is as character
# and subset it accordingly
df_house$Date <- as.character(df_house$Date)
df_house_2 <- subset(df_house, Date == "1/2/2007"| Date =="2/2/2007")

#create the histogramg and save it to plot1.png
png(file = "plot1.png", bg = "transparent")
hist(df_house_2$Global_active_power,freq = TRUE, col = "red",xlab= "Global active power (kilowatts)",main = "Global active Power")
dev.off()

