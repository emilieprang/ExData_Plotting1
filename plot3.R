
#Setting work directory
setwd("/Users/emilienielsen/Documents/Coursera/Project1")

#Read in data
data <- read.table("household_power_consumption.txt", header=T, sep=";")

#Subsetting data
sub <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Transforming sub metering variables into numeric
sub$Sub_metering_1 <- as.numeric(sub$Sub_metering_1)
sub$Sub_metering_2 <- as.numeric(sub$Sub_metering_2)
sub$Sub_metering_3 <- as.numeric(sub$Sub_metering_3)

#Making the plot and saving
png(filename="plot3.png", width = 480, height = 480)

plot(sub$Sub_metering_1, type="n", xaxt="n", xlab="", ylab="Energy sub metering")
lines(sub$Sub_metering_1, col="black")
lines(sub$Sub_metering_2, col="red")
lines(sub$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red","blue"))
axis(1,at=c(1,1+1440,2880), labels=c("Thu", "Fri", "Sat"))

dev.off()



  






