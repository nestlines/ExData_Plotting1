
R version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
Copyright (C) 2016 The R Foundation for Statistical Computing
Platform: i386-w64-mingw32/i386 (32-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Previously saved workspace restored]

> setwd("C:/Users/user/Documents/GitHub/ExData_Plotting1")
> t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
>  t$Date <- as.Date(t$Date, "%d/%m/%Y")
> t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
> t <- t[complete.cases(t),]
> dateTime <- paste(t$Date, t$Time)
> dateTime <- setNames(dateTime, "DateTime")
> t <- t[ ,!(names(t) %in% c("Date","Time"))]
> t <- cbind(dateTime, t)
> t$dateTime <- as.POSIXct(dateTime)
> ## Create Plot 4
>   par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
>   with(t, {
+     plot(Global_active_power~dateTime, type="l", 
+          ylab="Global Active Power (kilowatts)", xlab="")
+     plot(Voltage~dateTime, type="l", 
+          ylab="Voltage (volt)", xlab="")
+     plot(Sub_metering_1~dateTime, type="l", 
+          ylab="Global Active Power (kilowatts)", xlab="")
+     lines(Sub_metering_2~dateTime,col='Red')
+     lines(Sub_metering_3~dateTime,col='Blue')
+     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
+            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
+     plot(Global_reactive_power~dateTime, type="l", 
+          ylab="Global Rective Power (kilowatts)",xlab="")
+   })
> dev.copy(png, file="plot4.png", height=480, width=480)
png 
  3 
> dev.off()
windows 
      2 
> 
