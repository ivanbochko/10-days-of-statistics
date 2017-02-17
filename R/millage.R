library(readr)

source("R/datamodel.R")

stats_csv <- read_mileage("data/mileage.csv")

norm_stats <- get_normalized_daily_mileage(stats_csv)

start_date <- min(stats_csv$dateCol);

end_date <- max(stats_csv$dateCol)

source("R/plotutils.R")

saveToImage("docs/mileage-01.png", function() {
  heading <- paste("Mileage progress from ", start_date, " to ", end_date)
  plot(stats_csv$dateCol, stats_csv$mileageCol, type="S", main=heading, xlab="Dates", ylab="Mileage")
})

saveToImage("docs/mileage-02.png", function() {
  heading <- paste("Mileage daily from ", start_date, " to ", end_date)
  plot(norm_stats$dateCol, norm_stats$dailyDelta, type="l", main=heading, xlab="Dates", ylab="Mileage (daily)")
})


meanMileagePerDay <- mean(norm_stats$dailyDelta)
saveToImage("docs/mean-01.png", function() {
  heading <- paste("Mean (", start_date, "-", end_date,")")
  plot(norm_stats$dateCol, norm_stats$dailyDelta, type="l", main=heading, xlab="Dates", ylab="Mileage (daily)")
  lines(norm_stats$dateCol, rep(meanMileagePerDay, length(norm_stats$dateCol)), col="red")
  legend("topleft", c("mean"), cex=0.8, col = "red", lty = 1:1, lwd = 2, bty = "n");
})
