context("Test reading from file and parsing dates")

source("R/datamodel.R")

test_that("Read from csv", {
  mileage <- read_mileage("../data/mileage.csv")
  expect_true(!is.null(mileage))
  expect_equal(length(mileage$dateCol), length(mileage$mileageCol))
})
