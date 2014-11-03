get_from_utdpp <- function(
  start_date,
  end_date,
  frequency)
{
  URL <- "http://www.cmdlab.co.jp/price_u-tokyo/download/HistoricalDailyData.csv"
  x <- read.csv(URL)
  x %>% setNames(c("Date", names(x)[-1]))
}