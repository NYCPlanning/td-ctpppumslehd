library(dplyr)

path='C:/Users/Y_Ma2/Desktop/CTPPPUMSLEHD/'
# path='I:/CTPPPUMSLEHD/'
quadstate=c('CT','NJ','NY','PA')

flowmode=data.frame()
for (i in quadstate){
  flowmode=rbind(flowmode,read.csv(paste0(path,paste0('CTPP/FLOW/',as.character(i),'_2012thru2016_A302103.csv')),stringsAsFactors = FALSE,colClasses = 'character'))
}
flowmode=filter(flowmode,substr(flowmode$GEOID,1,5)=='C5400')
flowmode$RESCT=substr(flowmode$GEOID,8,18)
flowmode$WORKCT=substr(flowmode$GEOID,19,29)
flowmode$MODE=as.numeric(flowmode$LINENO)
flowmode$EST=as.numeric(gsub(',','',flowmode$EST))
flowmode$MOE=as.numeric(gsub(',','',gsub('+/-','',flowmode$MOE)))
flowmode=select(flowmode,RESCT,WORKCT,MODE,EST,MOE)




# resmode=data.frame()
# for (i in quadstate){
#   resmode=rbind(resmode,read.csv(paste0(path,paste0('CTPP/RES/',as.character(i),'_2012thru2016_A102106.csv')),stringsAsFactors = FALSE,colClasses = 'character'))
# }
# resmode=filter(resmode,substr(resmode$GEOID,1,5)=='C1100')
# resmode$RESCT=substr(resmode$GEOID,8,18)
# resmode$MODE=as.numeric(resmode$LINENO)
# resmode$EST=as.numeric(gsub(',','',resmode$EST))
# resmode$MOE=as.numeric(gsub(',','',gsub('+/-','',resmode$MOE)))
# resmode=select(resmode,RESCT,MODE,EST,MOE)
