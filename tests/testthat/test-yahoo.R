context("get data: source:yahoo")

test_that("get_from_yahoo-1",{
  df <- get_from_yahoo('8411.T', "2014-1-1", "2014-3-3", "daily")
  df %>% select(Date) %>% head(1) %>% extract(,1) %>% expect_equal(as.Date("2014-3-3"))
  df %>% select(Date) %>% tail(1) %>% extract(,1) %>% expect_equal(as.Date("2014-1-6"))
  
})

test_that("get_from_yahoo-2",{
  df <- get_from_yahoo(8411, as.Date("2013-11-1"), "2014-3-3", "daily")
  df %>% select(Date) %>% head(1) %>% extract(,1) %>% expect_equal(as.Date("2014-3-3"))
  df %>% select(Date) %>% tail(1) %>% extract(,1) %>% expect_equal(as.Date("2013-11-01"))
})

test_that("get_from_yahoo-3",{
  df <- get_from_yahoo(8411, as.Date("2013-1-1"), "2014-3-3", "monthly")
  df %>% select(Date) %>% head(1) %>% extract(,1) %>% expect_equal(as.Date("2014-3-1"))
  df %>% select(Date) %>% tail(1) %>% extract(,1) %>% expect_equal(as.Date("2013-1-1"))
})
