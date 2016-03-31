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

