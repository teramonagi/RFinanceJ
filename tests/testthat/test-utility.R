context("utility functions")

test_that("convert_to_date_1",{
  x <- "2014-5-7"
  expect_equal(convert_to_date(x), as.Date(x))  
  x <- "2014-05-07"
  expect_equal(convert_to_date(x), as.Date(x))  
})

test_that("convert_to_date_2",{
  x <- as.Date("2014-5-7")
  expect_equal(convert_to_date(x), x)  
})

test_that("convert_to_date_3",{
  x <- c("2012YYYY12MM31DD", "2013YYYY12MM7DD")
  expect_equal(convert_to_date(x), c(as.Date("2012-12-31"), as.Date("2013-12-7"))) 
})

test_that("convert_to_date_4",{
  x <- c("2012YYYY12MM", "2013YYYY1MM")
  expect_equal(convert_to_date(x), c(as.Date("2012-12-1"), as.Date("2013-1-1"))) 
})

test_that("as_number-1",{
  expect_equal(as_number("1,234"), 1234)  
  expect_equal(as_number("123"), 123)  
  expect_equal(as_number("121,234"), 121234)  
  expect_equal(as_number("567,121,234"), 567121234)  
})
