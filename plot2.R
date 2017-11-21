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
png(filename="plot2.png")
plot(data[,"dt"], data[,"Global_active_power"], type = 'l', ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

