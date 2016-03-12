# we only need 3rd column
classes = c("character", "NULL", "numeric", "NULL", "NULL", "NULL", "NULL", "NULL", "NULL")

# reding data assuming file is in working directory
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", colClasses = classes)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# only data we need
data <- data[data$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]

# plotting to device png
png("plot1.png", height = 480, width = 480)
hist(data$Global_active_power, col="red", xlab = "global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
