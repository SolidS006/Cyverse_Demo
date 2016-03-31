#well commented code is good code
#Scrpt to analyze the gapminder dataset using dply
#March 31st 2016 1351 h
#Suchi Perera
#suchi@email.arizona.edu

gap.in<-read.csv("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv")

# install.packages("dplyr",dependencies =TRUE)
# note that the above was commneted so that it won't run everytime we run the script.
# it can be rerun in another machine or something later.

# loading the packages to the memmory

# cleaning out the environment.  Becasue we do not want out environemnt to be cluttered.  If you operate with the principle that you have everythng you need ot do the project minus the all the clutter
# this to make sure that the results are not made weird by the old datasets
rm(list=ls())

library("dplyr")

gap.in<-read.csv("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv")

#Write the dataset to a csv inthe data directory
write.csv(gap.in, "data/gapminder.csv", row.names=FALSE)

# Read broken csv into R
broken.gap.in<-read.csv("data/gapminder.csv")


mean(broken.gap.in$pop)


# we downloaded the file using R,  yo opene dthe dat a file and changes it. Bas ide so tho do it.
#  Youo can rewritw the csv.  Do not git a file nore than 10 GBs.

# we have acces to pipes now.  
# in deplyr we have a very similar concept as shell pipes.
# \\


gap.in %>%
  filter(country=="China")


  # deplyr has a a lot of functions we can use more conveniently.
  # R does not care about the line breaks
# note that the gap.in%>% and the next line had to be run simultaneously for me to get the desired output

gap.in %>%
  filter(country=="China") %>%
  select(year,lifeExp)


gap.in %>%
  filter(country %in% c("China", "Argentina")) %>%
  select(country,year,lifeExp) %>%
  group_by(country) %>%
  summarize(lifeExpMean = mean(lifeExp), LifeExpSD = sd(lifeExp), LifeExpSum = sum(lifeExp))


# Calcukate the average life expectancies per country for all countries.  Which country had tge longest life expectncey and whihch had the shortest?

gap.in %>%
  filter(country %in% c("China", "Argentina", "Sri Lanka")) %>%
  select(country,year,lifeExp) %>%
  group_by(country) %>%
  summarize(lifeExpAvg = mean(lifeExp), sort(lifeExpAvg,decreasing = FALSE))

gap.in %>%
  group_by(country)%>%
  summarize(meanLifeExp = mean(lifeExp))

# dat frames All of them cannot be diplayed.  we can do a variable assigne

summarized.gap.in %>%
  group_by(country)%>%
  summarize(meanLifeExp = mean(lifeExp))

gap.in %>%
  group_by(country)%>%
  summarize(meanLifeExp = mean(lifeExp))->summarized.gap
  
gap.in %>%
  group_by(country)%>%
  summarize(meanLifeExp = mean(lifeExp)) %>%
  arrange(desc(meanLifeExp))

gap.in %>%
  group_by(country)%>%
  summarize(meanLifeExp = mean(lifeExp)) %>%
  arrange(desc(meanLifeExp))->summarized.gap.in

#############
# FUNCTIONS #
#############

# programming is all about googling, using help etc.
# the second you are getting frustrated, stop and just google and do copy pasting.


add.two.numbers<-function(num1,num2) {
  num1 + num2
}


add.two.numbers(2,3)


# A custome function can be made to do wonders
# do not forget the curly braces, wnen you do this

add.two.numbers<-function(num1,num2) {
  num3<-num1 + num2
  num1 + num2
}

add.two.numbers(2,3)


#Basic histogram->hist(var, breaks=, col=, xlab=, main=)
hist(gap.in$pop)

hist(gap.in$lifeExp, breaks=2)

hist(gap.in$lifeExp, breaks=6, main="World Life Expect", ylab="rows of years of countries", xlab="years")

hist(gap.in$lifeExp,
     breaks=6,
     main="World Life Expect",
     ylab="rows of years of countries",
     xlab="years")


# Bar plot ->barplot(counts, main=, xlab=, col=, legend=)

counts<- c(gap.in$gdpPercap, gap.in$lifeExp)
barplot(counts)

#boxplot(y ~ x, additional_arguments)
boxplot(gap.in$gdpPercap ~ gap.in$continent, main="nice")

boxplot(gap.in$gdpPercap ~ gap.in$continent,
        main="nice")


# ~ is how you write modern formulas in R.  ~ is replacing the = sign


# Scatter->plot(x, y, main=, xlab=, ylab=)
plot(gap.in$year, gap.in$lifeExp)

# make rh wplot of lifeExp of one country only
plot(gap.in$year, gap.in$lifeExp, group_by(country))

gap.in %>%
  filter(country %in% c("China", "Argentina", "Sri Lanka")) %>%
  select(country,year,lifeExp) %>%
  group_by(country) %>%
  summarize(lifeExpMean = mean(lifeExp), LifeExpSD = sd(lifeExp), LifeExpSum = sum(lifeExp))%>%
  plot(gap.in$year~gap.in$lifeExpMean)


plot(gap.in$year[gap.in$country == "Brazil"], gap.in$lifeExp[gap.in$country =="Brazil"], type="l")


# Best fit line -> abline(lm(y~x),col=)
abline(lm(gap.in$lifeExp~gap.in$year), col="red")
# Linear model fit for all the data over the Brazil data

#linear model
gap.model<-lm(gap.in$lifeExp~gap.in$year)
str(gap.model)

#ANOVA
aov(gap.model)

anova(gap.model)
