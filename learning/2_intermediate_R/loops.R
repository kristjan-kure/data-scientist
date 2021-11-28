# -------------------------------------------------
# Loops
# -------------------------------------------------

while (condition) {
  exp
}

ctr <- 1

while (ctr <= 7) {
  print(paste("ctr is set to", ctr))
  ctr <- ctr + 1
}

# Break
# -------------------------------------------------
while (ctr <= 7) {
  if (ctr %% 5 == 0) {
    break
  }
  
  print(paste("ctr is set to", ctr))
  ctr <- ctr + 1
}

# WHILE loop
# -------------------------------------------------
# Initialize the speed variable
speed <- 64

# Code the while loop
while (speed > 30) {
  print(paste("Slow down! Your speed is:",speed))
  speed <- speed - 7
}

# Initialize the speed variable
speed <- 64

# Extend/adapt the while loop
while (speed > 30) {
  print(paste("Your speed is",speed))
  
  if (speed > 48) {
    print(paste("Slow down big time!"))
    speed <- speed - 11
  } else {
    print(paste("Slow down!"))
    speed <- speed - 6
  }
}

# Initialize i as 1 
i <- 1

# Code the while loop
while (i <= 10) {
  print(3 * i)
  
  if ( (3 * i) %% 8 == 0) {
    break
  }
  
  i <- i + 1
}


# FOR loop
# -------------------------------------------------

cities <- c("New York", "Paris", "London", "Tokyo", "Rio de Janeiro", "Cape Town")

for (city in cities) {
  print(city)
}

for (city in cities) {
  if (nchar(city == 6)) {
    next
  }  
  
  print(city)
}


# Index
# -------------------------------------------------
for (i in 1:length(cities)) {
  print(cities[i])
}

# The nyc list is already specified
nyc <- list(pop = 8405837, boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), capital = FALSE)

# Loop version 1
for (p in nyc) {
  print(p)
}

# Loop version 2
for (i in 1:length(nyc)) {
  print(nyc[[i]])
}

# Loop over a matrix
# -------------------------------------------------
row1 <- c("0", NA, "X")
row2 <- c(NA, "0", NA)
row3 <- c("X", "0", "X")
ttt <- data.frame(row1, row2, row3) # fills by column


for (i in 1:nrow(ttt)) {
  for (j in 1:ncol(ttt)) {
    print(paste("On row",i,"and column",j,"the board contains",ttt[i,j]))
  }
}


# Control flow
# -------------------------------------------------
# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Code the for loop with conditionals
for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  print(li)
}

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Adapt/extend the for loop
for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  
  # Add if statement with break
  if (li > 16) {
    print("This is ridiculous, I'm outta here!")
  }
  
  # Add if statement with next
  if (li < 5) {
    print("This is too embarrassing!")
  }
  
  print(li)
}

# Loop from scratch
# -------------------------------------------------
# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]

# Initialize rcount
rcount <- 0

# Finish the for loop
for (char in chars) {
  if (char == "r") {
    rcount <- rcount + 1
  }
  if (char == "u") {
    break;
  }
  
}

# Print out rcount
rcount


