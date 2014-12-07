

power<-read.table("household_power_consumption.txt",na.strings="?",sep=";",header=TRUE,colClasses=c("character","character",rep("numeric",7)))
power1<-subset(power,Date=="1/2/2007" | Date=="2/2/2007")
power2<-data.frame(datetime=strptime(paste(power1$Date,power1$Time),"%d/%m/%Y %H:%M:%S"),power1)

png(file="plot4.png")
par(mfrow=c(2,2))
with(power2, {
	plot(datetime,Global_active_power,xlab=NA,ylab="Global Active Power",type="n")
	lines(datetime,Global_active_power)
	
	plot(datetime,Voltage,type="n")
	lines(datetime,Voltage)

	plot(datetime,Sub_metering_1,xlab=NA,ylab="Energy sub metering",type="n")
	legend("topright",lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
	lines(datetime,Sub_metering_1,col="black")
	lines(datetime,Sub_metering_2,col="red")
	lines(datetime,Sub_metering_3,col="blue")    

	plot(datetime,Global_reactive_power,type="n")
	lines(datetime,Global_reactive_power)
})
dev.off()
