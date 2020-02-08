#missing values

x=c(3,5,4,3)
x1=c(5,5,NA,20)
x1
is.na(x1)
sum(is.na(x1))



library(VIM)
data(sleep)
str(sleep)
summary(sleep)
names(sleep)
is.na(sleep$Dream)
colSums(is.na(sleep))
rowSums(is.na(sleep))
complete.cases(sleep)
sleep[complete.cases(sleep),]
