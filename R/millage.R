library(readr)

col_types <- cols(
  date = col_character(),
  mileage = col_integer()
)
mileageData <- read_delim("data/mileage.csv", "\t", col_names = TRUE, trim_ws = TRUE, col_types=col_types)

mdates <- as.Date(mileageData$date, "%m/%d/%Y")

png("docs/mileage-01.png", width=640, height=420, units="px", pointsize = 14)
heading <- paste("Mileage progress from ", min(mdates), " to ", max(mdates))
plot(mdates, mileageData$mileage, type="S", main=heading, xlab="Dates", ylab="Mileage")
dev.off()


dailyDelta <- diff(mileageData$mileage)
dailyDelta <- append(dailyDelta, 0, 0)

#TODO: consider seq(min(mdates),max(mdates), "days") as days
png("docs/mileage-02.png", width=640, height=420, units="px", pointsize = 14)
heading <- paste("Mileage daily from ", min(mdates), " to ", max(mdates))
plot(mdates, dailyDelta, type="l", main=heading, xlab="Dates", ylab="Mileage (daily)")
dev.off()


meanMileagePerDay <- mean(dailyDelta)
png("docs/mean-01.png", width=640, height=420, units="px", pointsize = 14)
heading <- paste("Mean (", min(mdates), "-", max(mdates),")")
plot(mdates, dailyDelta, type="l", main=heading, xlab="Dates", ylab="Mileage (daily)")
lines(mdates, rep(meanMileagePerDay, length(mdates)), col="red")
legend("topleft", c("mean"), cex=0.8, col = "red", lty = 1:1, lwd = 2, bty = "n");
dev.off()


