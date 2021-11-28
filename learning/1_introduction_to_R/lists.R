# -------------------------------------------------
# LISTS
# -------------------------------------------------

# Vector with numerics from 1 up to 10
my_vector <- 1:10 

# Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]

# Construct list with these different elements:
my_list <- list(my_vector, my_matrix, my_df)

# RENAME
# -------------------------------------------------
names(my_list) <- c("vec", "mat", "df")

# Finish the code to build shining_list
shining_list <- list(moviename = mov, actors = act, reviews = rev)

# Selecting elements from a list
# -------------------------------------------------

# Your list will often be built out of numerous elements and components. Therefore, getting a single element, multiple elements, or a component out of it is not always straightforward.
# One way to select a component is using the numbered position of that component. For example, to "grab" the first component of shining_list you type

shining_list[[1]]


# You can also refer to the names of the components, with [[ ]] or with the $ sign. 
# Both will select the data frame representing the reviews:
  
shining_list[[2]]
shining_list$actors
shining_list[["actors"]]

# Besides selecting components, you often need to select specific elements out of these components. 
# For example, with shining_list[[2]][1] you select from the second component, actors (shining_list[[2]]), 
# the first element ([1]). When you type this in the console, you will see the answer is Jack Nicholson.


# Use the table from the exercise to define the comments and scores vectors
scores <- c(4.6, 5, 4.8, 5, 4.2)
comments <- c("I would watch it again", "Amazing!", "I liked it", "One of the best movies", "Fascinating plot")

# Save the average of the scores vector as avg_review  
avg_review <- mean(scores)

# Combine scores and comments into the reviews_df data frame
reviews_df <- data.frame(scores, comments)

# Create and print out a list, called departed_list
departed_list <- list(movie_title, movie_actors, reviews_df, avg_review)




