#' RFinanceJ 
#'
#' Get the data related to finance in Japan using variety types of data sources.
#'
#' @name RFinanceJ
#' @docType package
#' @import XML dplyr magrittr xts
NULL

#Global constant
#Data frequency
DAILY <- "daily"
WEEKLY <- "weekly"
MONTHLY <- "monthly"
#Data source
YAHOO <- "yahoo"

#' Get financial data in Japan
#'
#' @param code Dataset code on different type of data source specified as a string or an array of strings.
#' @param type Type of data returned specified as string. Can be 'data.frame', 'xts'.
#' @param start_date Use to truncate data by start date in 'yyyy-mm-dd' format or Date object.
#' @param end_date Use to truncate data by end date in 'yyyy-mm-dd' format  or Date object.
#' @param frequency Frequency of Data(daily, weekly, mothly, annual)
#' @param src data source Yahoo Japan! Finance, 
#' @return data
#' @export
rfinancej <- function(
  code,
  type="data.frame",
  start_date=Sys.Date()-365,
  end_date=Sys.Date(),
  frequency="daily",
  src="yahoo")
{
  if(length(code) == 0){stop('code argument should be filed')}

  if(length(code) == 1){
    get_from_yahoo(code, start_date, end_date, frequency)
  }else{
    result <- list()
    for(i in seq_along(code)){
      result[[i]] <- get_from_yahoo(code[i], start_date, end_date, frequency)
    }
    names(result) <- code
    result    
  }
}

#' @export
rfj <- rfinancej