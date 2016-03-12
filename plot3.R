# we only need 3rd column
classes = c("character", "character", "numeric", "NULL", "NULL", "NULL", "numeric", "numeric", "numeric")

# reding data assuming file is in working directory
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", colClasses = classes)

# filtering
data$date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

# datetime
data$date <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#plot
png("plot3.png", height = 480, width = 480)
with(data, plot(date, Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub metering"))
with(data, lines(date, Sub_metering_1, col = "black"))
with(data, lines(date, Sub_metering_2, col = "red"))
with(data, lines(date, Sub_metering_3, col = "blue"))
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
dev.off()
