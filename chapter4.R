#4.1 Basic Math
2

1 + 2 + 3

3 * 7 * 2

4 / 2

4 / 3

4 * 6 + 5 

(4 * 6) + 5

4 * (6 + 5)

#4.2 Variables
#4.2.1 Variable Assignment
x <- 2
x

y = 5 
y

3 -> z
z

a <- b <-  7
a
b

assign('j', 4)
j

#4.2.2 Removing Variables
j
rm(j)
j

theVariable <- 17
theVariable
THEVARIABLE

#4.3 Data Types
class(x)

#4.3.1 Numeric Data
is.numeric(x)

i <- 5L
is.integer(i)

class(4L)

class(2.8)

4L * 2.8
class(4L * 2.8)

class(5L / 2L)

#4.3.2 Character Data
x <- 'data'
x

y <- factor('data')
y

nchar(x)
nchar('hello')

nchar(3)

nchar(452)

nchar(y) #will not work for factor data

#4.3.3. Dates
date1 <- as.Date('2012-06-28')
date1

class(date1)

as.numeric(date1)

date2 <- as.POSIXct('2012-06-28 17:42')
date2

class(date2)

as.numeric(date2)

class(date1)

class(as.numeric(date1))

#4.3.4 Logical
TRUE * 5

FALSE * 5

k <- TRUE
class(k)

is.logical(k)

TRUE
T

T <-  7
T

class(T)

2 == 3

2 != 3

2 < 3

2 <= 3

2 > 3

'data' == 'stats'

#4.4 Vectors

x <-  c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
x

#4.4.1 Vector Operations
x * 3

x - 3

x / 4

x^2

sqrt(x)

1:10

10:1

5:-7

x <- 1:10
y <--5:4

x - y

x * y

x / y

x^y

length(x)

length(y)

length(x + y)

x + c(1, 2)

x + c(1, 2, 3)

x <= 5

x > y

x < y

x <- 10:1
y <- -4:5

all(x < y)

q <- c('hockey', 'football', 'baseball', 'curling', 'rugby',
       'lacrosse', 'basketball', 'tennis', 'cricket', 'soccer')
nchar(q)

nchar(y)

x[1]

x[1:2]

x[c(1, 4)]

c(One='a', Two='y', Last='r')

w <- 1:3
names(w) <- c('a', 'b', 'c')
w

#4.4.2 Factor Vectors

q2 <- c(q, 'hockey', 'lacrosse', 'hockey', 
        'water polo','hockey', 'lacrosse')
q2Factor <- as.factor(q2)
q2Factor

as.numeric(q2Factor)

factor(x=c('high school', 'college', 'masters', 'doctorate'),
       levels=c('high school', 'college', 'masters', 'doctorate'),
       ordered=TRUE)

#4.5 Calling Functions
mean(x)

#4.6 Function Documentation
?`+`
?`*`
?`==`

apropos('mea')

#4.7 Missing Data
#4.7.1 NA

z <- c(1, 2, NA, 3, NA, 3)
z
is.na(z)

zChar <- c('hockey', NA, 'lacrosse')
zChar

is.na(zChar)

mean(z)

mean(z, na.rm=TRUE)

#4.7.2 NULL
z <- c(1, NULL, 3)
z

d <- NULL
is.null(d)

is.null(7)

#4.8 Pipes 
library(magrittr)
x <- 1:10
mean(x)

x %>% mean

z <- c(1, 2, NA, 8, 3, NA, 3)
sum(is.na(z))

z %>% is.na %>% sum

z%>% mean(na.rm=TRUE)


