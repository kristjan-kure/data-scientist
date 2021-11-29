# -------------------------------------------------
# APPLY / LAPPLY
# -------------------------------------------------

nyc <- list(pop = 8405837, boroughs = c("Manhatten", "Bronx", "Brooklyn", "Queens", "Staten Island"), capital = FALSE)

for (info in nyc) {
  print(class(info))
}

# loop
# -------------------------------------------------
lapply(nyc, class)

# selection
nyc[[1]]
nyc[[2]][1]
nyc[["pop"]]
nyc$boroughs

# for loop
# -------------------------------------------------
num_chars <- c()
boroughs = c("Manhatten", "Bronx", "Brooklyn", "Queens", "Staten Island")

for (i in 1:length(boroughs)) {
  num_chars[i] <- nchar(boroughs[i])
}

# returns list
mylist <- lapply(boroughs, nchar)

# change to vector
unlist(mylist)


# oil example
# -------------------------------------------------
oil_prices <- list(2.37, 2.49, 2.18, 2.22, 2.47, 2.32)

triple <- function(x) {
  3 * x
}

result <- lapply(oil_prices, triple)
result
str(result)

multiply <- function(x, factor) {
  x * factor
}

times3 <- lapply(oil_prices, multiply, factor = 3)
unlist(times3)

# strsplit
# -------------------------------------------------
# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")

# Convert to lowercase strings: split_low
split_low <- lapply(split_math, tolower)

# Take a look at the structure of split_low
str(split_low)

# Code from previous exercise:
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Write function select_first()
select_first <- function(x) {
  x[1]
}

# Apply select_first() over split_low: names
names <- lapply(split_low, select_first)

# Write function select_second()
select_second <- function(x) {
  x[2]
}

# Apply select_second() over split_low: years
years <- lapply(split_low, select_second)

names
years

# Anonymous function
# -------------------------------------------------
# Previously, you learned that functions in R are objects in their own right. This means that they aren't 
# automatically bound to a name. When you create a function, you can use the assignment operator to give the 
# function a name. It's perfectly possible, however, to not give the function a name. This is called an anonymous function:

# Named function
triple <- function(x) { 3 * x }

# Anonymous function with same implementation
function(x) { 3 * x }

# Use anonymous function inside lapply()
lapply(list(1,2,3), function(x) { 3 * x })


# lapply with additional arguments
# -------------------------------------------------

# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Generic select function
select_el <- function(x, index) {
  x[index]
}

# Use lapply() twice on split_low: names and years
names <- lapply(split_low, select_el, index = 1)
years <- lapply(split_low, select_el, index = 2)


