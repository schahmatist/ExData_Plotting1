library(utils)
library(dplyr)

# Please uncomment if you need to reload data and create a dataframe.
#
# if (!file.exists("household_power_consumption.txt") && !file.exists("household_power_consumption.zip")) {
# download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',destfile='household_power_consumption.zip', method='cur')
# unzip ("household_power_consumption.zip")
# } else {
# print("File Exists")
# }
#
# data=read.table(file='household_power_consumption.txt', header=TRUE, sep=";", na.strings="?")


# data<-data %>%
#         mutate(DateTime=paste(Date,Time,sep=' ')) %>%
#         mutate(DateTime=strptime(DateTime,'%d/%m/%Y %H:%M:%S')) %>%
#         mutate(Date=as.Date(Date,'%d/%m/%Y')) %>%
#         mutate(Time=strptime(Time,'%H:%M:%S')) %>%
#         filter(format(Date,'%d/%m/%Y')=='01/02/2007'| format(Date,'%d/%m/%Y')=='02/02/2007')

png(filename='plot4.png', width = 480, height = 480)

# creating frame 
par(mfrow = c(2, 2), mar = c(5, 4, 1, 1))

# Plotting first plot
plot(data$DateTime,data$Global_active_power,type='l',xlab="",ylab="Global Active Power")

# Plotting second plot
plot(data$DateTime,data$Voltage,type='l',xlab="datetime",ylab="Voltage")

# Plotting third plot
with(data, plot(DateTime, Sub_metering_1, type='n', xlab="", ylab="Energy sub metering"))
{
labels<-names(select(data, starts_with("Sub")))
with(data, points(DateTime, Sub_metering_1, type='l'))
with(data, points(DateTime, Sub_metering_2, type='l',col='red'))
with(data, points(DateTime, Sub_metering_3, type='l',col='blue'))
legend("topright", lty=1, col = c("black","red","blue"), legend = labels)
}

# Plotting fourth plot
plot(data$DateTime,data$Global_reactive_power,type='l',xlab="datetime")

dev.off()







