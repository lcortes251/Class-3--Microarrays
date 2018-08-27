#Exercise 2 Week 2 

#install the package Affy

#source("https://bioconductor.org/biocLite.R")
biocLite("affy")

#can use another one that I can't find

#download another package 
biocLite("SpikeInSubset")

OR 

#source("https://bioconductor.org/biocLite.R")
biocLite("SpikeInSubset")

#SpikeinSubset is sample data 

#now that package are installed, you load them. 
library(SpikeInSubset)
library(affy)

#affy is specific to Affymetrix brand of microarrays. Would not work on other brands, e.g. Agilent or Nimblegen. 

#check what data you have. 

#load the data
data(spikein95)

#check the chips
image(spikein95)

#collect the gene IDS from data set and put it into an object. 
id <- geneNames(spikein95)
#we are making an object to put all ids. 

#check the ids
"id"

#perform Mas 5.0 normalization
Mas <- mas5(spikein95)

#boxplot for raw data, and boxplot for normalized data
boxplot(spikein95)
mas_log <- log2(exprs(Mas))
x11()
boxplot(Mas)

#density plot
density <- density(mas_log[,1])
plot (density, main="Mas normalization")

density2 <- density(mas_log[,2])
lines(density2, col="red")

density3 <- density(mas_log[,3])
lines(density3, col="blue")