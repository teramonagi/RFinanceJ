#convert string to number.
as_number <- function(string)
{
  return(as.double(as.character(gsub("[^0-9.]", "",string))))
}

is_Date <- function(obj){class(obj) == "Date"}
is_POSIXt <- function(obj){
  cls <- class(obj)[2]
  ifelse(is.na(cls), FALSE, cls == "POSIXt")
}

null.when.error <- function(expr){
  tryCatch(eval(expr), error=function(e)NULL)
}

#convert string formart date to Date object
convert_to_date <- function(date_val)
{
  #In the case that date_val can be transformed by existing R's function.
  if(is_Date(date_val) || is_POSIXt(date_val) ){
    return(date_val)
  }
  date_tmp <- null.when.error(as.Date(date_val))
  if(!is.null(date_tmp)){return(date_tmp)}
  date_tmp <- null.when.error(as.POSIXct(date_val))
  if(!is.null(date_tmp)){return(date_tmp)}
  
  #Try to convert, data format is different between monthly and dialy or weekly
  DATE_STRING_FORMAT_D <- "^([0-9]{4})([^0-9]+)([0-9]{1,2})([^0-9]+)([0-9]{1,2})([^0-9]+)"
  DATE_STRING_FORMAT_M <- "^([0-9]{4})([^0-9]+)([0-9]{1,2})([^0-9]+)"
  date_val_d <- date_val %>% unlist %>% gsub(DATE_STRING_FORMAT_D,"\\1-\\3-\\5", .) %>% as.Date(format="%Y-%m-%d")
  if(all(is.na(date_val_d))){
    date_val %>% unlist %>% gsub(DATE_STRING_FORMAT_M,"\\1-\\3-01", .) %>% as.Date(format="%Y-%m-%d")
  }else{
    date_val_d
  }
}