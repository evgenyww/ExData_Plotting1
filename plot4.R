library(sqldf)
library(lubridate)

# read data from file
sqldf() # open a connection
data=read.csv.sql("/Users/evgeny/Downloads/household_power_consumption.txt", sep = ";",
             sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007'",  eol = "\n")
sqldf()

# convert Date and Time columns
data[,"dt"]=dmy_hms(paste(data[,"Date"], data[,"Time"], " "))

# draw plot
png(filename="plot4.png")
par(mfrow=c(2,2))

plot(data[,"dt"], data[,"Global_active_power"], type = 'l', ylab = "Global Active Power", xlab = "", col="black")

plot(data[,"dt"], data[,"Voltage"], type = 'l', ylab = "Voltage", xlab = "datetime", col="black")

plot(data[,"dt"], data[,"Sub_metering_1"], type = 'l', ylab = "Energy sub metering", xlab = "", col="black")
lines(data[,"dt"], data[,"Sub_metering_2"], type = 'l', ylab = "Energy sub metering", xlab = "", col="red")
lines(data[,"dt"], data[,"Sub_metering_3"], type = 'l', ylab = "Energy sub metering", xlab = "", col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, col=c('black', 'red', 'blue'), box.lty=0)

plot(data[,"dt"], data[,"Global_reactive_power"], type = 'l', ylab = "Global_reactive_power", xlab = "datetime", col="black")

dev.off()

