plotData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")
plotsz <- subset(plotData, Date == "2007-02-01"| plotData$Date == "2007-02-02")

plotsz$DateTime <- paste(plotsz$Date, " ", plotsz$Time)

plotsz$DateTime <- strptime(plotsz$DateTime, format = "%Y-%m-%d %H:%M:%S")

png(filename = "Plot3.png")
par(mar = c(4, 5, 0.1, 2))
plot(plotsz$DateTime,plotsz$Sub_metering_1,type="l",col="black", xlab = "", ylab = "Energy sub metering")
lines(plotsz$DateTime,plotsz$Sub_metering_2,col="red")
lines(plotsz$DateTime,plotsz$Sub_metering_3,col="blue")

legend("topright", lwd = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black","red", "blue"))

dev.off()
