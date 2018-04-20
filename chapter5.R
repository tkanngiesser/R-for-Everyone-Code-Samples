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
list(1, 2, 3)

list(c(1, 2, 3))

(list3 <- list(c(1, 2, 3), 3:7))

list(theDF, 1:10)

list5 <- list(theDF, 1:10, list3)
list5

names(list5)

names(list5) <- c('data.frame', 'vector', 'list')
names(list5)


list6 <- list(TheDataFrame=theDF, TheVector=vector, TheList=list3)
names(list6)

(emptyList <- vector(mode='list', length=4))

list5[[1]]

list5[['data.frame']]

list5[[1]]$Sport

list5[[1]][,'Second', drop=FALSE]

length(list5)

list5[[4]] <- 2
length(list5)

list5[['NewElement']] <- 3:6
length(list5)

names(list5)

#5.3 Matrices
A <- matrix(1:10, nrow=5)
A

B <- matrix(21:30, nrow=5)
B

C <- matrix(21:40, nrow=2)
C

nrow(A)

ncol(A)

dim(A)

A + B

A * B

A == B

A %*% t(B)

colnames(A)

rownames(A)

colnames(A) <- c('Left', 'Right')
rownames(A) <- c('1st', '2nd', '3rd', '4th', '5th')

colnames(B)
rownames(B)

colnames(B) <- c('First', 'Second')
rownames(B) <- c('1st', '2nd', '3rd', '4th', '5th')

colnames(C)
rownames(C)

colnames(C) <- LETTERS[1:10]
rownames(C) <- c('Top', 'Bottom')

t(A)

#5.4 Arrays

theArray <- array(1:12, dim=c(2, 3, 2))
theArray                  

theArray[1, , ]
theArray[1, , 1]

theArray[, , 1]
