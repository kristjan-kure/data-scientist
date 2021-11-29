# -------------------------------------------------
# Selecting and transforming data
# -------------------------------------------------

#selecting column range
counties %>%
  select(state, county, drive:work_at_home) %>%
  arrange(drive)

#column contains
counties %>%
  select(state, county, contains("work")) %>%
  arrange(state)

counties %>%
  # Select state, county, population, and industry-related columns
  select(state, county, population, professional, service:production)  %>%
  # Arrange service in descending order 
  arrange(desc(service))


# Rename
# -------------------------------------------------
counties %>%
  rename(land = land_area)

counties %>%
  select(state, county_new_name = county)

counties %>%
  # Select state, county, and poverty as poverty_rate
  select(state, county, poverty_rate = poverty)

# Transmute
# -------------------------------------------------
counties %>%
  transmute(state, county, fraction_men = men / population)

counties %>%
  # Keep the state, county, and populations columns, and add a density column
  transmute(state, county, population, density = population / land_area) %>%
  # Filter for counties with a population greater than one million 
  filter(population > 1000000) %>%
  # Sort density in ascending order 
  arrange(density)

# Change the name of the unemployment column
rename_counties1 <- counties %>%
  rename(unemployment_rate = unemployment)
str(rename_counties1)

# Keep the state and county columns, and the columns containing poverty
rename_counties2 <- counties %>%
  select(state, county, contains("poverty"))
str(rename_counties2)

# Calculate the fraction_women column without dropping the other columns
rename_counties3 <- counties %>%
  mutate(fraction_women = women / population)
str(rename_counties3)

# Keep only the state, county, and employment_rate columns
rename_counties4 <- counties %>%
  transmute(state, county, employment_rate = employed / population)
str(rename_counties4)




