#####
### plot1.R
#####

# The program uses the ???Individual household electric power consumption Data Set???
# from the UC Irvine Machine Learning Repository.

# The code description:
# We make a time dependence of Global_active_power plot

###
#Load the data
###
setwd("/Users/ac/Desktop/UZER/kursera/datasajensspec/expldataan/Proj1data/")

## Estimate the memory change
library(pryr)
mem_change(activity <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE,na.strings="Not Available",header = TRUE, fill = TRUE, sep = ";"))

#It's OK, so let's load all the data
activity <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE,na.strings="?",header = TRUE, sep = ";",colClasses=c("character","character","double","double","double","double","double","double","numeric"))

###
#Change the directory
###
setwd("/Users/ac/Desktop/UZER/kursera/datasajensspec/expldataan/ExData_Plotting1")

#Check the data
head(activity)

### Segregate the data
date1 <- as.Date("01/02/07",format = "%d/%m/%y")
date2 <- as.Date("02/02/07",format = "%d/%m/%y")
activity$Temp <- as.Date(activity[, 1],format = "%d/%m/%Y")
#activity$DateTime <- paste(activity$Date, activity$Time)
#activity$DateTime <- as.POSIXlt(activity$DateTime,format="%d/%m/%Y %H:%M:%S")

# Take only the one we need (dates), free the memory
consumption <- activity[which(activity$Temp==date1 | activity$Temp==date2 ),1:9]
rm(activity)

# combine the time
consumption$Temp <- paste(consumption$Date, consumption$Time)
consumption$Temp <- as.POSIXlt(consumption$Temp,format="%d/%m/%Y %H:%M:%S")

###
# Plot task
###

# Time dependence of Global_active_power plot

png("plot2.png",width=480,height=480)
plot(consumption$Temp, consumption$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=NA)
dev.off()

