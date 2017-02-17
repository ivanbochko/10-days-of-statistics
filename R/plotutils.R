
saveToImage <- function(filename, plotFn) {
  png(filename, width=640, height=420, units="px", pointsize = 14)
  plotFn()
  dev.off()
}