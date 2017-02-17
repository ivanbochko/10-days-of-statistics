library(readr)

read_mileage <- function(filename) {
  col_types <- cols(
    dateCol = col_date(format = "%m/%d/%Y"),
    mileageCol = col_integer()
  )
  mileageData <- read_delim(filename, "\t", col_names = TRUE, trim_ws = TRUE, col_types=col_types)
  return(mileageData)
}

get_full_dates_range <- function(mileageData) {
  datesRange <- seq(min(mileageData$dateCol),max(mileageData$dateCol), "days")
  return(datesRange)
}

get_daily_delta <- function(mileageData) {
  dailyDelta <- diff(mileageData$mileageCol)
  dailyDelta <- append(dailyDelta, 0, 0)
  return(dailyDelta)
}

get_normalized_daily_mileage<- function(mileageData) {
  datesRange <- get_full_dates_range(mileageData)
  mileageData$dailyDelta <- get_daily_delta(mileageData)
  normalized <- merge(data.frame(dateCol=datesRange), mileageData, by.x = "dateCol", by.y = "dateCol", all.x = TRUE)
  nas <- is.na(normalized$dailyDelta)
  normalized$dailyDelta[nas] <- 0
  normalized$mileageCol <- NULL
  return(normalized)
}
