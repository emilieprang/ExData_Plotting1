
#Setting work directory
setwd("/Users/emilienielsen/Documents/Coursera/Project1")

#Read in data
data <- read.table("household_power_consumption.txt", header=T, sep=";")

#Subsetting data
sub <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Transforming variables into numeric
sub$Global_active_power <- as.numeric(sub$Global_active_power)
sub$Global_reactive_power <- as.numeric(sub$Global_reactive_power)
sub$Voltage <- as.numeric(sub$Voltage)
sub$Sub_metering_1 <- as.numeric(sub$Sub_metering_1)
sub$Sub_metering_2 <- as.numeric(sub$Sub_metering_2)
sub$Sub_metering_3 <- as.numeric(sub$Sub_metering_3)

#Splitting the plot window in 2 rows and 2 columns
#and removing some margins in top
par(mfrow=c(2,2), mar=c(5.1, 4.1, 3.1, 2.1))

#Plot top left
plot(sub$Global_active_power, type="n", xaxt="n", xlab="", ylab="Global Active Power")
lines(sub$Global_active_power)
axis(1,at=c(1,1+1440,2880), labels=c("Thu", "Fri", "Sat"))

#Plot top right
plot(sub$Voltage, type="n", xaxt="n", xlab="datetime", ylab="Voltage")
lines(sub$Voltage)
axis(1,at=c(1,1+1440,2880), labels=c("Thu", "Fri", "Sat"))

#Plot bottom left
plot(sub$Sub_metering_1, type="n", xaxt="n", xlab="", ylab="Energy sub metering")
lines(sub$Sub_metering_1, col="black")
lines(sub$Sub_metering_2, col="red")
lines(sub$Sub_metering_3, col="blue")
legend(1000,41, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red","blue"), bty="n")
axis(1,at=c(1,1+1440,2880), labels=c("Thu", "Fri", "Sat"))

#Plot bottom right
plot(sub$Global_reactive_power, type="n", xaxt="n", xlab="datetime", ylab="Global_reactive_power")
lines(sub$Global_reactive_power)
axis(1,at=c(1,1+1440,2880), labels=c("Thu", "Fri", "Sat"))

#Copying the plot and saving
dev.copy(png, width = 480, height = 480, file="plot4.png")
dev.off()



  






