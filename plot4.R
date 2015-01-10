f <- read.table(file = "household_power_consumption.txt", 
                sep = ";", na.string = "?", 
                skip = 65000, nrow = 10000)
f <- subset(f, f$V1 == "1/2/2007" | f$V1 == "2/2/2007")
par(mfrow = c(2,2),mar = c(4,4,3,1))
getDates <- paste(as.character(f$V1),as.character(f$V2))
getDates <- strptime(getDates, format = "%d/%m/%Y %H:%M:%S")
plot(getDates, f$V3, 
     type = "l",
     xlab = "",
     ylab =  "Global Active Power")
plot(getDates, f$V5, 
     type = "l",
     xlab = "datetime",
     ylab =  "Voltage")
plot(getDates, f$V7, type = "l", xlab = "", ylab =  "Energy sub metering")
lines(getDates, f$V8, type = "l", col = "red")
lines(getDates, f$V9, type = "l", col = "blue")
legend("topright",cex = .8,lty=c(1,1),bty = "n",
       col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
plot(getDates, f$V4, 
     type = "l",
     xlab = "datetime",
     ylab =  "Global_reactive_power")
dev.copy(png, file = "plot4.png")
dev.off()