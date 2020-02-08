#simple linear regression

#load the data
#missing Values
#correlationn between IV
#form Linear Model
#check for Model Summary- F-Stat, R2, Coeff pValue
#check for assumption
#predict & find accuracy
#Refer: 2b-SLR-salarea.R

women
head(women)
plot(women)

cor(women)
cov(women$height,women$weight)
cor(women$height,women$weight)

model = lm(weight ~ height, data=women)

model
summary(model)
#to check the model exist check F-stat and Adjusted R-Squared

range(women$height)
residuals(model)
plot(model)

predict(model,new=data.frame(height=77))
-87+3.45*77

#mtcars ----
head(mtcars)
model2 = lm(mpg ~ wt+hp+qsec,data= mtcars)
summary(model2)
model3 = lm(mpg ~ wt,data= mtcars)
summary(model3)






#olssr
library(olssr)

