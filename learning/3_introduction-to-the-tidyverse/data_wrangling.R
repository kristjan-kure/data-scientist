# -------------------------------------------------
# DATA WRANGLING
# -------------------------------------------------

# loading packages
library(gapminder)
library(dplyr)


# FILTER
# -------------------------------------------------
gapminder %>%
  filter(year == 2007)

gapminder %>%
  filter(country == "United States")

gapminder %>%
  filter(year == 2007, country == "United States")

# ARRANGE (SORT)
# -------------------------------------------------
gapminder %>%
  arrange(gdpPercap)

gapminder %>%
  arrange(desc(gdpPercap))

gapminder %>%
  filter(year == 2007) %>%
    arrange(desc(gdpPercap))


# MUTATE (changes or adds variables)
# -------------------------------------------------
gapminder %>%
  mutate(pop = pop / 1000000)

#adding new variable
gapminder %>%
  mutate(gdp = gdpPercap * pop)

#combining
gapminder %>%
  mutate(gdp = gdpPercap * pop) %>%
  filter(year == 2007) %>%
  arrange(desc(gdp))




