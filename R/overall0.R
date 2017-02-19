
saveToImage("docs/mileage-01.png", function() {
  heading <- paste("Mileage progress from ", start_date, " to ", end_date)
  plot(stats_csv$dateCol, stats_csv$mileageCol, type="S", main=heading, xlab="Dates", ylab="Mileage")
})

saveToImage("docs/mileage-02.png", function() {
  heading <- paste("Mileage daily from ", start_date, " to ", end_date)
  plot(norm_stats$dateCol, norm_stats$dailyDelta, type="S", main=heading, xlab="Dates", ylab="Mileage (daily)")
})
