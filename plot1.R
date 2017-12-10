plotData <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

plotData$Date <- as.Date(plotData$Date, format = "%d/%m/%Y")
plotsz <- subset(plotData, Date == "2007-02-01"| plotData$Date == "2007-02-02")

plotsz$DateTime <- paste(plotsz$Date, " ", plotsz$Time)

plotsz$DateTime <- strptime(plotsz$DateTime, format = "%Y-%m-%d %H:%M:%S")

png(filename = "Plot1.png")

hist(plotsz$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
