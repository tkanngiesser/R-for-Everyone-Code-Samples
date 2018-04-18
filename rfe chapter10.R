#10 Loops, the Un-R Way to Iterate

#10.1 for Loops

for(i in 1:10)
{
  print(i)
}

print(1:10)

fruit <- c('apple', 'banana', 'pomegranate')
fruitLength <- rep(NA, length(fruit))
fruitLength

names(fruitLength) <- fruit
fruitLength

fruitLength2 <- nchar(fruit)
names(fruitLength2) <- fruit
fruitLength2

identical(fruitLength, fruitLength2)

#10.2 while Loops
x <- 1
while(x <= 5)
{
  print(x)
  x <- x + 1
}

#10.3 Controlling Loops
for(i in 1:0)
{
  if(i == 3)
  {
    next
  }
  print(i)
}