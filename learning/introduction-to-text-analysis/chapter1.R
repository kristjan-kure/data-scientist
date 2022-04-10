# Problem to solve:
# we have all the words split into negative and positive category
# Now I need to get the whole sentence containing negative word.
# So on the left column i have all the negative words and on the right column all 
# the sentences containing the negative word.

setwd("G:/My Drive/1_DATA_ANALYST/Github/data-scientist/learning/introduction-to-text-analysis")

library(tidyverse)
library(tidytext)

review_data <- read_csv("Roomba Reviews.csv")
tidy_twitter <- readRDS("ch_1_twitter_data.rds")
View(review_data)

# Average on a specific product
review_data %>% 
  filter(Product == "iRobot Roomba 650 for Pets") %>%
    summarize(stars_mean = mean(Stars))

# Average on a specific product group
review_data %>% 
  group_by(Product) %>%
  summarize(stars_mean = mean(Stars))

# Showing how many reviews based on product
review_data %>% 
  group_by(Product) %>%
  summarize(number_rows = n())

review_data %>% 
  count(Product)

# Showing how many reviews based on product in desc order
review_data %>% 
  count(Product) %>%
  arrange(desc(n))

# -----------------------------------------------------------
# Tokenizing text
# -----------------------------------------------------------
# Every unique word is a term
# Every occurrence of a term is a token
# Creating a bag of words is called tokenizing
# unnest_tokens - punctuation is gone, each word is lowercase, and white space has been removed. 

# Splitting words in review to a separate row
tidy_review <- review_data %>%
  unnest_tokens(word, Review)

# Counting words
tidy_review %>%
  count(word) %>%
  arrange(desc(n))

# Removing stop words
tidy_review2 <- review_data %>%
  unnest_tokens(word, Review) %>%
  anti_join(stop_words)

# Counting words
tidy_review2 %>%
  count(word) %>%
  arrange(desc(n))

# -----------------------------------------------------------
# Plotting word counts
# -----------------------------------------------------------

# adding id for every review word
tidy_review <- review_data %>%
  mutate(id = row_number()) %>%
  unnest_tokens(word, Review) %>%
  anti_join(stop_words)

# visualizing counts with geom_col()
word_counts <- tidy_review %>%
  count(word) %>%
  arrange(desc(n))

ggplot(word_counts, aes(x = word, y = n)) + geom_col()


# filter before visualizing
word_counts <- tidy_review %>%
  count(word) %>%
  filter(n > 300) %>%
  arrange(desc(n))

ggplot(word_counts, aes(x = word, y = n)) + geom_col() + coord_flip() + ggtitle("Review Word Counts")

# -----------------------------------------------------------
# Adding custom stop words 
# -----------------------------------------------------------

custom_stop_words <- tribble(
  ~word, ~lexicon,
  "roomba", "CUSTOM",
  "2", "CUSTOM"
)

custom_stop_words

stop_words2 <- stop_words %>%
  bind_rows(custom_stop_words)

tidy_review <- review_data %>%
  mutate(id = row_number()) %>%
  select(id, Date, Product, Stars, Review) %>%
  unnest_tokens(word, Review) %>%
  anti_join(stop_words2)

# checking if custom word is removed
tidy_review %>%
  filter(word == "roomba")

# -----------------------------------------------------------
# Reordering based on word count
# -----------------------------------------------------------

word_counts <- tidy_review %>%
  count(word) %>%
  filter(n > 300) %>%
  mutate(word2 = fct_reorder(word, n))

ggplot(word_counts, aes(x = word2, y = n)) + geom_col() + coord_flip() + ggtitle("Review Word Counts")


word_counts <- tidy_review %>%
  count(word, Product) %>%
  group_by(Product) %>%
  top_n(10, n) %>%
  ungroup() %>%
  mutate(word2 = fct_reorder(word, n))


ggplot(word_counts, aes(x = word2, y = n, fill = Product)) + 
  geom_col(show.legend = FALSE) +
  facet_wrap(~ Product, scales = "free_y") +
  coord_flip() + 
  ggtitle("Review Word Counts")


# -----------------------------------------------------------
# Word clouds
# -----------------------------------------------------------
install.packages("slam")
install.packages("wordcloud")
                 
library(wordcloud)

word_counts <- tidy_review %>%
  count(word)

wordcloud(
  words = word_counts$word,
  freq = word_counts$n,
  max.words = 30,
  colors = "blue"
)

# -----------------------------------------------------------
# Sentiment dictionaries
# -----------------------------------------------------------

# Bing dictionary
get_sentiments("bing") %>%
  count(sentiment)

# Afinn dictionary
install.packages("textdata")

get_sentiments("afinn") %>%
  summarize(
    min= min(value),
    max = max(value)
  )

# Loughran dictionary
sentiments_counts <- get_sentiments("loughran") %>%
  count(sentiment) %>%
  mutate(sentiment2 = fct_reorder(sentiment, n))


ggplot(sentiments_counts, aes(x = sentiment2, y=n)) +
  geom_col() +
  coord_flip() +
  labs(
    title = "Sentiment Counts in Loughran",
    x = "Counts",
    y = "Sentiment"
  )

# Nrc dictionary
get_sentiments("nrc") %>% 
  count(sentiment) %>% 
  # Arrange the counts in descending order
  arrange(desc(n))  
  
# -----------------------------------------------------------
# Appending dictionaries
# -----------------------------------------------------------  

tidy_review %>%
  inner_join(get_sentiments("loughran"))

sentiment_review <- tidy_review %>%
  inner_join(get_sentiments("loughran"))

sentiment_review %>%
  count(sentiment) %>%
  arrange(desc(n))

# Visualizing sentiment
sentiment_review2 <- sentiment_review %>%
  filter(sentiment %in% c("positive","negative"))

word_counts <- sentiment_review2 %>%
  count(word, sentiment) %>%
  group_by(sentiment) %>%
  top_n(10, n) %>%
  ungroup() %>%
  mutate(
    word2 = fct_reorder(word, n)
  )

ggplot(word_counts, aes(x = word2, y=n, fill= sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~ sentiment, scales = "free") +
  coord_flip() +
  labs(
    title = "Sentiment Word Counts",
    x = "Words",
  )

# -----------------------------------------------------------
# Visualizing sentiment
# -----------------------------------------------------------  

tidy_twitter2 <- tidy_twitter %>%
  unnest_tokens(word, tweet_text)


# Join tidy_twitter and the NRC sentiment dictionary
sentiment_twitter <- tidy_twitter2 %>% 
  inner_join(get_sentiments("nrc"),by = "word")

# Count the sentiments in sentiment_twitter
sentiment_twitter %>% 
  count(sentiment) %>% 
  # Arrange the sentiment counts in descending order
  arrange(desc(n))

word_counts <- tidy_twitter2 %>% 
  # Append the NRC dictionary and filter for positive, fear, and trust
  inner_join(get_sentiments("nrc"),by = "word") %>% 
  filter(sentiment %in% c("positive", "fear", "trust")) %>%
  # Count by word and sentiment and keep the top 10 of each
  count(word, sentiment) %>% 
  group_by(sentiment) %>% 
  top_n(10,n) %>% 
  ungroup() %>% 
  # Create a factor called word2 that has each word ordered by the count
  mutate(word2 = fct_reorder(word, n))


# Create a bar plot out of the word counts colored by sentiment
ggplot(word_counts, aes(x = word2, y = n, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  # Create a separate facet for each sentiment with free axes
  facet_wrap(~ sentiment, scales = "free") +
  coord_flip() +
  # Title the plot "Sentiment Word Counts" with "Words" for the x-axis
  labs(
    title = "Sentiment Word Counts",
    x = "Words"
  )

# -----------------------------------------------------------
# Spread sentiment
# -----------------------------------------------------------  

tidy_twitter <- tidy_twitter %>%
  unnest_tokens(word, tweet_text)

tidy_twitter %>% 
  # Append the NRC sentiment dictionary
  inner_join(get_sentiments("nrc"),by = "word") %>% 
  # Count by complaint label and sentiment
  count(complaint_label, sentiment) %>% 
  # Spread the sentiment and count columns
  spread(sentiment, n)


tidy_twitter %>% 
  # Append the afinn sentiment dictionary
  inner_join(get_sentiments("afinn")) %>% 
  # Group by both complaint label and whether or not the user is verified
  group_by(complaint_label) %>% 
  # Summarize the data with an aggregate_value = sum(value)
  summarize(aggregate_value = sum(value)) %>% 
  # Spread the complaint_label and aggregate_value columns
  spread(complaint_label, aggregate_value) %>% 
  mutate(overall_sentiment = Complaint + `Non-Complaint`)



# -----------------------------------------------------------
# visualize the topics produced by the LDA
# -----------------------------------------------------------  

word_probs <- lda_topics %>%
  # Keep the top 10 highest word probabilities by topic
  group_by(topic) %>% 
  top_n(10, beta) %>% 
  ungroup() %>%
  # Create term2, a factor ordered by word probability
  mutate(term2 = fct_reorder(term, beta))

# Plot term2 and the word probabilities
ggplot(word_probs, aes(x = term2, y = beta)) +
  geom_col() +
  # Facet the bar plot by topic
  facet_wrap(~ topic, scales = "free") +
  coord_flip()

# -----------------------------------------------------------
# Document term matrices
# -----------------------------------------------------------
install.packages("lda")
library("lda")

tidy_review %>%
  count(word, id) %>%
  cast_dtm(id, word, n)


word_probs <- lda_topics %>%
  # Keep the top 10 highest word probabilities by topic
  group_by(topic) %>% 
  top_n(10, beta) %>% 
  ungroup() %>%
  # Create term2, a factor ordered by word probability
  mutate(term2 = fct_reorder(term, beta))

# Plot term2 and the word probabilities
ggplot(word_probs, aes(x = term2, y = beta)) +
  geom_col() +
  # Facet the bar plot by topic
  facet_wrap(~ topic, scales = "free") +
  coord_flip()


# Start with the tidied Twitter data
tidy_twitter %>% 
  # Count each word used in each tweet
  count(word, tweet_id) %>% 
  # Use the word counts by tweet to create a DTM
  cast_dtm(tweet_id, word, n)


# Assign the DTM to dtm_twitter
dtm_twitter <- tidy_twitter_subset %>% 
  count(word, tweet_id) %>% 
  # Cast the word counts by tweet into a DTM
  cast_dtm(tweet_id, word, n)

# Coerce dtm_twitter into a matrix called matrix_twitter
matrix_twitter <- as.matrix(dtm_twitter)

# Print rows 1 through 5 and columns 90 through 95
matrix_twitter[1:5, 90:95]

# -----------------------------------------------------------
# Using LDA()
# -----------------------------------------------------------
install.packages("topicmodels")
library(topicmodels)

lda_out <- LDA(
  dtm_review,
  k = 2,
  method = "Gibbs",
  control = list(seed = 42)
)

glimpse(lda_out)





