#16 Manipulating String

#16.1 paste
paste('hello', 'tino', 'and others')

paste('hello', 'tino', 'and others', sep = '/')

paste(c('hello', 'hey', 'howdy'), c('tino', 'bob', 'john'))

paste('hello', c('tino', 'bob', 'john'))

vectorOfText <- c('hello', 'everyone', 'out there', '.')

paste(vectorOfText, collapse = ' ')

paste(vectorOfText, collapse = '*') 

#16.2 sprintf
person <- 'tino'
partySize <- 'eight'
waitTime <- 25

paste('hello ', person, ', your party of ', partySize,
      ' will be seated in ', waitTime, ' minutes', sep = '')

sprintf('hello %s, your party of %s will be seated in %s minutes',
        person, partySize, waitTime)

sprintf('hello %s, your party of %s will be seated in %s minutes',
        c('tino', 'bob'), c('eight', 16, 'four', 10), waitTime)

#16.3 Extracting Text

library(XML)

theURL <- 'http://www.loc.gov/rr/print/list/057_chron.html'

presidents <- readHTMLTable(theURL, which=3, as.data.frame = TRUE,
                            skip.rows = 1, header = TRUE)
presidents

tail(presidents$YEAR)

library(stringr)

yearList <- str_split(string = presidents$YEAR, pattern = '-')
head(yearList)

yearMatrix <- data.frame(Reduce(rbind, yearList))
head(yearMatrix)

names(yearMatrix) <- c('Start', 'Stop')
presidents <- cbind(presidents, yearMatrix)

presidents$Start <- as.numeric(as.character(presidents$Start))
presidents$Stop <- as.numeric(as.character(presidents$Stop))

head(presidents)

tail(presidents)

str_sub(string=presidents$PRESIDENT, start = 1, end = 3)

str_sub(string=presidents$PRESIDENT, start = 4, end = 8)

presidents[str_sub(string=presidents$Start, start = 4, end = 4) == 1,
           c('YEAR', 'PRESIDENT', 'Start', 'Stop')]

#16.4 Regular Expressions
johnPos <- str_detect(string=presidents$PRESIDENT, pattern = 'John')
presidents[johnPos, c('YEAR', 'PRESIDENT', 'Start', 'Stop')]

badSearch <- str_detect(presidents$PRESIDENT, 'john')
goodSearch <- str_detect(presidents$PRESIDENT, ignore.case('John'))
sum(badSearch)
sum(goodSearch)                         

con <- url('http://www.jaredlander.com/data/warTimes.rdata')
load(con)
close(con)

head(warTimes, 10)

warTimes[str_detect(string=warTimes, pattern = '-')]

theTimes <- str_split(string = warTimes, pattern = '(ACAEA)|-', n=2)
head(theTimes)                      

which(str_detect(string = warTimes, pattern = '-'))                      

theTimes[[147]]

theTimes[[150]]

theStart <- sapply(theTimes, FUN=function(x) x[1])
head(theStart)                   

theStart <- str_trim(theStart)
head(theStart)

str_extract(string=theStart, pattern = 'January')

theStart[str_detect(string = theStart, pattern = 'January')]

head(str_extract(string = theStart, '[0-9][0-9][0-9][0-9]'), 20)

head(str_extract(string = theStart, '\\d{4}'), 20)

str_extract(string = theStart, '\\d{1,3}')

head(str_extract(string = theStart, pattern='^\\d{4}'), 30)

head(str_extract(string = theStart, pattern='\\d{4}$'), 30)

head(str_extract(string = theStart, pattern='^\\d{4}$'), 30)

head(str_replace(string = theStart, pattern='\\d', replacement = 'x'), 30)

head(str_replace_all(string = theStart, pattern = '\\d', replacement = 'x'))

head(str_replace_all(string = theStart, pattern = '\\d{1,4}',
                     replacement = 'x'), 30 )

commands <- c('<a href=index.html>The Link is here</a>',
              '<b>this is a bold text</b>')
str_replace(string = commands, pattern = '<.+?>(.*?)<.+>',
            replacement = '\\1')
