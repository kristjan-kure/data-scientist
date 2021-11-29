# -------------------------------------------------
# UTILITIES
# -------------------------------------------------

#sum()
sum(c(1, 7, 5, 3))
sum(c(4, 4, 6, 8))

# mean()
mean(c(16, 22))


seq(1, 10, by = 3)
#Starting from 1 to 10 and using step 3 resulting
# 1 4 7 10

seq(8, 2, by = -2)
#Starting from 8 to 2 and using step -2 resulting
# 8 6 4 2

rep(c(8, 6, 4, 2), times = 2)
# 8 6 4 2 8 6 4 2

rep(c(8, 6, 4, 2), each = 2)
# 8 8 6 6 4 4 2 2

sort(c(8, 6, 4, 2, 8, 6, 4, 2))
# 2 2 4 4 6 6 8 8 

sort(c(8, 6, 4, 2, 8, 6, 4, 2), decreasing = TRUE)
# 8 8 6 6 4 4 2 2

#is.*() - returns logical
is.list(c(1, 2, 3))

#as.*() - changes type
as.list(c(1, 2, 3))

# append(), rev()

# Changing lists
# -------------------------------------------------
# The linkedin and facebook lists have already been created for you
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec <- unlist(linkedin)
fb_vec <- unlist(facebook)

# Append fb_vec to li_vec: social_vec
social_vec <- append(li_vec, fb_vec)

# Sort social_vec
sort(social_vec, decreasing = TRUE)



# Beat Gauss using R
# -------------------------------------------------
# Create first sequence: seq1
seq1 <- seq(1, 500, by = 3)

# Create second sequence: seq2
seq2 <- seq(1200, 900, by = -7)

# Calculate total sum of the sequences
sum(seq1, seq2)






