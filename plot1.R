## Read the data
hpc<- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)

## Subset the data
hpc4plot <- subset(hpc, as.Date(Date,"%d/%m/%Y") == "2007-02-01" | as.Date(Date,"%d/%m/%Y") == "2007-02-02")

## Open PNG device
png(filename = "plot1.png",width = 480, height = 480)

## Construct Plot 1
hist(hpc4plot$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

## Close the PNG file device
dev.off()