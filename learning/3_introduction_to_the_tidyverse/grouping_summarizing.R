# -------------------------------------------------
# Grouping and summarizing
# -------------------------------------------------

# Summarize() turns many rows into one
# -------------------------------------------------
gapminder %>%
  summarize(meanLifeExp = median(lifeExp))


gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp), totalPop = sum(pop))

# Group by - group_by() before summarize() turns groups
# into one row each
# -------------------------------------------------
gapminder %>%
  group_by(year) %>%
  summarize(meanLifeExp = mean(lifeExp), totalPop = sum(pop))

gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(meanLifeExp = mean(lifeExp), totalPop = sum(pop))


gapminder %>%
  group_by(year, continent) %>%
  summarize(meanLifeExp = mean(lifeExp), totalPop = sum(pop))


# Visualizing summarized data
# -------------------------------------------------
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(totalPop = sum(pop), meanLifeExp = mean(lifeExp))


ggplot(by_year, aes(x = year, y = totalPop)) + geom_point()

# Starting y-axis at zero
# -------------------------------------------------
ggplot(by_year, aes(x = year, y = totalPop)) + geom_point() + expand_limits(y = 0)


# Vizualizing population by year and continent
# -------------------------------------------------
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(totalPop = sum(pop), meanLifeExp = mean(lifeExp))

ggplot(by_year_continent, aes(x = year, y = totalPop, color = continent)) + geom_point() + expand_limits(y = 0)

# Summarize the median GDP and median life expectancy per continent in 2007
by_continent_2007 <- gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap), medianLifeExp = median(lifeExp))

# Use a scatter plot to compare the median GDP and median life expectancy
ggplot(by_continent_2007, aes(x = medianGdpPercap, y = medianLifeExp, color = continent)) + geom_point()

