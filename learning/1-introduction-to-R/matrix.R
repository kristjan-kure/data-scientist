# -------------------------------------------------
# MATRIX
# -------------------------------------------------

# In R, a matrix is a collection of elements of the same data type (numeric, character, or logical) arranged 
# into a fixed number of rows and columns. Since you are only working with rows and columns, a matrix is called 
#two-dimensional. 



# The first argument is the collection of elements that R will arrange into the rows and columns of the matrix. Here, we use 1:9 which is a shortcut for c(1, 2, 3, 4, 5, 6, 7, 8, 9).
# The argument byrow indicates that the matrix is filled by the rows. If we want the matrix to be filled by the columns, we just place byrow = FALSE.
# The third argument nrow indicates that the matrix should have three rows.

matrix(1:9, byrow = TRUE, nrow = 3)

