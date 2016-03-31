#well commented code is good code
#Scrpt to analyze the gapminder dataset
#March 31st 2016
#Suchi Perera
#suchi@email.arizona.edu

gap.in<-read.csv("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv")

#Check data.  Checks the first 6 lines
head(gap.in)
tail(gap.in)
# note. you can type ctrl+Enter to execute the line
summary(gap.in)
# to get the structure
str(gap.in)

#subsetting using numeric indices.  Raws always come first.  rows 3 to 8 and column 4
gap.in[3:8, 4]
# factors are stored as integers behind the scene.  The levels in our case are just the continents

# e.g.  a character vector c("red", "blue","red").  as.factor(colors)
# therfore str(colors)  will give out Levels:blue red
# R is thinking of it as a catagorical variables  2 1 2


# color example
colors <-c("red","blue","red")

as.factor(colors)
as.numeric(colors)
colors<-as.factor(colors)
as.numeric(colors)


#subsetting using nmaes

gap.in$lifeExp

# if you have dataset of 1000s of data,   it makes it easier to skim through the data
# R just tries to do stuff
str(gap.in$lifeExp)
typeof(gap.in$lifeExp)
# memmory is limited.  you can move it to the cloud, so that you can get rid of limiting factors of your compute
# e.g.  deep flyer

# data frame is 2d.  the strcuture is a vector (1d)
# data frame is vector of vector of different types.  R is highly optimized to work with vectors.
# matrix has to be of a single type, and can be n dimensional but has to be the same type.
# dataset can of different types of data

# get just the first three line

gap.in$lifeExp[1:3]

# to pull out the 5th column whatever it is
gap.in[1:3,5]

#To add 3 to all the numbers
gap.in$lifeExp[1:3]+2

# Boolean subsetting
#what if we want the life expectancy of China?
gap.in$lifeExp

gap.in$country
# gives all the different countries

gap.in$country =="China"
# note that China is a factor, but still is inside the quotes.  Because we are sepcifically searching for the term China
# It's parsing the integers for te China behind the scenes

# note R is not written as a programming language.  It is built to do stuff. It looks for China as  a string of characters.
# it is kind of idiot-proofing, but sometimes can be counter intuitive, if you do not have any other language experince

gap.in$lifeExp[gap.in$country=="China"]

gap.in$lifeExp[gap.in$country=="Sri Lanka"]

gap.in$lifeExp[gap.in$country=="United States"]

gap.in$lifeExp[gap.in$country=="China" & gap.in$country=="India"]

gap.in$country=="China" | gap.in$country=="India"

gap.in$lifeExp[gap.in$country=="China" | gap.in$country=="India"]

#  A shortcut
gap.in$lifeExp[gap.in$country %in% c("China","Argentina")]
