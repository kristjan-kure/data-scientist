# -------------------------------------------------
# Joining tables
# -------------------------------------------------

sets <- readRDS('G:/My Drive/1_DATA_ANALYST/Github/data-scientist/learning/5_joining_data_with_dplyr/sets.rds')
inventory_parts  <- readRDS('G:/My Drive/1_DATA_ANALYST/Github/data-scientist/learning/5_joining_data_with_dplyr/sets.rds')

# Add the correct verb, table, and joining column
parts %>% 
  inner_join(part_categories, by = c("part_cat_id" = "id"))


# Use the suffix argument to replace .x and .y suffixes
parts %>% 
  inner_join(part_categories, by = c("part_cat_id" = "id"), suffix = c("_part","_category"))


# Combine the parts and inventory_parts tables
parts %>%
  inner_join(inventory_parts, by = "part_num")

sets %>%
  # Add inventories using an inner join 
  inner_join(inventories, by = "set_num") %>%
  # Add inventory_parts using an inner join 
  inner_join(inventory_parts, by = c("id" = "inventory_id"))

# LEFT join
# -------------------------------------------------
# Combine the star_destroyer and millennium_falcon tables
millennium_falcon %>%
  left_join(star_destroyer, by = c("part_num","color_id"), suffix = c("_falcon","_star_destroyer"))

# RIGHT join
# -------------------------------------------------
parts %>%
  # Count the part_cat_id
  count(part_cat_id) %>%
  # Right join part_categories
  right_join(part_categories, by = c("part_cat_id" = "id"))


# Aggregating each theme
# -------------------------------------------------
inventory_sets_themes <- inventory_parts_joined %>%
  inner_join(sets, by = "set_num") %>%
  inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))

batman <- inventory_sets_themes %>%
  filter(name_theme == "Batman")

star_wars <- inventory_sets_themes %>%
  filter(name_theme == "Star Wars")

# Count the part number and color id, weight by quantity
batman %>%
  count(part_num, color_id, wt = quantity)
star_wars %>%
  count(part_num, color_id, wt = quantity)



















