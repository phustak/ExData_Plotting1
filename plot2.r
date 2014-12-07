
# Load, subset and transform data
power<-read.table("household_power_consumption.txt",na.strings="?",sep=";",header=TRUE,colClasses=c("character","character",rep("numeric",7)))
power1<-subset(power,Date=="1/2/2007" | Date=="2/2/2007")
power2<-data.frame(datetime=strptime(paste(power1$Date,power1$Time),"%d/%m/%Y %H:%M:%S"),power1)

# Initialize device (with default size 480x480)
png(file="plot2.png")
# Set background color to transparent
par(bg=NA)
# Draw the chart
with(power2, {
	plot(datetime,Global_active_power,xlab=NA,ylab="Global Active Power (kilowatts)",type="n")
	lines(datetime,Global_active_power)
})
# Close device
dev.off()