
saveToImage("docs/qualtiles-01.png", function() {
  heading <- paste("Quartiles (", start_date, "-", end_date,")")
  quartile.mileage <- quantile(norm_stats$dailyDelta)
  stats.length <- length(norm_stats$dateCol)
  range.y25 <- rep(quartile.mileage["25%"], stats.length)
  range.y50 <- rep(quartile.mileage["50%"], stats.length)
  range.y75 <- rep(quartile.mileage["75%"], stats.length)
  range.y100 <- rep(quartile.mileage["100%"], stats.length)
  plot(norm_stats$dateCol, norm_stats$dailyDelta, type="S", main=heading, xlab="Dates", ylab="Mileage (daily)")
  lines(norm_stats$dateCol, range.y100, col="red")
  lines(norm_stats$dateCol, range.y75, col="blue")
  lines(norm_stats$dateCol, range.y50, col="blue", lty = 2)
  lines(norm_stats$dateCol, range.y25, col="red", lty = 2)
  legends <- c(
    paste("100% = ", quartile.mileage["100%"]),
    paste("75% = ", quartile.mileage["75%"]),
    paste("50% = ", quartile.mileage["50%"]),
    paste("25% = ", quartile.mileage["25%"])
  )
  legend("topleft", legends, col = c("red", "blue", "blue", "red"), lty = c(1,1,2,2), lwd = 2, bty = "S");
})
