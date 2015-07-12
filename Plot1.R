##Plot1 Code
#Launch of required library
if (!"dplyr" %in% installed.packages()){ install.packages("dplyr")}
library(dplyr)
#Load dataset from the working directory(It is assumed that the user has already dowloaded the file.)
rawdata<-read.csv("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors=F)
#Isolate the 2-day (2007-02-01/02) dataset required for the plot.
rawdata$Date<-as.Date(rawdata$Date,"%d/%m/%Y")
dataset<-tbl_df(rawdata)
dataset<-filter(dataset,Date=="2007-02-01"|Date=="2007-02-02")
#Plot 1 PNG format
png("Plot1.png",height=480,width=480)
#Plot 1 core code
plot1<-hist(dataset$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",ylab="Frequency",col="red")

dev.off()