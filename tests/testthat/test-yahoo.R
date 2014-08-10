context("get data: source:yahoo")

test_that("convert_to_date_1",{
  df <- get_from_yahoo('8411.T', "2014-1-1", "2014-3-3", "daily")
})
