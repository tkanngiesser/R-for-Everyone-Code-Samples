theURL <- "http://www.jaredlander.com/data/TomatoFirst.csv"
tomato <- read.table(file=theURL, header=TRUE, sep=",")

head(tomato)

x <- 10:1
y <- -4:5

q <- c('hockey', 'football', 'baseball','curling', 'rugby',
       'lacrosse', 'basketball', 'tennis', 'cricket', 'soccer')
theDF <- data.frame(First=x, Second=y, Sport=q, stringsAsFactors = FALSE)
theDF$Sport

library(readr)
theURL <- "http://www.jaredlander.com/data/TomatoFirst.csv"
tomato2 <- read_delim(file = theURL, delim = ',')

tomato2

#6.1.2 fread
library(data.table)
theURL <- "http://www.jaredlander.com/data/TomatoFirst.csv"
tomato3 <- fread(input = theURL, sep = ',', header = TRUE)
head(tomato3)

#6.2 Excel Data
download.file(url='http://www.jaredlander.com/data/ExcelExample.xlsx',
              destfile = 'data/ExcelExample.xlsx', method='curl', mode = 'wb')

library(readxl)
readr::read_tsv('data/ExcelExample.xlsx')

tomatoXL <- read_excel('data/ExcelExample.xlsx')


#6.3 Reading from Databases
download.file('http://www.jaredlander.com/data/diamonds.db',
              destfile = 'data/diamonds.db', mode = 'wb' )

install.packages("RSQLite")
library(RSQLite)

drv <- dbDriver('SQLite')
class(drv)

con <- dbConnect(drv, 'data/diamonds.db')
class(con)

dbListTables(con)

dbListFields(con, name = 'DiamondColors')

diamondTable <- dbGetQuery(con, 'SELECT * FROM diamonds',
                           stringsAsFactors=FALSE)
colorTable <- dbGetQuery(con, 'SELECT * FROM DiamondColors',
                         stringsAsFactors=FALSE)
longQuery <- 'SELECT * FROM diamonds, DiamondColors
WHERE diamonds.color = DiamondColors.Color'
diamondJoin <- dbGetQuery(con, longQuery, stringAsFactors=FALSE)

head(diamondTable)

head(colorTable)

head(diamondJoin)

#6.4 Data from Other Statistical Tools

#6.5 R Binary Files
save(tomato, file='data/tomato.rdata')
rm(tomato)
head(tomato)

load('data/tomato.rdata')
head(tomato)

n <- 20
r <- 1:10
w <- data.frame(n, r)

n
r
w

save(n, r, w, file='data/multiple.rdata')
rm(n, r, w)

n
r
w

load('data/multiple.rdata')
w

smallVector <- c(1, 5, 4)
smallVector

saveRDS(smallVector, file='data/thisObject.rds')

thatVector <- readRDS('data/thisObject.rds')
identical(smallVector, thatVector)

#6.6 Data included with R

data(diamonds, package='ggplot2')
head(diamonds)

#6.7 Extract Data from Web Sites
#receiving an error message, revisit later for troubleshooting (or never ;-))


#6.7.1 Simple HTML Tables
library(htmlTable)
theURL <- 'https://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/'
bowlPool <- readHTMLTable(theURL, which=1, header=FALSE,
                          stringsAsFactors=FALSE)

#receiving an error message, revisit later for troubleshooting (or never ;-))

#6.7.2 Scraping Web Data
library(rvest)

ribalta <- read_html('http://www.jaredlander.com/data/ribalta.html')
class(ribalta)
ribalta

ribalta %>% html_nodes('ul') %>% html_nodes('span')

ribalta %>% html_nodes('.street')

ribalta %>% html_nodes('.street') %>% html_text()

ribalta %>% html_nodes('#longitude') %>% html_attr('value')

ribalta %>% 
  html_nodes('table.food-items') %>% 
  magrittr::extract2(5) %>% 
  html_table()

#6.8 Reading JSON Data
library(jsonlite)
pizza <- fromJSON('http://www.jaredlander.com/data/PizzaFavorites.json')
pizza

class(pizza)
class(pizza$Name)

class(pizza$Details)

class(pizza[[1]])
