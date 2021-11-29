# -------------------------------------------------
# REGULAR EXPRESSIONS
# -------------------------------------------------

# grep(), grepl(), sub(), gsub()


# FIND: grepl()
# -------------------------------------------------
animals <- c("cat", "moose", "impala", "ant", "kiwi")
grepl(pattern = "a", x = animals)
# TRUE FALSE TRUE TRUE FALSE

# only those starting with a
grepl(pattern = "^a", x = animals)
# FALSE FALSE FALSE TRUE FALSE

# only those ending with a
grepl(pattern = "$a", x = animals)
# FALSE FALSE TRUE FALSE FALSE

# FIND: grep()
# -------------------------------------------------
grep(pattern = "a", x = animals)
# 1 3 4


# Emails
# -------------------------------------------------
# The emails vector has already been defined for you
emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

# Use grepl() to match for .edu addresses more robustly
grepl(pattern="@.*\\.edu$", x = emails)

# Use grep() to match for .edu addresses more robustly, save result to hits
hits <- grep(pattern="@.*\\.edu$", x = emails)

# Subset emails using hits
emails[hits]


# REPLACE: sub()
# -------------------------------------------------
animals <- c("cat", "moose", "impala", "ant", "kiwi")
# sub(pattern = <regex>, relacement=<str>, x = <str>)

sub(pattern = "a", replacement = "o", x = animals) 
# sub function looks only first match!!!!
# "cot" "moose" "impola" "ont" "kiwi" 


# REPLACE: gsub()
# -------------------------------------------------
gsub(pattern = "a", replacement = "o", x = animals) 
# "cot" "moose" "impolo" "ont" "kiwi"

gsub(pattern = "a|i|o", replacement = "o", x = animals) 







