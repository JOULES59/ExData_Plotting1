## Getting dataset
dataread <- read.csv('./household_power_consumption.txt', header=T, sep=';', na.strings='?', nrows=2075259, check.names=F, stringsAsFactor=F, comment.char='', quote='\"')

dataread$Date <- as.Date(dataread$Date, format="%d/%m/%Y")

##Subset data
dataset <- subset(dataread, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataread)

##converting dates
datetime <- paste(as.Date(dataset$Date), dataset$Time)
dataset$Datetime <- as.POSIXct(datetime)

##Plot 1
hist(dataset$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', ylab='Frequency', col='Red')

##save file
dev.copy(png, file='plot1.png', height =480, width=480)
dev.off()
