##Plot2 Code
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
#Plot 2 PNG format
png("Plot2.png",height=480,width=480)
#Plot 2 core code
plot2<-plot(dataset$Timestamp,dataset$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.off()