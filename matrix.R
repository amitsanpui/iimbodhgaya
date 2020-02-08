#iimbg

(x=rnorm(100,60,5))
x[seq(1,100,2)]
hist(x)
hist(x,breaks = 10)
hist(x,breaks = c(10,40,80,100))
plot(x)
plot(density(x))


#matrices ----

(data= round(rnorn(24,mean= 40,sd=3)))
trunc(34.6)
floor(c(-15.6))  
ceiling(24.1)
mtcars
str(mtcars)
summary(mtcars)
df = mtcars
df
names(df)
?mtcars
df$cyl = factor(df$cyl)
str(df)
df[,c('cyl','vs','am','gear','carb')] = lapply(df[,c('cyl','vs','am','gear','carb')],factor)
barplot(table(df$cyl), col =1:3)



#aggregate() ----
aggregate(. ~ cyl, data = df, mean)
aggregate(cbind(mpg,wt)~cyl+gear,data= df,mean) #mean mpg & wt for each gear and cyl type


#factors ----
#without order
set.seed(1234)
(gender = sample(c('m','f'),size=100,replace=T,prob = c(.7,.3)))
table(gender)
prop.table(table(gender))
barplot(table(gender))
pie(table(gender))

#grades ----
set.seed(1234)
(grades = sample(c('A','B','C','D'),size = 100000,replace = T,prob = c(.4,.3,.2,.1)))
table(grades)
prop.table(table(grades))
barplot(table(grades))

#grades in order specified ----
#grades
set.seed(1234)
(grades = sample(c('E','G','S','P'),size = 100000,replace = T,prob = c(.4,.3,.2,.1)))
table(grades)
prop.table(table(grades))
barplot(table(grades))
grades2= factor(grades,ordered = T,levels = c('E','G','S','P'))
str(grades2)
barplot(table(grades2))


#dplyr ----

library(dplyr)
df=mtcars
df[,c('cyl','vs','am','gear','carb')] = lapply(df[,c('cyl','vs','am','gear','carb')],factor)
barplot(table(df$cyl), col =1:3)
str(df)

#find mean  mpg & wt wrt each gear and cyl type
df%>%group_by(cyl,gear)%>%summarise(meanwt = mean(wt,na.rm=T),meanMPG=mean(mpg,na.rm=T),maxHP=max(hp),min(wt),max(wt),n())

df%>%filter(mpg>25)

df

#ggplot ----
ggplot(df,aes(x=wt, y=mpg))+geom_point()
ggplot(df,aes(x=wt, y=mpg))+geom_point(aes(color=am))
ggplot(df,aes(x=wt, y=mpg))+geom_point(aes(color=am, size=hp, shape= carb))

df%>%group_by(cyl,gear)%>%summarise(CNT=n())
ggplot(df%>%group_by(cyl,gear)%>%summarise(CNT=n()),aes(x=cyl, y=CNT, fill=gear))+geom_bar(stat='identity')

ggplot(df%>%group_by(cyl,gear)%>%summarise(CNT=n()),aes(x=cyl, y=CNT, fill=gear))+geom_bar(stat='identity',position = position_dodge2(.7))


ggplot(df, aes(x=gear,y=mpg, fill = gear))+geom_boxplot()
