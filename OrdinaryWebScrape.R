require("RCurl")
Nov2016.request <- getURL("https://www.theguardian.com/technology/2016/oct/20/tesla-releases-video-of-fully-autonomous-model-x-electric-car?utm_term=Autofeed&CMP=fb_a-technology_b-gdntech#link_time=1476959231",ssl.verifypeer = FALSE)
class(Nov2016.request)
is.vector(Nov2016.request)
print(Nov2016.request)
require("XML")
Nov2016.tree <- htmlTreeParse(Nov2016.request, useInternal=TRUE)
print(Nov2016.tree)
Nov2016.tree.parse <- unlist(xpathApply(Nov2016.tree, path="//p", fun=xmlValue))
class(Nov2016.tree.parse)
print(Nov2016.tree.parse)
Nov2016.txt <- NULL
for (i in 2: (length(Nov2016.tree.parse)-1))
{
Nov2016.txt <- paste(Nov2016.txt, as.character(Nov2016.tree.parse[i]), sep='') }
is.vector(Nov2016.txt)
length(Nov2016.txt)
print(Nov2016.txt)

library(tm)
library(tmap)
library(wordcloud)
library(SnowballC)
require(tm)
require(tmap)
Nov2016.txt <- gsub("\r?\n|\r", "", Nov2016.txt)
my.corpus <- Corpus(VectorSource(Nov2016.txt))
strwrap(my.corpus[[1]])

