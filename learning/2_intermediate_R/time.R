# -------------------------------------------------
# TIMES & DATES
# -------------------------------------------------

today <- Sys.Date()
today

# date object
class(today)

now <- Sys.time()
now # 2021-11-29 01:26:27 EET

# POSIXct
class(now)


# Date object
# -------------------------------------------------
my_date <- as.Date("1971-14-05", format = "%Y-%d-%m")
my_date2 <- as.Date("1998-09-29", format = "%Y-%m-%d")

# Date arithmetic
# -------------------------------------------------
my_date + 1
my_date2 - my_date

# POSIXct arithmetic
# -------------------------------------------------
my_time2 <- as.POSIXct("1974-07-14 21:11:55 CET")
now - my_time2


# Create and format dates
# -------------------------------------------------
# To create a Date object from a simple character string in R, you can use the as.Date() function. The character string has to obey a format that can be defined using a set of symbols (the examples correspond to 13 January, 1982):
  
# %Y: 4-digit year (1982)
# %y: 2-digit year (82)
# %m: 2-digit month (01)
# %d: 2-digit day of the month (13)
# %A: weekday (Wednesday)
# %a: abbreviated weekday (Wed)
# %B: month (January)
# %b: abbreviated month (Jan)

# The following R commands will all create the same Date object for the 13th day in January of 1982:
  
as.Date("1982-01-13")
as.Date("Jan-13-82", format = "%b-%d-%y")
as.Date("13 January, 1982", format = "%d %B, %Y")

# Notice that the first line here did not need a format argument, because by default R matches your character string to the formats "%Y-%m-%d" or "%Y/%m/%d".

# In addition to creating dates, you can also convert dates to character strings that use a different date notation. For this, you use the format() function. Try the following lines of code:
  
today <- Sys.Date()
format(Sys.Date(), format = "%d %B, %Y")
format(Sys.Date(), format = "Today is a %A!")


# Example 1
# -------------------------------------------------
# Definition of character strings representing dates
str1 <- "May 23, '96"
str2 <- "2012-03-15"
str3 <- "30/January/2006"

# Convert the strings to dates: date1, date2, date3
date1 <- as.Date(str1, format = "%b %d, '%y")
date2 <- as.Date(str2, format = "%Y-%m-%d")
date3 <- as.Date(str3, format = "%d/%B/%Y")

# Convert dates to formatted strings
format(date1, "%A")
format(date2, "%d")
format(date3, "%b %Y")


# Example 2
# -------------------------------------------------

# %H: hours as a decimal number (00-23)
# %I: hours as a decimal number (01-12)
# %M: minutes as a decimal number
# %S: seconds as a decimal number
# %T: shorthand notation for the typical format %H:%M:%S
# %p: AM/PM indicator


# Definition of character strings representing times
str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
str2 <- "2012-3-12 14:23:08"

# Convert the strings to POSIXct objects: time1, time2
time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
time2 <- as.POSIXct(str2, format = "%Y-%m-%d %H:%M:%S")

# Convert times to formatted strings
format(time1, "%M")
format(time2, "%I:%M %p")

# Example 3
# -------------------------------------------------
# "2021-11-10" "2021-11-12" "2021-11-17" "2021-11-23" "2021-11-28"

# Difference between last and first pizza day
day5 - day1

# Create vector pizza
pizza <- c(day1, day2, day3, day4, day5)

# Create differences between consecutive pizza days: day_diff
day_diff <- diff(pizza)

# Average period between two consecutive pizza days
mean(day_diff)


# Example 4
# -------------------------------------------------

# Convert astro to vector of Date objects: astro_dates
astro_dates <- as.Date(astro, format="%d-%b-%Y")

# Convert meteo to vector of Date objects: meteo_dates
meteo_dates <- as.Date(meteo, format="%B %d, %y")


# Calculate the maximum absolute difference between astro_dates and meteo_dates
max(abs(astro_dates - meteo_dates))


