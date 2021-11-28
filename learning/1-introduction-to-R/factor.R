# -------------------------------------------------
# FACTOR
# -------------------------------------------------

# The term factor refers to a statistical data type used to store categorical variables. 
# The difference between a categorical variable and a continuous variable is that a
# categorical variable can belong to a limited number of categories. A continuous variable, 
# on the other hand, can correspond to an infinite number of values.

# Sex vector
sex_vector <- c("Male", "Female", "Female", "Male", "Male")

# Convert sex_vector to a factor
factor_sex_vector <- factor(sex_vector)

# Print out factor_sex_vector
factor_sex_vector

# A nominal variable is a categorical variable without an implied order. This means that it is 
# impossible to say that 'one is worth more than the other'. For example, think of the categorical 
# variable animals_vector with the categories "Elephant", "Giraffe", "Donkey" and "Horse". Here, 
# it is impossible to say that one stands above or below the other. (Note that some of you might disagree ;-) ).

# In contrast, ordinal variables do have a natural ordering. Consider for example the categorical 
# variable temperature_vector with the categories: "Low", "Medium" and "High". Here it is obvious 
# that "Medium" stands above "Low", and "High" stands above "Medium".

