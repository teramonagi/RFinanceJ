RFinanceJ package
=============================================================

[![Build Status](https://travis-ci.org/teramonagi/RFinanceJ.png)](https://travis-ci.org/teramonagi/RFinanceJ)

## What's this
Get the financial data in Japan using variety types of data sources.
Current supported data sources are...

- [Yahoo! Finance](http://finance.yahoo.co.jp/)

## Quick examples

### Get data from Yahoo!Finance in Japan
```r
# Get stock price of the Bank of Tokyo-Mitsubishi UFJ,Ltd. 
> df <- rfinancej('8411.T', "data.frame", "2014-1-1", "2014-3-3", "daily", "yahoo")
> head(df)
        Date Open High Low Close    Volume AdjClose
1 2014-03-03  207  208 205   208  76980600      208
2 2014-02-28  210  211 208   209 149012500      209
3 2014-02-27  213  214 210   211 123515100      211
4 2014-02-26  214  216 212   215  89741900      215
5 2014-02-25  215  217 213   216 111715600      216
6 2014-02-24  214  216 212   213  94971200      213
```

