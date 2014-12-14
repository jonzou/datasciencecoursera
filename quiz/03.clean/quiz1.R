download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv', 'idaho.csv', method='curl')
idaho <- read.csv('idaho.csv', header=T)
mil  <- sum(idaho[complete.cases(idaho$VAL), 'VAL']==24)
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx ', 'nga.xlsx', method='curl')
library(xlsx)
dat <- read.xlsx('nga.xlsx', sheetIndex=1, colIndex=7:15, rowIndex=18:23)
sum(dat$Zip*dat$Ext,na.rm=T) 
library(XML)
doc <- xmlTreeParse('restaurant.xml', useInternal=T)
rootNode <- xmlRoot(doc)
zips <- xpathSApply(rootNode, '//zipcode', xmlValue)
sum(zips=='21231')
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv', 'idaho2.csv', method='curl')
library(data.table)
DT <- fread('idaho2.csv')

tapply(DT$pwgtp15,DT$SEX,mean)
DT[,mean(pwgtp15),by=SEX]
sapply(split(DT$pwgtp15,DT$SEX),mean)
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
# wrong results
mean(DT$pwgtp15,by=DT$SEX)
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]

system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15)) + system.time(mean(DT[DT$SEX==2,]$pwgtp15))

# wrong results
system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])
system.time(mean(DT$pwgtp15,by=DT$SEX))
