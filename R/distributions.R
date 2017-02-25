# lets count probability of driving > 20 km daily basing on previous experience
more20 <- norm_stats$dailyDelta[norm_stats$dailyDelta > 20]
more20_times <- length(more20)

more20p <- more20_times / length(norm_stats$dailyDelta)


# binomial distribution: probability drive more than 20 km exactly 5 days in a week
p5to7 = dbinom(5, size = 7, prob = more20p)

# probability drive more than 20 km less than 5 days in a week
plt5to7 = pbinom(5, size = 7, prob = more20p)

# geometrical distribution: probability to drive >20km after 3 days driving less
after5gt20 = dgeom(3, prob = more20p)


# Poissons distribution: if I drive N kms per day (mean), that what is probability to  drive at least 1 km more
ppois(mean.notrim, lambda = mean.notrim, lower = FALSE)

# which procent of milleage is above 20km daily (assuming milleage is of normal distribution)
pnorm(20, mean=mean.notrim, sd=standard.deviation, lower.tail=FALSE) 
