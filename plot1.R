#We download and unzip the file
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip','power.zip')
t= unzip('power.zip')
#only read the required rows
header=read.table(t,header=TRUE,sep=';',nrow=1)
u=read.table(t,header = FALSE,sep=';',skip= 66637,nrows = 2880,stringsAsFactors = FALSE)
colnames(u)=names(header)
#plot the histogram and save in png file
png('plot1.png')
hist(u$Global_active_power,col='red',main='Global Active Power',ylab = 'Frequency',xlab='Global Active Power(kilowatts) ')
dev.off 