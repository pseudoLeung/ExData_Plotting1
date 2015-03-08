## plot1
fileName <- 'exdata-data-household_power_consumption.zip'
dataName <- 'household_power_consumption.txt'
url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
if( !file.exists(fileName)){
    download.file(url,fileName)
}
unzip(fileName)

## read data
data <- read.table('household_power_consumption.txt',header=FALSE,skip=66637,nrows=2880,sep=';',colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
colnames(data) <- c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3')

## get datetime
## datetime <- paste(data$Date,data$Time)
## datetime <- strptime(datetime,format='%d/%m/%Y %H:%M:%S')

## plot 1
png('plot1.png')
hist(data$Global_active_power,col='RED',main='Global Active Power',xlab='Global Active Power(kilowatts)')
dev.off()

