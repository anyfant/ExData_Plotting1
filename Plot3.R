##Plot3 Code
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
#Plot 3 core code
plot3<-plot(dataset$Timestamp,dataset$Sub_metering_1,type="l",ylab="Energy sub metering",cex.lab=0.8,xlab="")
plot3<-lines(dataset$Timestamp,dataset$Sub_metering_2,type="l",col="red")
plot3<-lines(dataset$Timestamp,dataset$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"),cex=0.6)
#Plot 3 transfer to PNG format
dev.copy(png,"Plot3.png")
dev.off()