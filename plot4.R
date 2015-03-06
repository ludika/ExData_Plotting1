plotdata<-read.csv("subset-for-plots.csv", na.strings = "?")
names(plotdata)<-c("n","date","time","active_power","reactive_power",
                   "voltage","intensity","sub_met1","sub_met2","sub_met3")
png(filename="plot4.png", width = 480, height = 480)

par (mfrow = c(2,2), mar = c(4,4,2,2))

plotdata$datetime<-paste(plotdata$date, plotdata$time)
plotdata<-as.data.frame(plotdata)                        
plotdata$datetime<- strptime(plotdata$datetime, format="%Y-%m-%d %H:%M:%S")

with (plotdata, { 
  
## plot 1
  plot(datetime, active_power, xlab = "",  ylab = "Global Active Power", type="n")
  lines(datetime , active_power, type ="l")

## plot 2
plot(datetime, voltage, xlab = "datetime",  ylab = "Voltage", type="n")
lines(datetime , voltage, type ="l", col="Black")

## plot 3
plot(datetime, sub_met1, xlab = "",  ylab = "Energy sub metering", type="n")
legend("topright", col=c("Black" , "Red" , "Blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
lines(datetime , sub_met1, type ="l", col="Black")
lines(datetime , sub_met2, type ="l", col="Red")
lines(datetime , sub_met3, type ="l", col="Blue")

## plot 4
plot(datetime, reactive_power, xlab = "datetime",  ylab = "Global_reactive_power", type="n")
lines(datetime, reactive_power, type ="l")
})
dev.off()