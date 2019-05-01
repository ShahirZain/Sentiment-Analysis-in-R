install.packages("tm")
install.packages("stringr")
install.packages("wordcloud")
library("stringr")
library("wordcloud")
library("tm")




folder <- 'E:\\Data Science\\Sentiment-Analysis-in-R'    #PROVIDE FOLDER PATH ONLY
FileList <- list.files(path =folder ,pattern = "*.txt")  # list down the .txt file from folder
paste(folder,"\\",FileList)  #simple merge path and .txt file name
filelist<-paste(folder, FileList, sep ="\\") # when path is creating some dumb thing occur
a <- lapply(filelist, FUN=readLines) #all line in save in a
corpus <-lapply(a, FUN=paste, collapse = " ") # collapse all line of a with the help of fun - paste 
corpus2<-gsub(pattern = "\\W",replace = " ", corpus) # Remove punctuations
corpus2<-gsub(pattern = "\\d",replace = " ", corpus) # Remove digit
corpus2<-tolower(corpus2) # to change upper to lower
removeWords(corpus2,stopwords("english")) # remove english from list
corpus2<-gsub(pattern = "\\b[A-z]\\b{1}",replace=" ",corpus2) # remove all single word 
corpus2<-stripWhitespace(corpus2) # remove white space
wordcloud(corpus2,random.order=FALSE) #most repetitive word in center

corpus3 <- Corpus(VectorSource(corpus2))
tdm <- TermDocumentMatrix(corpus3)
m <- as.matrix(tdm)
colnames(m)
comparison.cloud(m)
