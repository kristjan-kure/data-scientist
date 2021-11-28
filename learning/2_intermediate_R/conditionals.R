# -------------------------------------------------
# Relational Operators
# -------------------------------------------------

"hello" != "goodbye"

# TRUE, because H comes after G
"Hello" > "Goodbye"

# FALSE, because B comes after A
"A" > "B"

# TRUE coerces to 1, FALSE coerces to 0 - so this equals false
TRUE < FALSE

# Comparison of character strings (TRUE)
"raining" <= "raining dogs"

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Popular days
linkedin > 15

# Quiet days
linkedin <= 5

# LinkedIn more popular than Facebook
linkedin > facebook

# The social data has been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
views <- matrix(c(linkedin, facebook), nrow = 2, byrow = TRUE)

# When does views equal 13?
views == 13

# When is views less than or equal to 14?
views <= 14

# Logical Operators
# -------------------------------------------------

# Single operators -> &
c(TRUE, TRUE, FALSE) & c(TRUE, FALSE, FALSE) 
# equals TRUE FALSE FALSE

# Double operators -> && (Compared only first values)
c(TRUE, TRUE, FALSE) && c(TRUE, FALSE, FALSE) 
# equals TRUE

x <- 5
y <- 7
!(!(x < 4) & !!!(y > 12))


# Conditional statements
# -------------------------------------------------
# It's important that the else keyword comes on the same line as the closing bracket of the if part!


x <- -3

if (x < 3) {
  print("X is a negative number")
}

# else statement
if (x < 3) {
  print("X is a negative number")
} else {
  print("x is either a positive number or zero")
}

# else if statement
if (x < 0) {
  print("X is a negative number")
} else if (x == 0) {
  print("x is zero")
} else {
  print("x is positive number")
}

x <- 6
if (x %% 2 == 0) {
  print("divisible by 2")
} else if (x %% 3 == 0) {
  print("divisible by 3")
} else {
  print("not divisible by 2 or nor by 3...")
}

# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else {
  print("Unknown medium")
}

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else {
  print("Try to be more visible!")
}


# Variables related to your last day of recordings
li <- 15
fb <- 9














