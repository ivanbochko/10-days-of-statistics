
standard.deviation <- sd(norm_stats$dailyDelta)


saveToImage("docs/deviation-01.png", function() {
  heading <- paste("Standard deviation (", start_date, "-", end_date,")")
  sd.range <- rep(standard.deviation, length(norm_stats$dateCol))
  plot(norm_stats$dateCol, norm_stats$dailyDelta, type="S", main=heading, xlab="Dates", ylab="Mileage (daily)")
  lines(norm_stats$dateCol, sd.range, col="red", lty = 2)
  legends <- c(
    paste("standard deviation = ", standard.deviation)
  )
  legend("topleft", legends, col = c("red"), lty = c(2), lwd = 2, bty = "S");
})