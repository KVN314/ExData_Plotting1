library(ggplot2)
library(gridExtra)

# get all data
alldata <- read.table("household_power_consumption.txt",
                      colClasses = c(rep("character",2), rep("numeric",7)),
                      sep =";", header = T, na.strings = "?")

# subset the required data
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data <- cbind(data, datetime)
# built the plots

png("plot4.png", width = 480, height = 480)
plot_1<-ggplot(data, aes(x = datetime,y = Global_active_power)) + 
  geom_line() +
  scale_x_datetime(date_labels = "%a", date_breaks = "1 day") +
  xlab("") + theme_bw()
plot_2<-ggplot(data, aes(x = datetime)) + 
  geom_line(aes(y = Sub_metering_1, colour = "Sub_metering_1")) +
  geom_line(aes(y = Sub_metering_2, colour = "Sub_metering_2")) +
  geom_line(aes(y = Sub_metering_3, colour = "Sub_metering_3")) +
  scale_x_datetime(date_labels = "%a", date_breaks = "1 day") +
  xlab("") + ylab("Energy sub metering") +
  theme_bw() + theme(legend.position = c(0.85,0.85))
plot_3<-ggplot(data, aes(x = datetime,y = Voltage)) + 
  geom_line() +
  scale_x_datetime(date_labels = "%a", date_breaks = "1 day") +
  theme_bw()
plot_4<-ggplot(data, aes(x = datetime,y = Global_reactive_power)) + 
  geom_line() +
  scale_x_datetime(date_labels = "%a", date_breaks = "1 day") +
  theme_bw()
grid.arrange(plot_1, plot_3,
             plot_2, plot_4,
             ncol = 2, nrow = 2)
dev.off()

