library(readr)

source("R/datamodel.R")

stats_csv <- read_mileage("data/mileage.csv")

norm_stats <- get_normalized_daily_mileage(stats_csv)

start_date <- min(stats_csv$dateCol);

end_date <- max(stats_csv$dateCol)

source("R/plotutils.R")

source("R/overall0.R")

source("R/mean_median0.R")

source("R/quartile1.R")

source("R/stdeviation1.R")

source("R/mean_future0.R")