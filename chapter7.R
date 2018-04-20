#7 Statistical Graphics

#7.1 Base Graphics

library(ggplot2)
data(diamonds)
head(diamonds)

#7.1.1 Base Histograms
hist(diamonds$carat, main='Carat Histogram', xlab='Carat')

#7.1.2 Base Scatterplot
plot(price ~ carat, data=diamonds)

plot(diamonds$carat, diamonds$price)

#7.1.3 Boxplots
boxplot((diamonds$carat))

#7.2 ggplot2

#7.2.1 ggplot2 Histograms and Densities
ggplot(data=diamonds) + geom_histogram(aes(x=carat))

ggplot(data=diamonds) + geom_density(aes(x=carat), fill='red')

#7.2.2 ggplot2 Scatterplots
ggplot(data=diamonds, aes(x=carat, y=price)) + geom_point()

g <- ggplot(data=diamonds, aes(x=carat, y=price))

g + geom_point()

g + geom_point(aes(color=color))

g + geom_point(aes(color=color)) + facet_wrap(~color)

g + geom_point(aes(color=color)) + facet_grid(cut~clarity)

ggplot(data=diamonds, aes(x=carat)) + geom_histogram() + facet_wrap(~color)

ggplot(diamonds, aes(y=carat, x=cut)) + geom_boxplot()

ggplot(data=diamonds, aes(y=carat, x=cut)) + geom_violin()

ggplot(data=diamonds, aes(y=carat, x=cut)) + geom_point() + geom_violin()

ggplot(data=diamonds, aes(y=carat, x=cut)) + geom_violin() + geom_point()

#7.2.4 ggplot Line Graphs
ggplot(economics, aes(x=date, y=pop)) + geom_line()

library(lubridate)       

economics$year <- year(economics$date)
economics$month <- month(economics$date, label=TRUE)

econ2000 <- economics[which(economics$year >=2000), ]

library(scales)

g <- ggplot(econ2000, aes(x=month, y=pop))
g <- g + geom_line(aes(color=factor(year), group=year))
g <- g + scale_color_discrete(name='year')
g <- g + scale_y_continuous(labels=comma)
g <- g + labs(title='Population Growth', x='month', y='population')
g

#7.2.5 Themes
install.packages('ggthemes')
library(ggthemes)
g2 <- ggplot(data=diamonds, aes(x=carat, y=price)) +
  geom_point(aes(color=color))

g2 <- g2 + theme_economist() + scale_colour_economist()
g2
g2 <- g2 + theme_excel() + scale_color_excel()
g2
g2 <- g2 + theme_tufte()
g2
g2 <- g2 + theme_wsj()
g2
