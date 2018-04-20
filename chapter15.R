#15 Reshaping Data in the Tidyverse

#15.1 Binding Rows and Columns

library(dplyr)
library(tibble)

sport <- c('hockey', 'baseball', 'football')
league <- c('nhl', 'mlb', 'nfl')
trophy <- c('stanley cup', 'commissioner trophy', 'vince lombardy trophy')

sportLeague <- tibble(sport, league)
trophy <- tibble(trophy)

trophies1 <- bind_cols(sportLeague, trophy)

trophies2 <- tribble(~sport, ~league, ~trophy,
                     'baskeball', 'nba', 'larry o',
                     'golf', 'pga', 'wanamaker')
trophies2

trophies <- bind_rows(trophies1, trophies2)

trophies

#15.2 Joins with dplyr
library(readr)
colorsURL <- 'http://www.jaredlander.com/data/DiamondColors.csv'
diamondColors <- read_csv(colorsURL)
diamondColors

data(diamonds, package='ggplot2')
unique(diamonds$color)

library(dplyr)
left_join(diamonds, diamondColors, by=c('color' = 'Color')) %>% 
  select(carat, color, price, Description, Details)

left_join(diamonds, diamondColors, by=c('color' = 'Color')) %>%
  distinct(color, Description)

right_join(diamonds, diamondColors, by=c('color' = 'Color')) %>% 
  nrow

diamonds %>% nrow

all.equal(
left_join(diamonds, diamondColors, by=c('color' = 'Color')), 
inner_join(diamonds, diamondColors, by=c('color' = 'Color')) 
)

all.equal(
  right_join(diamonds, diamondColors, by=c('color' = 'Color')), 
  full_join(diamonds, diamondColors, by=c('color' = 'Color')) 
)

semi_join(diamonds, diamondColors, by=c('color' = 'Color')) 

anti_join(diamondColors, diamonds, by=c('Color' = 'color'))

diamondColors %>% filter(Color %in% unique(diamonds$color))  

#15.3 Converting Data Formats
library(readr)

emotion <- read_tsv('http://www.jaredlander.com/data/reaction.txt')
emotion

library(tidyr)
emotion2 <- emotion %>% 
  gather(key=Type, value=Measurement, Age, BMI, React, Regulate)

emotion2
emotion2$Type

library(tidyr)
emotionLong <- emotion %>% 
  gather(key=Type, value=Measurement, Age, BMI, React, Regulate) %>% 
  arrange(ID)
head(emotionLong, 20)

emotion %>% 
  gather(key=Type, value=Measurement, -ID, -Test, -Gender)

emotionLong %>% 
  spread(key=Type, value=Measurement)
  