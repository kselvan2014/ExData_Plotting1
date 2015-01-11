## Read the data
hpc<- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

## Subset the data
hpc4plot <- subset(hpc, as.Date(Date,"%d/%m/%Y") == "2007-02-01" | as.Date(Date,"%d/%m/%Y") == "2007-02-02")

## Open PNG device
png(filename = "plot3.png",width = 480, height = 480)

## Construct Plot 3
plot(strptime(paste(hpc4plot$Date,hpc4plot$Time, sep = ","), "%d/%m/%Y,%H:%M:%S"), hpc4plot$Sub_metering_1, 
     type = "o", pch = ".:", xlab = "", ylab = "Energy sub metering")
points(strptime(paste(hpc4plot$Date,hpc4plot$Time, sep = ","), "%d/%m/%Y,%H:%M:%S"), hpc4plot$Sub_metering_2, 
       type = "o", pch = ".:", col = "red")
points(strptime(paste(hpc4plot$Date,hpc4plot$Time, sep = ","), "%d/%m/%Y,%H:%M:%S"), hpc4plot$Sub_metering_3, 
       type = "o", pch = ".:", col = "blue")
legend("topright", lwd = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Close the PNG file device
dev.off()