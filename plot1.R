
#Setting work directory
setwd("/Users/emilienielsen/Documents/Coursera/Project1")

#Read in data
data <- read.table("household_power_consumption.txt", header=T, sep=";")

#Subsetting data
sub <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Transforming global active power to numeric
sub$Global_active_power <- as.numeric(sub$Global_active_power)

#Making the plot and saving
png(filename="plot1.png", width = 480, height = 480)
hist(sub$Global_active_power, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



