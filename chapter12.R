#12 Faster Group Manipulation with dplyr

#12.1 Pipes
library(magrittr)
data(diamonds, package='ggplot2')
dim(head(diamonds, n=4))

diamonds %>% head(4) %>% dim

#12.2 tbl

class(diamonds)

head(diamonds)

library(dplyr)
head(diamonds)

diamonds

#12.3 select

select(diamonds, carat, price)

diamonds %>% select(carat, price)

diamonds  %>% select(c(carat, price))

diamonds %>% select_('carat', 'price')

theCols <- c('carat', 'price')

diamonds %>% select_(.dots=theCols)

diamonds %>% select(.dots=theCols)

diamonds %>% select(one_of('carat', 'price'))

diamonds %>% select(one_of(theCols))

diamonds[, c('carat', 'price')]

select(diamonds, 1, 7)

diamonds %>% select(1, 7)

diamonds %>% select(starts_with('c'))

diamonds %>% select(ends_with('e'))

diamonds %>% select(contains('l'))

diamonds %>% select(matches('r.+t'))

diamonds %>% select(-carat, -price)

diamonds %>% select(-c(carat, price))

diamonds %>% select(-1, -7)

diamonds %>% select(-c(1, 7))

diamonds %>% select_(.dots = c('-carat', '-price'))

diamonds %>% select(-one_of('carat', 'price'))

#12.4 filter
diamonds %>% filter(cut == 'Ideal')

diamonds[diamonds$cut == 'Ideal', ]

diamonds %>% filter(cut %in% c('Ideal', 'Good'))

diamonds %>% filter(price > 1000)

diamonds %>% filter(price != 1000)

diamonds %>% filter(carat > 2, price < 14000)

diamonds %>% filter(carat > 2 & price < 14000)

diamonds %>% filter(carat < 1 | carat > 5)

diamonds %>% filter_('cut' == 'Ideal')

diamonds %>% filter_( ~cut == 'Ideal')

theCut <- 'Ideal'
diamonds %>% filter_(~cut == theCut)

theCol <- 'cut'
theCut <- 'Ideal'
diamonds %>% filter_(sprintf("%s == '%s'", theCol, theCut))

diamonds %>% filter(UQE(as.name(theCol)) == theCut)

#12.5 slice
diamonds %>% slice(1:5)

diamonds %>% slice(c(1:5, 8, 15:20))

diamonds %>% slice(-1)

#12.6 mutate
diamonds %>% mutate(price/carat)

diamonds %>% select(carat, price) %>%  mutate(price/carat)

diamonds %>% select(carat, price) %>% mutate(Ratio=price/carat)

diamonds %>% 
  select(carat, price) %>% 
  mutate(Ratio=price/carat, Double=Ratio*2)

library(magrittr)  
diamonds2 <- diamonds
diamonds2

diamonds2 %<>%
  select(carat, price) %>% 
  mutate(Ratio=price/carat, Double=Ratio*2)
diamonds2

diamonds2 <- 
  diamonds2 %>% 
  mutate(Quadruple=Double*2)
diamonds2

#12.7 summarize

summarize(diamonds, mean(price))

diamonds %>% summarize(mean(price))

diamonds %>% 
  summarize(AvgPrice=mean(price),
            MedianPrice=median(price),
            AvgCarat=mean(carat))

#12.8 group_by

diamonds %>% 
  group_by(cut) %>% 
  summarize(AvgPrice=mean(price))

diamonds %>% 
  group_by(cut) %>% 
  summarize(AvgPrice=mean(price), SumCarat=sum(carat))

diamonds %>% 
  group_by(cut, color) %>% 
  summarize(AvgPrice=mean(price), SumCarat=sum(carat))

#12.9 arrange

diamonds %>% 
  group_by(cut) %>% 
  summarize(AvgPrice=mean(price), SumCarat=sum(carat)) %>% 
  arrange(AvgPrice)

diamonds %>% 
  group_by(cut) %>% 
  summarize(AvgPrice=mean(price), SumCarat=sum(carat)) %>% 
  arrange(desc(AvgPrice))

#12.10

topN <- function(x, N=5)
{
  x %>%  arrange(desc(price)) %>% head(N)
}

diamonds %>% 
  group_by(cut) %>% 
  do(topN(., N=3))

diamonds %>% 
  group_by(cut) %>% 
  do(topN(., 3))

#12.11 dplyr wirth Databases

download.file('http://www.jaredlander.com/data/diamonds.db',
              destfile = 'data/diamonds.db', mode = 'wb')

diaDBSource <- src_sqlite('data/diamonds.db')
diaDBSource

diaDBSource2 <- DBI::dbConnect(RSQLite::SQLite(), 'data/diamonds.db')
diaDBSource2

diaTab <- tbl(diaDBSource, 'diamonds')
diaTab

diaTab %>% 
  group_by(cut) %>% 
  dplyr::summarize(Price=mean(price))

diaTab %>% 
  group_by(cut) %>% 
  dplyr::summarize(Price=mean(price), Carat=mean(Carat))
