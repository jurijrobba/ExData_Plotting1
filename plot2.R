# we only need 3rd column
classes = c("character", "character", "numeric", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL")

# reding data assuming file is in working directory
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", colClasses = classes)

# filtering
data$date <- as.Date(data$Date, "%d/%m/%Y")
data <- data[data$date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

data$date <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# plot
png("plot2.png", height = 480, width = 480)
with(data, plot(date, Global_active_power, type="n", xlab="", ylab="Global Active Power (killowatts)"))
with(data, lines(date, Global_active_power))
dev.off()
