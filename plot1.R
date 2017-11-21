library(sqldf)
library(lubridate)

# read data from file
data=read.csv.sql("/Users/evgeny/Downloads/household_power_consumption.txt", sep = ";",
             sql = "select * from file where Date == '1/2/2007' or Date == '2/2/2007'",  eol = "\n")
# convert Date and Time columns
data[,"Date"]=dmy(data[,"Date"])
data[,"Time"]=hms(data[,"Time"])

# draw plot
png(filename="plot1.png")
hist(data[,"Global_active_power"], xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()

