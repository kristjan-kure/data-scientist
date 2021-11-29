# -------------------------------------------------
# DATA VIZ
# -------------------------------------------------

library(gapminder) # to use gapminder dataset
library(dplyr)
library(ggplot2)


gapminder_2007 <- gapminder %>%
  filter(year == 2007)

gapminder_2007

# Scatterplot
# -------------------------------------------------
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) + geom_point()

# Log scales
# -------------------------------------------------
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) + geom_point() + scale_x_log10()
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) + geom_point() + scale_y_log10()
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) + geom_point() + scale_x_log10() + scale_y_log10()

# Additional aesthetics - color
# -------------------------------------------------
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent)) + geom_point() + scale_x_log10()

# Additional aesthetics - size
# -------------------------------------------------
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) + geom_point() + scale_x_log10()


# Faceting - subplots
# -------------------------------------------------
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + 
  scale_x_log10() +
  scale_y_log10() +
  facet_wrap(~ continent)




