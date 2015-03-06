plotdata<-read.csv("subset-for-plots.csv", na.strings = "?")
names(plotdata)<-c("n","date","time","active_power","reactive_power",
                   "voltage","intensity","sub_met1","sub_met2","sub_met3")
png(filename="plot3.png", width = 480, height = 480)
plotdata$datetime<-paste(plotdata$date, plotdata$time)
plotdata<-as.data.frame(plotdata)                        
plotdata$datetime<- strptime(plotdata$datetime, format="%Y-%m-%d %H:%M:%S")

with (plotdata, { 
  plot(datetime, sub_met1, xlab = "",  ylab = "Energy sub metering", type="n")
  legend("topright", col=c("Black" , "Red" , "Blue"),
  legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  lines(datetime , sub_met1, type ="l", col="Black")
  lines(datetime , sub_met2, type ="l", col="Red")
  lines(datetime , sub_met3, type ="l", col="Blue")
})
dev.off()