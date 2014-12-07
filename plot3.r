
power<-read.table("household_power_consumption.txt",na.strings="?",sep=";",header=TRUE,colClasses=c("character","character",rep("numeric",7)))
power1<-subset(power,Date=="1/2/2007" | Date=="2/2/2007")
power2<-data.frame(datetime=strptime(paste(power1$Date,power1$Time),"%d/%m/%Y %H:%M:%S"),power1)

png(file="plot3.png")
par(bg=NA)
with(power2, {
	plot(datetime,Sub_metering_1,xlab=NA,ylab="Energy sub metering",type="n")
	legend("topright",lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	lines(datetime,Sub_metering_1,col="black")
	lines(datetime,Sub_metering_2,col="red")
	lines(datetime,Sub_metering_3,col="blue")    
})
dev.off()
