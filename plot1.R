
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

> getwd()
[1] "C:/Users/user/Documents"
> setwd( "C:/Users/user/Documents/GitHub/ExData_Plotting1")
> ##Read Table 
> t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
> ## Format date to Type Date
> t$Date <- as.Date(t$Date, "%d/%m/%Y")
> ## Filter data set from 2007-02-01 to 2007-02-02.
> t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
> t <- t[complete.cases(t),]
> 
> ## Combine Date and Time column
> dateTime <- paste(t$Date, t$Time)
> dateTime <- setNames(DateTime, "DateTime")
Error in setNames(DateTime, "DateTime") : object 'DateTime' not found
> dateTime <- setNames(dateTime, "DateTime")
> t <- t[ ,!(names(t) %in% c("Date", "Time"))]
> t <- cbind(dateTime, t)
> t$dateTime <- as.POSIXct(dateTime)
> ## creat Histogram
> hist(t%Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = red") 
Error: unexpected input in "hist(t%Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = red") "
> hist(t%Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red") 
Error: unexpected input in "hist(t%Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red") "
> hist(t$Global_active_power, main= "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red") 
> dev.copy(png,"plot1.png", width=480, height=480)
png 
  3 
> dev.off()
windows 
      2 
> 
