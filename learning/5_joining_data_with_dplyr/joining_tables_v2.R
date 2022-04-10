# -------------------------------------------------
# Joining tables v2
# https://www.youtube.com/watch?v=Yg-pNqzDuN4
# -------------------------------------------------

install.packages("dplyr")
install.packages("tidyr")
library("dplyr")
library("tidyr")

data1 <- data.frame(ID = 1:10, X1 = c("a1","a2","a3","a4","a5","a6","a7","a8","a9","a10"))
data2 <- data.frame(ID = 5:14, X2 = c("b5","b6","b7","b8","b9","b10","b11","b12","b13","b14"))
data3 <- data.frame(sub_ID = 5:14, X2 = c("c5","c6","c7","c8","c9","c10","c11","c12","c13","c14"))


# -------------------------------------------------
# INNER JOIN
# IMAGE: inner_join.jpg
# Table only leaves in only matching ID rows (removing non-matching) and include all columns
# -------------------------------------------------
inner_join_df <- inner_join(data1, data2, by = "ID")
inner_join_df


# INNER JOIN - DIFFERENT COLUMN NAMES
# -------------------------------------------------
inner_join_df <- inner_join(data1, data3, by = c("ID" = "sub_ID"))
inner_join_df

# INNER JOIN - Use the suffix argument to replace .x and .y suffixes
# -------------------------------------------------
parts <- readRDS('G:/My Drive/1_DATA_ANALYST/Github/data-scientist/learning/5_joining_data_with_dplyr/parts.rds')
part_categories <- readRDS('G:/My Drive/1_DATA_ANALYST/Github/data-scientist/learning/5_joining_data_with_dplyr/part_categories.rds')

parts %>% head(5)
part_categories %>% head(5)

parts %>% 
  inner_join(part_categories, by = c("part_cat_id" = "id"), suffix = c("_part","_category"))

# -------------------------------------------------
# LEFT JOIN
# IMAGE: left_join.jpg
# Keeps the first (left) table data, adds only the matching id values from the right table.
# The non-matching id-s in the right table will be marked with NA in the column
# -------------------------------------------------
left_join_df <- left_join(data1, data2, by = "ID")

# Find out which values have NA now
left_join_df %>% 
  filter(is.na(X2)) 

# Changing NA to 0
left_join_df[is.na(left_join_df)] <- 0

# -------------------------------------------------
# RIGHT JOIN
# IMAGE: right_join.jpg
# Keeps the right table data, adds only the matching id values from the left table.
# The non-matching id-s in the left table will be marked with NA in the column
# -------------------------------------------------
right_join_df <- right_join(data1, data2, by = "ID")

# Find out which values have NA now
right_join_df %>% 
  filter(is.na(X1)) 

# Changing NA to 0 - version 1
right_join_df[is.na(right_join_df)] <- 0

# Changing NA to 0 - version 2
right_join_df %>% 
  replace_na(list(X1 = 0)) 

# -------------------------------------------------
# FULL JOIN
# IMAGE: full_join.jpg
# Joins both left and right tables by ID, missing values are marked with NA
# -------------------------------------------------
full_join_df <- full_join(data1, data2, by = "ID")

# Find out which values have NA now
full_join_df %>% 
  filter(is.na(X1) | is.na(X2))

# Changing NA to 0 - version 1
full_join_df[is.na(full_join_df)] <- 0

# Changing NA to 0 - version 2
full_join_df %>% 
  replace_na(list(X1 = 0, X2 = 0)) 


# -------------------------------------------------
# SEMI JOIN
# IMAGE: semi_join.jpg
# Does not include right table data - keeps only matching values and left table data
# What observations are in X are also in Y?
# -------------------------------------------------
semi_join_df <- semi_join(data1, data2, by = "ID")
semi_join_df

# -------------------------------------------------
# ANTI JOIN
# IMAGE: anti_join.jpg
# Does not include right table data - non-matching id-s in the left table and left table data
# What observations in X are not in Y?
# -------------------------------------------------
anti_join_df <- anti_join(data1, data2, by = "ID")
anti_join_df



# Differences between Batman and Star Wars
# -------------------------------------------------
inventory_parts_joined %>%
  # Combine with the sets table 
  inner_join(sets, by = "set_num") %>%
  # Combine with the themes table
  inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))


# Full-joining Batman and Star Wars LEGO parts
# -------------------------------------------------
batman_parts %>%
  # Combine the star_wars_parts table 
  full_join(star_wars_parts, by = c("part_num","color_id"), suffix = c("_batman","_star_wars"))  %>%
  
  # Replace NAs with 0s in the n_batman and n_star_wars columns 
  replace_na(list(n_batman = 0, n_star_wars = 0)) 

