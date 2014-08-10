context("rfinancej function")

test_that("rfinancej function-1",{
  df <- rfinancej('8411.T', "data.frame", "2014-1-1", "2014-3-3", "daily", "yahoo")
  df %>% select(Date) %>% head(1) %>% extract(,1) %>% expect_equal(as.Date("2014-3-3"))
})
