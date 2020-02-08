df = mtcars
df[,c('cyl','vs','am','gear','carb')] = lapply(df[,c('cyl','vs','am','gear','carb')],factor)
df

#ggplot ----
ggplot(df,aes(x=wt, y=mpg))+geom_point()
ggplot(df,aes(x=wt, y=mpg))+geom_point(aes(color=am))
ggplot(df,aes(x=wt, y=mpg))+geom_point(aes(color=am, size=hp, shape= carb))

df%>%group_by(cyl,gear)%>%summarise(CNT=n())
ggplot(df%>%group_by(cyl,gear)%>%summarise(CNT=n()),aes(x=cyl, y=CNT, fill=gear))+geom_bar(stat='identity')

ggplot(df%>%group_by(cyl,gear)%>%summarise(CNT=n()),aes(x=cyl, y=CNT, fill=gear))+geom_bar(stat='identity',position = position_dodge2(.7))

str(df)
ggplot(df, aes(x=gear,y=mpg, fill = gear))+geom_boxplot()+facet_grid(am~cyl)
