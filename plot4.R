#We download and unzip the file
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip','power.zip')
t= unzip('power.zip')
#only read the required rows
header=read.table(t,header=TRUE,sep=';',nrow=1)
u=read.table(t,header = FALSE,sep=';',skip= 66637,nrows = 2880,stringsAsFactors = FALSE)
colnames(u)=names(header)

#combine the date and time and change their class
f=paste(s$Date,s$Time)
Day=strptime(f,"%d/%m/%Y %H:%M:%S")
#plot the required graph and save it in png file

png('plot4.png')

par(mfrow=c(2,2))
plot(Day,u$Global_active_power,type="l",xlab="", ylab="Global Active Power ")
plot(Day,u$Voltage,type="l",xlab="datetime ", ylab="Voltage")
plot(Day,u$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(Day,u$Sub_metering_2,col='red')
lines(Day,u$Sub_metering_3,col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty = 1,col = c('black','red','blue'),cex = 0.5)
plot(Day,u$Global_reactive_power,type="l",xlab="datetime ", ylab="Global_reactive_power")
dev.off()