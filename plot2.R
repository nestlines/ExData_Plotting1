
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

>  getwd()
[1] "C:/Users/user/Documents"
> setwd("C:/Users/user/Documents/GitHub")
> dir()
[1] "Coursera-Get-Data-Project" "datasciencecoursera"      
[3] "ExData_Plotting1"          "HelloWorld.md"            
[5] "ProgrammingAssignment2"    "README.md"                
> setwd("C:/Users/user/Documents/GitHub/ExData_Plotting1")
> t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
> ## Format date to Type Date
> t$Date <- as.Date(t$Date, "%d/%m/%Y")
>   t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
> t <- t[complete.cases(t),]
> dateTime <- paste(t$Date, t$Time)
> dateTime <- setNames(dateTime, "DateTime")
> t <- t[ ,!(names(t) %in% c("Date","Time"))]
>   t <- cbind(dateTime, t)
>   t$dateTime <- as.POSIXct(dateTime)
> ## Create Plot 2
>   plot(t$Global_active_power~t$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
> dev.copy(png,"plot2.png", width=480, height=480)
png 
  3 
> dev.off()
windows 
      2 
> 
