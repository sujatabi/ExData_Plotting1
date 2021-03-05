library(lubridate)
power<- read.csv("./household_power_consumption.txt",header=TRUE,sep =";",na.strings="?")

power$Date <- as.Date(power$Date,"%d/%m/%Y")

powerfeb <- subset(power,power$Date==as.Date("2007-02-01")|power$Date==as.Date("2007-02-02"))

powerfeb$datetime <- paste(powerfeb$Date, powerfeb$Time)
powerfeb$datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

plot(powerfeb$datetime,powerfeb$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")

## Copy my plot to a PNG file
dev.copy(png, file = "./plot2.png", width = 480, height = 480)

## Don't forget to close the PNG device!
dev.off()