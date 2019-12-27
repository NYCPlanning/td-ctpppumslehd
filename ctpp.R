library(dplyr)

path='C:/Users/Y_Ma2/Desktop/CTPPPUMSLEHD/'

df=read.csv(paste0(path,'CTPP/FLOW/NY_2012thru2016_A302103.csv'),stringsAsFactors = FALSE,colClasses = 'character')
df=subset(df,substr(df$GEOID,1,5)=='C5400')
