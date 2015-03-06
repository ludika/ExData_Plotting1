plotdata<-read.csv("subset-for-plots.csv", na.strings = "?")
names(plotdata)<-c("n","date","time","active_power","reactive_power",
                   "voltage","intensity","sub_met1","sub_met2","sub_met3")
png(filename="plot2.png", width = 480, height = 480)
plotdata$datetime<-paste(plotdata$date, plotdata$time)
plotdata<-as.data.frame(plotdata)                        
plotdata$datetime<- strptime(plotdata$datetime, format="%Y-%m-%d %H:%M:%S")

with (plotdata, { plot(datetime, active_power, xlab = "",  ylab = "Global Active Power (kilowatts)", type="n")
                  lines(datetime , active_power, type ="l")
                })

dev.off()