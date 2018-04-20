#14 Data Reshaping

#14.1 cbind, rbind
sport <- c('hockey', 'baseball', 'football')
league <- c('nhl', 'mlb', 'nfl')
trophy <- c('stanley cup', 'commissioner trophy', 'vince lombardy trophy')

trophies1 <- cbind(sport, league, trophy)
trophies1

trophies2 <- data.frame(sport=c('basketball', 'golf'),
                       league=c('nba', 'pga'),
                       trophy=c('larry o brien campionshio tropgy','wanamaker trophy'),
                       stringsAsFactors = FALSE)

trophies <- rbind(trophies1, trophies2)
trophies

cbind(Sport=sport, Association=league, Prize=trophy)

#14.2 Joins
download.file(url='http://jaredlander.com/data/US_Foreign_Aid.zip',
              destfile = 'data/ForeinAid.zip')
unzip('data/ForeinAid.zip', exdir='data')

library(stringr)

theFiles <- dir('data/', pattern='\\.csv')

for(a in theFiles)
{
  nameToUse <- str_sub(string=a, start=12, end=18)
  temp <- read.table(file=file.path('data', a),
                     header = TRUE, sep=',',
                     stringsAsFactors = FALSE)
  assign(x=nameToUse, value=temp)
}

#14.2.1 merge
Aid90s00s <- merge(x=Aid_90s, y=Aid_00s, 
by .x = c('country.name', 'program.name'),
by .y = c('country.name', 'program.name'))

