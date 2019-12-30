library(dplyr)

path='C:/Users/Y_Ma2/Desktop/CTPPPUMSLEHD/'

df=read.csv(paste0(path,'CTPP/FLOW/NY_2012thru2016_A302103.csv'),stringsAsFactors = FALSE,colClasses = 'character')
df=filter(df,substr(df$GEOID,1,5)=='C5400')
df$RESCT=substr(df$GEOID,8,18)
df$WORKCT=substr(df$GEOID,19,29)
df$MODE=as.integer(df$LINENO)
df$EST=as.numeric(gsub(',','',df$EST))
df$MOE=as.numeric(gsub('+/-','',df$MOE))
df=select(df,RESCT,WORKCT,MODE,EST,MOE)
