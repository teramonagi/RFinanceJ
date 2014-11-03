context("get data: source:yahoo")

test_that("get_from_yahoo-1",{
  df <- get_from_yahoo('8411.T', "2014-1-1", "2014-3-3", "daily")
  df %>% nth(1) %>% head(1) %>% expect_equal(as.Date("2014-3-3"))
  df %>% nth(1) %>% tail(1) %>% expect_equal(as.Date("2014-1-6"))
  df <- get_from_yahoo('998407.o', "2014-1-1", "2014-3-3", "daily") 
  df %>% nth(1) %>% head(1) %>% expect_equal(as.Date("2014-3-3"))
  df %>% nth(1) %>% tail(1) %>% expect_equal(as.Date("2014-1-6"))
  df <- get_from_yahoo('1131197C', "2014-1-1", "2014-3-3", "daily")   
  df %>% nth(1) %>% head(1) %>% expect_equal(as.Date("2014-3-3"))
  df %>% nth(1) %>% tail(1) %>% expect_equal(as.Date("2014-1-6"))
  df <- get_from_yahoo('USDJPY=X', "2014-1-1", "2014-3-3", "daily")
  df %>% nth(1) %>% head(1) %>% expect_equal(as.Date("2014-3-3"))
  df %>% nth(1) %>% tail(1) %>% expect_equal(as.Date("2014-1-1"))
})

test_that("get_from_yahoo-2",{
  df <- get_from_yahoo('USDJPY=X', as.Date("2013-11-1"), "2014-3-3", "daily")
  df %>% nth(1) %>% head(1) %>% expect_equal(as.Date("2014-3-3"))
  df %>% nth(1) %>% tail(1) %>% expect_equal(as.Date("2013-11-1"))
})

test_that("get_from_yahoo-3",{
  df <- get_from_yahoo('1131197C', as.Date("2013-1-1"), as.Date("2014-3-3"), "monthly")
  df %>% nth(1) %>% head(1) %>% expect_equal(as.Date("2014-3-1"))
  df %>% nth(1) %>% tail(1) %>% expect_equal(as.Date("2013-1-1"))
})