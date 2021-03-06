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

png(filename='plot1.png', width = 480, height = 480)

with( data, hist(Global_active_power, col='red',main="Global Active Power", 
		 xlab="Global Active Power (kilowatts)",ylab="Frequency"))

dev.off()
