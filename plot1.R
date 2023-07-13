library(ggplot2)

# get all data
alldata <- read.table("household_power_consumption.txt",
                   colClasses = c(rep("character",2), rep("numeric",7)),
                   sep =";", header = T, na.strings = "?")

# subset the required data
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
# built histogram


png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

