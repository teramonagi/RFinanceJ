RFinanceJ
===============

** What's this
Get the data related to finance in Japan using variety types of data sources


** Get data from Yahoo!Finance in Japan
```r
# Get stock price of the Bank of Tokyo-Mitsubishi UFJ,Ltd. 
> df <- get_from_yahoo('8411.T', "2014-1-1", "2014-3-3", "daily")
> head(df)
        Date Open High Low Close    Volume AdjClose
1 2014-03-03  207  208 205   208  76980600      208
2 2014-02-28  210  211 208   209 149012500      209
3 2014-02-27  213  214 210   211 123515100      211
4 2014-02-26  214  216 212   215  89741900      215
5 2014-02-25  215  217 213   216 111715600      216
6 2014-02-24  214  216 212   213  94971200      213
```