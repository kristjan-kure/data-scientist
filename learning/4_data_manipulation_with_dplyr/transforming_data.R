# -------------------------------------------------
# Data Manipulation with dplyr 
# -------------------------------------------------

counties <- readRDS('PATH/counties.rds')

counties %>%
  select(state, county, population, poverty)

# The filter and arrange verbs
counties_selected <- counties %>%
  select(state, county, population, unemployment)

# sort the data
counties_selected %>%
arrange(desc(population))

# filter
counties_selected %>%
  arrange(desc(population)) %>%
  filter(state == "New York")


counties_selected %>%
  arrange(desc(population)) %>%
  filter(state == "New York", unemployment < 6)

counties_selected <- counties %>%
  select(state, county, population, private_work, public_work, self_employed)

# Filter for Texas and more than 10000 people; sort in descending order of private_work
counties_selected %>%
  # Filter for Texas and more than 10000 people
  filter(state == "Texas", population > 10000) %>%
  # Sort in descending order of private_work
  arrange(desc(private_work))


# Mutate
# -------------------------------------------------
counties_selected %>%
  mutate(unemployment_population = population * unemployment / 100)


counties_selected <- counties %>%
  # Select the columns state, county, population, men, and women
  select(state, county, population, men, women)

counties_selected %>%
  # Calculate proportion_women as the fraction of the population made up of women
  mutate(proportion_women = women / population * 100)

counties %>%
  # Select the five columns 
  select(state, county, population, men, women) %>%
  # Add the proportion_men variable
  mutate(proportion_men = men / population) %>%
  # Filter for population of at least 10,000
  filter(population >= 10000) %>%
  # Arrange proportion of men in descending order 
  arrange(desc(proportion_men))















