# -------------------------------------------------
# Case Study: The babynames Dataset
# -------------------------------------------------
install.packages('writexl')
library(writexl)
library(dplyr)

babynames <- readRDS('PATH/babynames.rds')
write_xlsx(smallest_largest,"PATH/babynames.xlsx")

# Total number of names desc
# -------------------------------------------------
babynames %>%
  group_by(name) %>%
  summarize(name_total = sum(number)) %>%
  arrange(desc(name_total))

# Only 30 times max
# -------------------------------------------------
babynames %>%
  group_by(name) %>%
  summarize(name_total = sum(number)) %>%
  filter(name_total < 30) %>%
  arrange(name_total)

# Specific name
# -------------------------------------------------
babynames %>%
  filter(name == "James") %>%
  summarize(name_total = sum(number)) #1038340

babynames %>%
  filter(name == "Anieya") %>%
  summarize(name_total = sum(number)) #10



# Babynames multiple
# -------------------------------------------------
babynames_multiple <- babynames %>%
  filter(name %in% c("Amy","James"))

babynames %>%
  # Find the most common name in each year
  group_by(year) %>%
  top_n(1, number)

selected_names <- babynames %>%
  # Filter for the names Steven, Thomas, and Matthew 
  filter(name %in% c("Steven","Thomas", "Matthew"))


# Visualizing names with ggplot2
# -------------------------------------------------
selected_names <- babynames %>%
  # Filter for the names Steven, Thomas, and Matthew 
  filter(name %in% c("Steven", "Thomas", "Matthew"))

# Plot the names using a different color for each name
ggplot(selected_names, aes(x = year, y = number, color = name)) + geom_line()


# Finding the year each name is most common
# -------------------------------------------------
# Calculate the fraction of people born each year with the same name
babynames %>%
  group_by(year) %>%
  mutate(year_total = sum(number)) %>%
  ungroup() %>%
  mutate(fraction = number / year_total) %>%
  # Find the year each name is most common
  group_by(name) %>%
  top_n(1, fraction)

# Adding the total and maximum for each name
# -------------------------------------------------
babynames %>%
  # Add columns name_total and name_max for each name
  group_by(name) %>%
  mutate(name_total = sum(number),
         name_max = max(number))


# Adding the total and maximum for each name
# -------------------------------------------------
babynames %>%
  # Add columns name_total and name_max for each name
  group_by(name) %>%
  mutate(name_total = sum(number),
         name_max = max(number)) %>%
  # Ungroup the table 
  ungroup() %>%
  # Add the fraction_max column containing the number by the name maximum 
  mutate(fraction_max = number / name_max)








