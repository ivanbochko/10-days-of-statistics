

mean.notrim <- round(mean(norm_stats$dailyDelta), 2)
mean.trimmed <- round(mean(norm_stats$dailyDelta, trim = 0.2), 2)
medianMileage <- median(norm_stats$dailyDelta)
saveToImage("docs/mean-01.png", function() {
  heading <- paste("Averages (", start_date, "-", end_date,")")
  meanRange <- rep(mean.notrim, length(norm_stats$dateCol))
  meanRange.trimmed <- rep(mean.trimmed, length(norm_stats$dateCol))
  medianRange <- rep(medianMileage, length(norm_stats$dateCol))
  plot(norm_stats$dateCol, norm_stats$dailyDelta, type="S", main=heading, xlab="Dates", ylab="Mileage (daily)")
  lines(norm_stats$dateCol, meanRange, col="red")
  lines(norm_stats$dateCol, meanRange.trimmed, col="red", lty = 2)
  lines(norm_stats$dateCol, medianRange, col="blue")
  legends <- c(
    paste("mean = ", mean.notrim),
    paste("trimmed mean = ", mean.trimmed),
    paste("median = ", medianMileage)
  )
  legend("topleft", legends, col = c("red", "red", "blue"), lty = c(1,2,1), lwd = 2, bty = "S");
})

# what is average daily mileage for high important reason (weight of weekday = 85, weight of weekend = 15)
weekend.days <- weekdays(norm_stats$dateCol, abbreviate = T) %in% c("Sat", "Sun")
norm_stats$mileage.importanceWeight <- weekend.days * 15 + (!weekend.days) * 85
mean.weighted <- weighted.mean(norm_stats$dailyDelta, norm_stats$mileage.importanceWeight)
mean.weighted <- round(mean.weighted, 2)

weekend.days.count = length(norm_stats$dateCol[weekend.days])
weekend.days.mileage = sum(weekend.days * norm_stats$dailyDelta)

weekdays.count = length(norm_stats$dateCol[!weekend.days])
weekdays.mileage = sum((!weekend.days) * norm_stats$dailyDelta)

saveToImage("docs/mean-02.png", function() {
  heading <- paste("Weighted average (", start_date, "-", end_date,")")
  meanRange <- rep(mean.weighted, length(norm_stats$dateCol))
  plot(norm_stats$dateCol, norm_stats$dailyDelta * weekend.days, type="S", main=heading, xlab="Dates", ylab="Mileage (daily)", col="red")
  lines(norm_stats$dateCol, norm_stats$dailyDelta * (!weekend.days), col="blue", type = "S")
  lines(norm_stats$dateCol, meanRange, col="red", lty = 2)
  legend("bottomleft", c(
    paste("weekdays = ", weekdays.mileage, "km /", weekdays.count, "days"),
    paste("weekends = ", weekend.days.mileage, "km /", weekend.days.count, "days")
  ), cex = 0.7)
  legends <- c(
    paste("weighted mean = ", mean.weighted)
  )
  legend("topleft", legends, col = c("red"), lty = c(2), lwd = 2, bty = "S");
})