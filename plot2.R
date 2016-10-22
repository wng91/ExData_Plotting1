#We download and unzip the file
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip','power.zip')
t= unzip('power.zip')
#only read the required rows
header=read.table(t,header=TRUE,sep=';',nrow=1)
u=read.table(t,header = FALSE,sep=';',skip= 66637,nrows = 2880,stringsAsFactors = FALSE)
colnames(u)=names(header)

#combine the date and time and change their class
f=paste(u$Date,u$Time)
Day=strptime(f,"%d/%m/%Y %H:%M:%S")
#plot the required graph and save it in png file
png('plot2.png')
plot(Day,u$Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
