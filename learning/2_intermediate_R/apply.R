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




