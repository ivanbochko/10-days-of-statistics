# prediction quarter of a year
future_date <- end_date + 31*3
future_date_range <- seq(start_date, future_date, "days")

saveToImage("docs/avg-future-03.png", function() {
  heading <- paste("Prediction on average till", future_date)
  mean_line <- 1:length(future_date_range) * mean.notrim
  mean_line.trimmed <- 1:length(future_date_range) * mean.trimmed
  
  plot(future_date_range, mean_line, type="l", main=heading, xlab="Dates", ylab="Mileage (daily)", lty = 2)
  
  lines(stats_csv$dateCol, stats_csv$mileageCol, col="red", type = "S")
  lines(future_date_range, mean_line.trimmed, col="blue", lty = 2)
  
  today2end.range <- seq(end_date, future_date, "days")
  highest_deviation <- mean.notrim + standard.deviation
  lowest_deviation <- mean.notrim - standard.deviation
  if (lowest_deviation < 0) lowest_deviation <- 0
  lines(today2end.range, 1:length(today2end.range)*highest_deviation + max(stats_csv$mileageCol), col="gray", lty = 2)
  lines(today2end.range, 1:length(today2end.range)*lowest_deviation + max(stats_csv$mileageCol), col="gray", lty = 2)
  
  legends <- c(
    "mileage curve",
    paste("mileage to", tail(mean_line, n=1)),
    paste("trimmed, mileage to", tail(mean_line.trimmed, n=1)),
    "deviation range"
  )
  legend("topleft", legends, col = c("red", "black", "blue", "gray"), lty = c(1, 2, 2), lwd = 2, bty = "S");
})