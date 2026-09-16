## Introduction
## R is a free, open-source programming language, used for statistical programming and data analysis. Because it is open-source, the community that uses can create and modify 
## functions, creating *packages* that can do different things. Most packages are stored and made available through the [Comprehensive R Archive Network](https://cran.r-project.org/),
## also know as CRAN. For instructions to download and install R, follow the instructions on the CRAN website. We will use RStudio as well, which is a program that provides a 
## graphical interface to the language. It can be downloaded [here](https://posit.co/download/rstudio-desktop/). 

## Let's get started!

## To begin with, open RStudio. The interface is divided into four boxes. The top left box is the Script interface. In this area you can type your code, then save it as a file to
## re-use later. The bottom left box is the Console interface. Here is where commands are executed and results appear. The top right box is the Environment, where you will 
## see all the variables and data associated with your coding session. The bottom right is the Files interface, which will show all files and plots associated with your project.

#### Coding ####

# Before we actually start coding, let's establish an important ground rule: **always comment your code!**

# To do that, start the line with #. In RStudio, commented lines will have a different color than the rest of the code. Comments are not executable as commands are, so they will not appear when you run the code. 


## This is a comment! :)

"This is not a comment :("

# second, let's set up a working directory
setwd("C:/Users/cms1422/Dropbox/Libraries/Teaching/Workshops/")

#Let's start with some simple concepts. 

# When using RStudio, you'll write your code in the Script box and click in the "Run" icon on the top right corner of the box (or use Crtl+Enter). 
# The results of your code will appear in the Console box. 

# R can be used to do math, as most programming languages. See some examples below. 

5+6
13-2
33/3
1*11


# If we need to store the values of calculations to use later, we can assign the value to a **variable**. We can do this in different ways, as shown below. 

# Note that we are using the function *"print"* to show the contents of the variable. It is not necessary to use this function, we could just use the name of the variable 
# and run it to see its contents. 

# using equal operator
eleven = 5+6
print(eleven)

# using leftward operator
eleven <- 13-2
print(eleven)


# Variables don't need to include only numbers. They can be words, sets of words (also known as strings), and logical (boolean). 
# We can also store data matrices or series in variables (but this is for later). Let's see how this works. 
# Note the use of the function *"class"* here to check what is the type of the variable. 

# numerical 
number <- 5+6
print(number)
class(number)

# string
# Note that we need to put the text in quotation marks
text <- "eleven"
print(text)
class(text)

# logical
boolean <- TRUE
print(boolean)
class(boolean)


# Variables don't need to contain only one value. We can create *vectors*, containing multiple values. See below:

veggies <- c("potato", "onion", "carrot")
print(veggies)

values <- c(5, 8, 4)
print(values)

logics <- c(TRUE, FALSE, FALSE)
print(logics)


# When making vectors, we use the letter **"c"** out of the parenthesis. This letter represents the function concatenate, which is necessary to connect all the values of the vector. 
# Without it, you will get an error message. Try it:  

veggies <- ("potato", "onion", "carrot")
print(veggies)


# We can do operations with numeric vectors, similarly to what we did with numeric variables. One important thing to note is that in vector operations, 
# operations are done element-wise. We can also do operations on variables that contain vectors. Let's understand this better below:

# Make two vectors
c(2, 4, 6)
c(3, 5, 7)

# Sum these two vectors
c(2, 4, 6) + c(3, 5, 7)

# Assign vectors to variables
vectorA <- c(2, 4, 6)
vectorB <- c(3, 5, 7)

# Then sum the two variables
total <- vectorA + vectorB
print(total)


# If we want to sum the values inside a vector, we can use the *"sum"* function:

totalA <- sum(vectorA)
print(totalA)

print(sum(vectorB))


# Let's use these functions we learned to write a weekly menu. 

# create a vector with the days of the week:
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# create a vector with the meals for the week:
meals_vector <- c("chili", "taco", "curry", "pasta", "catfish")


# To associate the two vectors, we will use a function called *"names"*. 
# This is function is used to get or set the name of an object, and is very widely used. 
# When we use it with vectors, it will give the names to the specified vector following the order of the original vectors. The result will be something like this:

##  Monday | Tuesday | Wednesday | Thursday | Friday
##  chili  | taco    | curry     | pasta    | catfish


# set names
names(meals_vector) <- days_vector
print(meals_vector)



### Extracting elements from vectors (filtering)

# Now, if we want to quickly consult what meal we will cook on Thursday, we can use a construction like this:
meals_vector["Thursday"]

# Note that we use "[]" to select items within vectors. 
# We can also use **index numbers**, instead of the item name.

# to select more than one item, our friend c comes in again
meals_vector[c(1,3)]

# to select a sequence
meals_vector[2:4]

# Vectors extracted with "[]" can be further stored in a separate variable. This is also called subsetting.

tu_th <- meals_vector[c(2,4)]
tu_th



### Filtering with logical operators 

# If we know a certain meal is in our menu, but we are not sure what day of the week (or position in this list) the meals is in, we can use a different type of the subsetting. 
# We will use a logical operator for this:

# let's see what day of the week we have chili
# The operator "==" means equal to
meals_vector == "chili"


# Imagine that you just want to extract the day of the week with the corresponding meal, not a full list of true or false.
# This construction below instructs R to just return the items that correspond to "TRUE" in the week_meals vector. 

chili_vector <- meals_vector[meals_vector == 'chili']
print(chili_vector)



# If we are dealing with more information than just items and names, a table is more useful
# Tables in R are called data frames, and have all sorts of functions related to them. Let's try this:

# first, let's prepare our columns and values
days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" , "Sunday")
meals <- c("chili", "taco", "beans", "pasta", "wings", "salad", "pizza")
cost <- c(3, 2, 3, 3, 4, 2, 3)

week_menu <- data.frame(days, meals, cost)
print(week_menu)

# We can now use filtering to select the rows we are interested in.
# In the examples below, we will filter by different columns. Note the use of the construction "dataframe$column". The $ is used to represent different columns inside the data frame. 

# Let's select the meals that cost less than 3 dollars
# Note the use of the comma in the end of the command, it is necessary to tell R which column we want
cheap <- week_menu[week_menu$cost < 3, ]
print(cheap)

# R has a dataframe function to make subsetting easier. It is called subset. With this function, it is easier to do more elaborate selections. 
# Note the use of new notations here: "|" means OR, "&" means AND. The %in% is used when subsetting by more than one value in the same column; 
# "select" is used to filter the columns that appear in the results. 

# Note the construction of the function. We first state the data frame object, then the values we are subsetting, without using the '$' operator
sub1 <- subset(week_menu, cost == 2 | cost >= 4)
print(sub1)

sub2 <- subset(week_menu, cost <3 & days %in% c("Saturday", "Sunday"))
print(sub2)

# we can write our data frame to a csv file
write.csv(week_menu, "week_menu.csv")

# we can also load a data frame into R, instead of typing it out
my_menu <- read.csv("week_menu.csv", header = TRUE)
my_menu

## That's all for today! 








