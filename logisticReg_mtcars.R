#sample Split

#mtcars : proportion of am to be maintained
#train_MTC - 70%
#test_MTC - 30%

set.seed(34)
library(caTools)
split1 <- sample.split(mtcars$am,SplitRatio = 0.7)
split1
table(split1)
prop.table(table(split1))
train_MTC <- subset(mtcars, split1 == T)
test_MTC <- subset(mtcars, split1 == F)
dim(train_MTC); dim(test_MTC)
table(train_MTC$am)
table(test_MTC$am)
prop.table(table(train_MTC$am))
prop.table(table(test_MTC$am))


#another method for partition
library(caret)
?createDataPartition
intrain = createDataPartition(y= factor(mtcars$am), p=0.7, list=F)
intrain
mtcars[-intrain,]
training <- mtcars[intrain,]
testing <- mtcars[-intrain,]
training
testing
table(training$am)
table(testing$am)
prop.table(table(training$am))
prop.table(table(testing$am))

#simplest method
s1 <- sample(1:nrow(mtcars), size = .7*nrow(mtcars))
mtT1 <- mtcars[s1,]
mtT2 <- mtcars[-s1,]
dim(mtT1)           
dim(mtT2)

#4th method
library(dplyr)
mtcars  %>% sample_n(22)
mtcars %>% sample_frac(.7)
sample_frac(mtcars,.7)


#
