# -------------------------------------------------
# FUNCTIONS
# -------------------------------------------------

sd(c(1, 5, 6, 7))
# 2.629956

values <- c(1, 5, 6, 7)
sd(values)
# 2.629956

# Help
# -------------------------------------------------
help(function_name)
?function_name


# Argument matching
# -------------------------------------------------
sd(x, na.rm = FALSE)

# by position
sd(values)

# by name
sd(x = values)

values <- c(1,5,6,NA)
sd(values, na.rm = TRUE)

args(sd)

# Help
# -------------------------------------------------
# Consult the documentation on the mean() function
?mean

# Inspect the arguments of the mean() function
args(mean)

# Writing own functions
# -------------------------------------------------

my_fun <- function(arg1, arg2) {
  body
}

triple <- function(x) {
  y <- 3 * x
  return(y)
}

triple(6)

math_magic <- function(a, b = 1) {
  a*b + a/b
}

math_magic(4,2)
math_magic(4)
math_magic(4,0) # Infinity

math_magic <- function(a, b = 1) {
  if (b == 0) {
    return(0)
  }
  a*b + a/b
}

math_magic(4,0) #0


# Create a function pow_two()
pow_two <- function(x) {
  return(x*x)
}

# Use the function
pow_two(12)

# Create a function sum_abs()
sum_abs <- function(x,y) {
  return(abs(x) + abs(y))
}

# Use the function
sum_abs(-2,3)


# Finish the pow_two() function
pow_two <- function(x, print_info = FALSE) {
  y <- x ^ 2
  if (print_info) {
    print(paste(x, "to the power two equals", y))
  }
  return(y)
}

pow_two(5, print_info = TRUE)




two_dice <- function() {
  possibilities <- 1:6
  dice1 <- sample(possibilities, size = 1)
  dice2 <- sample(possibilities, size = 1)
  dice1 + dice2
}
two_dice()

# R passes arguments by value
# -------------------------------------------------
triple <- function(x) {
  x <- 3*x
  x
}
a <- 5
triple(a)
a

# Install packages
# -------------------------------------------------
# There are basically two extremely important functions when it comes down to R packages:
# install.packages(), which as you can expect, installs a given package.
# library() which loads packages, i.e. attaches them to the search list on your R workspace.

# To install packages, you need administrator privileges. 

# Before starting, execute the following commands in the console:
# search(), to look at the currently attached packages and
# qplot(mtcars$wt, mtcars$hp), to build a plot of two variables of the mtcars data frame.

# The library() and require() functions are not very picky when it comes down to argument types: 
# both library(rjson) and library("rjson") work perfectly fine for loading a package.




