# -------------------------------------------------
# MATRIX
# -------------------------------------------------

# In R, a matrix is a collection of elements of the same data type (numeric, character, or logical) arranged 
# into a fixed number of rows and columns. Since you are only working with rows and columns, a matrix is called 
# two-dimensional. 
# The first argument is the collection of elements that R will arrange into the rows and columns of the matrix. Here, we use 1:9 which is a shortcut for c(1, 2, 3, 4, 5, 6, 7, 8, 9).
# The argument byrow indicates that the matrix is filled by the rows. If we want the matrix to be filled by the columns, we just place byrow = FALSE.
# The third argument nrow indicates that the matrix should have three rows.

matrix(1:9, byrow = TRUE, nrow = 3)

# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Create box_office
box_office <- c(new_hope, empire_strikes, return_jedi)
  
# Construct star_wars_matrix
star_wars_matrix <- matrix(box_office, byrow = TRUE, nrow = 3)

# NAMING MATRIX
# rownames(my_matrix)
# colnames(my_matrix)
# -------------------------------------------------

# Box office Star Wars (in millions!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Construct matrix
star_wars_matrix <- matrix(c(new_hope, empire_strikes, return_jedi), nrow = 3, byrow = TRUE)

# Vectors region and titles, used for naming
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Name the columns with region
colnames(star_wars_matrix) <- region

# Name the rows with titles
rownames(star_wars_matrix) <- titles


# Construct star_wars_matrix
box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

star_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE, dimnames = list(titles, region))

# rowSums
# -------------------------------------------------
# In R, the function rowSums() conveniently calculates the totals for each row of a matrix. This function creates a new vector:

# Calculate worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)

# CBIND
# -------------------------------------------------
# You can add a column or multiple columns to a matrix with the cbind() function, which merges matrices and/or vectors together by column. For example: 

# Construct star_wars_matrix
box_office <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)
region <- c("US", "non-US")
titles <- c("A New Hope", "The Empire Strikes Back","Return of the Jedi")

star_wars_matrix <- matrix(box_office, nrow = 3, byrow = TRUE, dimnames = list(titles, region))

# The worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)

# Bind the new variable worldwide_vector as a column to star_wars_matrix
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)

# RBIND
# -------------------------------------------------
star_wars_vector1_row_names <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")
star_wars_vector1_col_names <- c("US", "non-US")
star_wars_vector1_values_us <- c(461.0, 290.5, 309.3)
star_wars_vector1_values_non_us <- c(314.4, 247.9, 165.8)
box_office1 <- c(star_wars_vector1_values_us, star_wars_vector1_values_non_us)

star_wars_matrix1 <- matrix(box_office1, byrow = FALSE, nrow = 3, dimnames = list(star_wars_vector1_row_names, star_wars_vector1_col_names))

star_wars_vector2_row_names <- c("The Phantom Menacev", "Attack of the Clones", "Revenge of the Sith")
star_wars_vector2_col_names <- c("US", "non-US")
star_wars_vector2_values_us <- c(474.5, 310.7, 380.3)
star_wars_vector2_values_non_us <- c(552.5, 338.7, 468.5)
box_office2 <- c(star_wars_vector2_values_us, star_wars_vector2_values_non_us)

star_wars_matrix2 <- matrix(box_office2, byrow = FALSE, nrow = 3, dimnames = list(star_wars_vector2_row_names, star_wars_vector2_col_names))

all_wars_matrix <- rbind(star_wars_matrix1,star_wars_matrix2) 

# COL TOTAL
# -------------------------------------------------
# Total revenue for US and non-US
total_revenue_vector <- colSums(all_wars_matrix)

# Selecting matrix elements
# -------------------------------------------------
# Similar to vectors, you can use the square brackets [ ] to select one or multiple 
# elements from a matrix. Whereas vectors have one dimension, matrices have two dimensions. 
# You should therefore use a comma to separate the rows you want to select from the columns. For example:
  
# my_matrix[1,2] selects the element at the first row and second column.
# my_matrix[1:3,2:4] results in a matrix with the data on the rows 1, 2, 3 and columns 2, 3, 4.
# my_matrix[,1] selects all elements of the first column.
# my_matrix[1,] selects all elements of the first row.

# all_wars_matrix is available in your workspace
all_wars_matrix

# Select the non-US revenue for all movies
non_us_all <- all_wars_matrix[,2]

# Average non-US revenue
mean(non_us_all)

# Select the non-US revenue for first two movies
non_us_some <- all_wars_matrix[1:2,2]

# Average non-US revenue for first two movies
mean(non_us_some)



