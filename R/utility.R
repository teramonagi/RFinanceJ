#convert string to number.
as_number <- function(string)
{
  return(as.double(as.character(gsub("[^0-9.]", "",string))))
}

is_Date <- function(obj){class(obj) == "Date"}

#convert string formart date to Date object
convert_to_date <- function(date_val)
{
  if(is_Date(date_val)){
    return(date_val)
  }
  DATE_STRING_FORMAT <- "^([0-9]{4})([^0-9]+)([0-9]{1,2})([^0-9]+)([0-9]{1,2})([^0-9]+)"
  #data format is different between monthly and dialy or weekly
  date_val %>% unlist %>% gsub(DATE_STRING_FORMAT,"\\1-\\3-\\5", .) %>% as.Date(format="%Y-%m-%d")
}