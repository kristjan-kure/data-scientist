# -------------------------------------------------
# Filtering
# -------------------------------------------------

# filter NA values for version variable
# -------------------------------------------------
table %>%
filter(is.na(version)) %>%
replace_na(list(n = 0))