## plot 4
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
datetime <- paste(data$Date,data$Time)
datetime <- strptime(datetime,format='%d/%m/%Y %H:%M:%S')

png('plot4.png',width=480,height=480)
Sys.setlocale('LC_ALL','en_US.UTF-8')
par(mfrow=c(2,2))

plot(datetime,data$Global_active_power,xlab='',ylab='Global Active Power',type='l')

plot(datetime, data$Voltage,type='l',xlab='datetime',ylab='Voltage')

plot(datetime,data$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(datetime,data$Sub_metering_2,type='l',col='RED')
lines(datetime,data$Sub_metering_3,type='l',col='BLUE')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lwd=1,col=c('BLACK','RED','BLUE'),cex=.8,bty='n')

plot(datetime,data$Global_reactive_power,ylab='Global_reactive_power',type='l')

dev.off()

