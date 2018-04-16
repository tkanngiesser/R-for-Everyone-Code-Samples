x <- 10:1
y <- -4:5
q <- c('hockey', 'football', 'baseball', 'curling', 'rugby',
       'lacrosse', 'basketball', 'tennis', 'cricket', 'soccer')
theDF <- data.frame(x, y, q)
theDF

theDF <- data.frame(First=x, Second=y, Sport=q)
theDF

nrow(theDF)

ncol(theDF)

dim(theDF)

names(theDF)

names(theDF)[3]

row.names(theDF)

row.names(theDF) <- c('one', 'two', 'three', 'four', 'five',
                      'six', 'seven', 'eight', 'nine', 'ten')
row.names(theDF)

row.names(theDF) <- NULL
row.names(theDF)

head(theDF)

head(theDF, n=7)

tail(theDF)

class(theDF)

theDF$Sport

theDF[3, ]

theDF[3, 2:3]

theDF[c(3, 5), 2]

theDF[, 3]

theDF[, 2:3]

theDF[2, ]

theDF[2:4, ]

theDF[, c('First', 'Sport')]

theDF[, 'Sport']

theDF['Sport']

class(theDF['Sport'])

theDF[['Sport']]

class(theDF[['Sport']])

theDF[, 'Sport', drop=FALSE]

class(theDF[, 'Sport', drop=FALSE])

theDF[, 3, drop=FALSE]

newFactor <- factor(c('Pennsylvania', 'New York', 'New Jersey',
                      'New York', 'Tennessee', 'Massachusetts',
                      'Pennsylvania', 'Massachusetts', 'New York'))

model.matrix(~ newFactor - 1)

#5.2 Lists

