plotData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")
plotsz <- subset(plotData, Date == "2007-02-01"| plotData$Date == "2007-02-02")

plotsz$DateTime <- paste(plotsz$Date, " ", plotsz$Time)

plotsz$DateTime <- strptime(plotsz$DateTime, format = "%Y-%m-%d %H:%M:%S")

png(filename = "Plot4.png")

par(mfrow = c(2,2))

plot(plotsz$DateTime, plotsz$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(plotsz$DateTime, plotsz$Voltage, type = "l", lty = 1,  xlab = "datetime", ylab = "Voltage")

plot(plotsz$DateTime,plotsz$Sub_metering_1,type="n", xlab = "", ylab = "Energy sub metering")
lines(plotsz$DateTime,plotsz$Sub_metering_1,col="black")
lines(plotsz$DateTime,plotsz$Sub_metering_2,col="red")
lines(plotsz$DateTime,plotsz$Sub_metering_3,col="blue")
legend("topright", lwd = c(1,1,1), lty = c(1,1,1), col = c("black","red", "blue"), bty = "n",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)

plot(plotsz$DateTime, plotsz$Global_reactive_power, type = "l",  xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
