# -------------------------------------------------
# DATA FRAME
# -------------------------------------------------

# A data frame has the variables of a data set as columns and the observations as rows.
# The function head() enables you to show the first observations of a data frame. 
# Similarly, the function tail() prints out the last observations in your data set.
# Another method that is often used to get a rapid overview of your data is the function str(). 
# The function str() shows you the structure of your data set


# Definition of vectors
name <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame from the vectors
planets_df <- data.frame(name, type, diameter, rotation, rings)


# A possible disadvantage of this approach is that you have to know (or look up) the column number of type, 
# which gets hard if you have a lot of variables. It is often easier to just make use of the variable name:
  
# You will often want to select an entire column, namely one specific variable from a data frame. If you 
# want to select all elements of the variable diameter, for example, both of these will do the trick:

planets_df[1:3,"type"]
planets_df[,3]
planets_df[,"diameter"]


# Select the rings variable from planets_df
rings_vector <- planets_df$diameter


