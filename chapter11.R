#11. Group Manipulation

#11.1 Apply Family

#11.1.1 apply

theMatrix <- matrix(1:9, nrow = 3)
theMatrix

apply(theMatrix, 1, sum)

apply(theMatrix, 2, sum)

rowSums(theMatrix)

colSums(theMatrix)

theMatrix[2, 1] <- NA
apply(theMatrix, 1, sum)

apply(theMatrix, 1, sum, na.rm=TRUE)

rowSums(theMatrix)

rowSums(theMatrix, na.rm=TRUE)

#11.1.2 lapply and sapply
theList <- list(A=matrix(1:9, 3), B=1:5, 
                C=matrix(1:4, 2), D=2)
theList

lapply(theList, sum)

sapply(theList, sum)

theNames <- c('tino', 'kevin', 'mark')
lapply(theNames, nchar)

#11.1.3 mapply
firstList <- list(A=matrix(1:16, 4), 
                  B=matrix(1:16, 2),
                  C=15:1)

secondList <- list(A=matrix(1:16, 4), 
                   B=matrix(1:16, 8),
                   C=15:1)
simpleFunc <- function(x, y)
{
  NROW(x) + NROW(y)
}

mapply(simpleFunc, firstList, secondList)

#11.1.14 Other apply Functions

#11.2 aggregate
data(diamonds, package='ggplot2')
head(diamonds)

aggregate(price ~ cut, diamonds, mean)

aggregate(price ~ cut + color, diamonds, mean) 

aggregate(cbind(price, carat) ~ cut, diamonds, mean)

aggregate(cbind(price, carat) ~ cut + color,
           diamonds, mean)

#11.3.1 ddply
library(plyr)
head(baseball)

baseball$sf[baseball$year < 1954] <- 0
any(is.na(baseball$sf))

baseball$hbp[is.na(baseball$hbp)] <- 0
any(is.na(baseball$hbp))

baseball <- baseball[baseball$ab >=50, ]
baseball

obp <- function(data)
{
  c(OBP=with(data, sum(h + bb + hbp) / sum(ab + bb + hbp + sf)))
}

careedOBP <- ddply(baseball, .variables='id', .fun=obp)

careedOBP <- careedOBP[order(careedOBP$OBP, decreasing = TRUE), ]

head(careedOBP, 10)

#11.3.2 llply

theList <- list(A=matrix(1:9, 3), B=1:5,
                C=matrix(1:4, 2), D=2)

lapply(theList, sum)

llply(theList, sum)

identical(lapply(theList, sum), llply(theList, sum))

sapply(theList, sum)

laply(theList, sum)

#11.3.3 plyr Helper Functions

aggregate(price ~ cut, diamonds, each(mean, median))

system.time(dlply(baseball, 'id', nrow))

iBaseball <- idata.frame(baseball)
system.time(dlply(iBaseball, 'id', nrow))

#11.4 data.table

#sorry, but will skip the rest of the chapter
#because of dplyr ;-)