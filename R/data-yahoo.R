#' Get the data from Yahoo Japan
#'
#' @param code Dataset code on Quandl specified as a string or an array of strings.
#' @param start_date Use to truncate data by start date in 'yyyy-mm-dd' format.
#' @param end_date Use to truncate data by end date in 'yyyy-mm-dd' format.
#' @param collapse Collapse frequency of Data.
#' @return data
#' @export
get_from_yahoo <- function(
  code,
  start_date,
  end_date,
  frequency)
{
  i <- 1
  dfl <- list()
  repeat{
    query <- make_query(code, type, start_date, end_date, frequency, i)
    df <- run_query(query)
    if(nrow(df) != 0){
      dfl[[i]] <- df
    }else{
      break;
    }
    i <- i + 1
  }
  rbind_all(dfl)
}
run_query <- function(query)
{
  res <- readHTMLTable(query, stringsAsFactors=FALSE)[[2]]
  COLNAMES <- c("Date", "Open", "High", "Low", "Close", "Volume", "AdjClose")
  if(!is.null(res)){
    colnames(res) <- COLNAMES
    res_data <- res %>% select(Open:AdjClose) %>% lapply(as_number) %>% Reduce(cbind, .)
    res_date <- res %>% select(Date) %>% convert_to_date %>% data.frame(Date=.)
    cbind(res_date, res_data) %>% setNames(COLNAMES)
  }else{
    nd <- as.double()
    data.frame(as.Date(character()), nd, nd, nd, nd, nd, nd) %>% setNames(COLNAMES)
  }
}
make_query <- function(code, type, start_date, end_date, frequency, page)
{
  BASE <- "http://info.finance.yahoo.co.jp/history/?code="
  DATE_STRING_FORMAT <- "([0-9]{4,4})-([0-9]{2,2})-([0-9]{2,2})"
  s <- start_date %>% convert_to_date %>% format("%Y-%m-%d") %>% gsub(DATE_STRING_FORMAT,"&sy=\\1&sm=\\2&sd=\\3", .)
  e <- end_date   %>% convert_to_date %>% format("%Y-%m-%d") %>% gsub(DATE_STRING_FORMAT,"&ey=\\1&em=\\2&ed=\\3", .)    
  yahoo_frequency <- if(frequency == WEEKLY){
    "w"
  }else if(frequency == MONTHLY){
    "m"
  }
  else{
    "d"
  }  
  paste0(BASE, code, s, e, '&p=', page,'&tm=', yahoo_frequency)  
}
