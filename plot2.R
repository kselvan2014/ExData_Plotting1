## Read the data
hpc<- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

## Subset the data
hpc4plot <- subset(hpc, as.Date(Date,"%d/%m/%Y") == "2007-02-01" | as.Date(Date,"%d/%m/%Y") == "2007-02-02")

## Open PNG device
png(filename = "plot2.png",width = 480, height = 480)

## Construct Plot 2
plot(strptime(paste(hpc4plot$Date,hpc4plot$Time, sep = ","), "%d/%m/%Y,%H:%M:%S"), hpc4plot$Global_active_power, 
     type = "o", pch = ".:", xlab = "", ylab = "Global Active Power (kilowatts)")

## Close the PNG file device
dev.off()