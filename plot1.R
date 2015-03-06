plotdata<-read.csv("subset-for-plots.csv", na.strings = "?")
names(plotdata)<-c("n","date","time","active_power","reactive_power",
                   "voltage","intensity","sub_met1","sub_met2","sub_met3")
png(filename="plot1.png", width = 480, height = 480)

with (plotdata, hist(active_power, main = "Global Active Power", col = "Red", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))

dev.off()