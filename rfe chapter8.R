#8. Writing R Functions

#8.1 Hello, world!

say.hello <- function()
{
  print('hello world!')
}

say.hello()

#8.2 Functions Arguments
sprintf('hello %s', 'Tino')

hello.person <- function(first, last)
{
  print(sprintf('hello, %s %s', first, last))
}

hello.person('tino', 'kanngiesser')

hello.person(last='kanngiesser', first='tino')

hello.person(l='kanngiesser', f='tino')

#8.2.1 Default Arguments
hello.person <- function(first, last='Doe')
{
  print(sprintf('hello %s %s', first, last))
}

hello.person('tino')

hello.person('tino', 'kanngiesser')

#8.2.2 Extra Arguments
hello.person('tino', extra="Goodbye")

hello.person('tino', 'kanngiesser', 'goodbye')

hello.person <- function(first, last='Doe', ...)
{
  print(sprintf('hello %s %s', first, last))
}

hello.person('tino', extra="Goodbye")

hello.person('tino', 'kanngiesser', 'goodbye')

#8.3 Return Values

double.num <- function(x)
{
  x * 2
}

double.num(5)

double.num <- function(x)
{
  return (x * 2)
}

double.num(5)

#8.4 do.call

do.call(hello.person, args=list(first='tino', last='kanngiesser'))

run.this <- function(x, func=mean)
{
  do.call(func, args=list(x))
}

run.this(1:10)

run.this(1:10, mean)

run.this(1:10, sum)

run.this(1:10, sd)

