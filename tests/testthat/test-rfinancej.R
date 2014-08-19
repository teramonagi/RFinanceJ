context("rfinancej function")

test_that("rfinancej function-yahoo-1",{
  df <- rfinancej('8411.T', "data.frame", "2014-1-1", "2014-3-3", "daily", "yahoo")
  df %>% select(Date) %>% head(1) %>% extract(,1) %>% expect_equal(as.Date("2014-3-3"))
  df <- rfj('8411', "data.frame", as.Date("2014-1-1"), "2014-3-3", "daily", "yahoo")
  df %>% select(Date) %>% head(1) %>% extract(,1) %>% expect_equal(as.Date("2014-3-3"))
  ls <- rfj(c(8411, 8306), "data.frame", as.Date("2014-1-1"), as.Date("2014-3-3"), "daily", "yahoo")
  expect_equal(length(ls), 2)
})
