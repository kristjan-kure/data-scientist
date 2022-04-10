# Load qdap
install.packages("qdap")
library("qdap")

new_text <- "DataCamp is the first online learning platform that focuses on building the best learning experience specifically for Data Science. We have offices in New York, London, and Belgium, and to date, we trained over 3.8 million (aspiring) data scientists in over 150 countries. These data science enthusiasts completed more than 185 million exercises. You can take free beginner courses, or subscribe for $29/month to get access to all premium courses."
frequent_terms <- freq_terms(new_text, 10)
plot(frequent_terms)


# building our first corpus - collection of documents.
coffee_tweets <- read.csv("coffee.csv", stringsAsFactors = FALSE)

# Vector of tweets
coffee_tweets <- coffee_tweets$text

# View first 5 tweets
head(coffee_tweets, 5)


# Load tm
install.packages("tm")
library("tm")

# Make a vector source from coffee_tweets
coffee_source <- VectorSource(coffee_tweets)


# Make a volatile corpus from coffee_corpus
coffee_corpus <- VCorpus(coffee_source)

# Print out coffee_corpus
coffee_corpus

# Print the 15th tweet in coffee_corpus
coffee_corpus[[15]]

# Print the contents of the 15th tweet in coffee_corpus
coffee_corpus[[15]][1]

# Now use content to review the plain text of the 10th tweet
content(coffee_corpus[[10]])


# Create the object: text
text <- "<b>She</b> woke up at       6 A.M. It\'s so early!  She was only 10% awake and began drinking coffee in front of her computer."

# Make lowercase
tolower(text)

# Remove punctuation
removePunctuation(text)

# Remove numbers
removeNumbers(text)

# Remove whitespace
stripWhitespace(text)

# List standard English stop words
stopwords("en")

# Print text without standard stop words
removeWords(text, stopwords("en"))

# Add "coffee" and "bean" to the list: new_stops
new_stops <- c("coffee", "bean", stopwords("en"))

# Remove stop words from text
removeWords(text, new_stops)


# Create complicate
complicate <- c("complicated", "complication","complicatedly")

# Perform word stemming: stem_doc
stem_doc <- stemDocument(complicate)

# Create the completion dictionary: comp_dict
comp_dict <- "complicate"

# Perform stem completion: complete_text 
complete_text <- stemCompletion(stem_doc, comp_dict)

# Print complete_text
complete_text



