##Plot4 Code
#Launch of required library
if (!"dplyr" %in% installed.packages()){ install.packages("dplyr")}
library(dplyr)
#Load dataset from the working directory(It is assumed that the user has already dowloaded the file.)
rawdata<-read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=F)
#Isolate the 2-day (2007-02-01/02) dataset required for the plot.
rawdata$Date<-as.Date(rawdata$Date,"%d/%m/%Y")
dataset<-tbl_df(rawdata)
dataset<-filter(dataset,Date=="2007-02-01"|Date=="2007-02-02")
#Find the timestamp of each observation (Date & Time Combination)
dataset$Timestamp<-as.POSIXct(paste(dataset$Date,dataset$Time),format="%Y-%m-%d %H:%M:%S")
##Core Plot Code
#Plot 4 PNG format
png("Plot4.png",height=480,width=480)
#Create 4-panel window
par(mfcol=c(2,2)) 
#Plot A
plotA<-plot(dataset$Timestamp,dataset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#Plot B
plotB<-plot(dataset$Timestamp,dataset$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
plotB<-lines(dataset$Timestamp,dataset$Sub_metering_2,type="l",col="red")
plotB<-lines(dataset$Timestamp,dataset$Sub_metering_3,type="l",col="blue")
legend('topright',legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(1,1),col=c("black","red","blue"),bty="n")
#Plot C
plotC<-plot(dataset$Timestamp,dataset$Voltage,type="l",ylab="Voltage",xlab="datetime")
#Plot D
plotD<-plot(dataset$Timestamp,dataset$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()

