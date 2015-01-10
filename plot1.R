f <- read.table(file = "household_power_consumption.txt", 
                sep = ";", na.string = "?", 
                skip = 65000, nrow = 10000)
f <- subset(f, f$V1 == "1/2/2007" | f$V1 == "2/2/2007")
par(mar = c(5,6,3,3))
hist(f$V3, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()