#13 Iterating with purrr

#3.1 map
theList <- list(A=matrix(1:9, 3),
                B=1:5,
                C=matrix(1:4, 2),
                D=2)
lapply(theList, sum)

library(purrr)
theList %>% map(sum)

identical(lapply(theList, sum), theList %>% map(sum))

theList2 <- theList
theList2[[1]][2, 1] <- NA
theList2[[2]][4] <- NA

theList2 %>% map(sum)

theList2 %>% map(function(x) sum(x, na.rm=TRUE))

theList2 %>% map(sum, na.rm=TRUE)

#13.12 map with Specified Types
theList %>% map_int(NROW)

theList %>% map_int(mean)

#13.2.2 map_dbl
theList %>% map_dbl(mean)

#13.2.3 map_chr
theList %>% map_chr(class)

theList3 <- theList
theList3[['E']] <- factor(c('A', 'B', 'C'), ordered = TRUE)
class(theList3$E)

theList3 %>% map_chr(class)

theList3 %>% map(class)

#13.2.4 map_lgl
theList %>% map_lgl(function(x) NROW(x) < 3)

#13.2.5 map_df

buildDF <- function(x)
{
  data.frame(A=1:x, B=x:1)
}

listOfLength <- list(3, 4, 1, 5)

listOfLength %>% map(buildDF)

#13.26 map_if
theList %>% map_if(is.matrix, function(x) x*2)

theList %>% map_if(is.matrix, ~ .x*2)

#13.3 Iterating over a data.frame
data(diamonds, package='ggplot2')
diamonds %>% map_dbl(mean)

library(dplyr)
diamonds %>% summarize_each(funs(mean))

#13.4 map with Multiple Inputs
firstLine <- list(A=matrix(1:16, 1), B=matrix(1:16, 2), C=1:5)
secondLine <- list(A=matrix(1:16, 4), B=matrix(1:16, 8), C=15:1)

simpleFunc <- function(x, y)
{
  NROW(x) + NROW(y)
}

map2_int(firstLine, secondLine, simpleFunc)

pmap(list(firstLine, secondLine), simpleFunc)
