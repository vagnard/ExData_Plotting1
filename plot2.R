f <- read.table(file = "household_power_consumption.txt", 
                sep = ";", na.string = "?", 
                skip = 65000, nrow = 10000)
f <- subset(f, f$V1 == "1/2/2007" | f$V1 == "2/2/2007")
getDates <- paste(as.character(f$V1),as.character(f$V2))
getDates <- strptime(getDates, format = "%d/%m/%Y %H:%M:%S")
plot(getDates, f$V3, 
     type = "l",
     xlab = "",
     ylab =  "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()