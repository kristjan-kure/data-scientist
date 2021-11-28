# -------------------------------------------------
# VECTORS
# -------------------------------------------------

# Declare variables of different types
my_numeric <- 42
my_character <- "universe"
my_logical <- FALSE 

# Check class of my_numeric
class(my_numeric)

# Check class of my_character
class(my_character)

# Check class of my_logical
class(my_logical)

# Numeric vector
numeric_vector <- c(1, 10, 49)

# Character vector
character_vector <- c("a", "b", "c")

# Boolean vector
boolean_vector <- c(TRUE, FALSE, TRUE)

# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)

# Assign days as names of poker_vector
names(poker_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# The variable days_vector
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Assign the names of the day to roulette_vector and poker_vector
names(poker_vector) <- days_vector  

A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

# Take the sum of A_vector and B_vector
total_vector <- A_vector + B_vector

# Calculating total winnings
# -------------------------------------------------
# Poker and roulette winnings from Monday to Friday:
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Total winnings with poker
total_poker <- sum(poker_vector)

# Total winnings with roulette
total_roulette <- sum(roulette_vector) 

# Check if you realized higher total gains in poker than in roulette 
total_poker > total_roulette


# Selecting elements
# -------------------------------------------------
# To select elements of a vector (and later matrices, data frames, …), you can use square brackets. 
# Between the square brackets, you indicate what elements to select. For example, to select the first 
# element of the vector, you type poker_vector[1]. To select the second element of the vector, you type 
# poker_vector[2], etc. Notice that the first element in a vector has index 1, not 0 as in many other 
# programming languages.

poker_vector <- c(140, -50, 20, -120, 240)

# Define a new variable based on a selection
poker_wednesday <- poker_vector[3]

# Code below selects the first and fifth element of poker_vector
poker_vector[c(1, 5)]

# Code below selects the elements from 2 to 4
poker_vector[c(2:4)]


# Select poker results for Monday, Tuesday and Wednesday
poker_start <- poker_vector[c("Monday", "Tuesday", "Wednesday")]

# Calculate the average of the elements in poker_start
mean(poker_start)

# Which days did you make money on poker?
selection_vector <- poker_vector > 0

# Select from poker_vector these days
poker_winning_days <- poker_vector[selection_vector]







