f <- read.table(file = "household_power_consumption.txt", 
                sep = ";", na.string = "?", 
                skip = 65000, nrow = 10000)
f <- subset(f, f$V1 == "1/2/2007" | f$V1 == "2/2/2007")
getDates <- paste(as.character(f$V1),as.character(f$V2))
getDates <- strptime(getDates, format = "%d/%m/%Y %H:%M:%S")

plot(getDates, f$V7, type = "l", xlab = "", ylab =  "Energy sub metering")
lines(getDates, f$V8, type = "l", col = "red")
lines(getDates, f$V9, type = "l", col = "blue")
legend("topright",cex = .8,lty=c(1,1),
       col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
dev.copy(png, file = "plot3.png")
dev.off()