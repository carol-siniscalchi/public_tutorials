---
# title: "R for absolute beginners 1: What is R?"
# output: html_notebook
---
  
## Introduction
## R is a free, open-source programming language, used for statistical programming and data analysis. Because it is open-source, the community that uses can create and modify 
## functions, creating *packages* that can do different things. Most packages are stored and made available through the [Comprehensive R Archive Network](https://cran.r-project.org/),
## also know as CRAN. For instructions to download and install R, follow the instructions on the CRAN website. We will use RStudio as well, which is a program that provides a 
## graphical interface to the language. It can be downloaded [here](https://posit.co/download/rstudio-desktop/). 

## Let's get started!

## To begin with, open RStudio. The interface is divided into four boxes. The top left box is the Script interface. In this area you can type your code, then save it as a file to
## re-use later. The bottom left box is the Console interface. Here is where commands are executed and results appear. The top right box is the Environment, where you will 
## see all the variables and data associated with your coding session. The bottom right is the Files interface, which will show all files and plots associated with your project.

## To keep things organized, we can create a Project. To do this, click on *"File" > "New Project"*. Choose *"New directory"*, select *"New Project"*. 
## Type in a name for your project and choose the directory where you want to create this project. Click *"Create Project"*. You'll notice that a new file will appear in the
## File interface. In the top menu of the Files interface, you can click in the symbols to either create a new directory or a new file. All new folders and files will appear under
## your new project. Note that the path (the address of where the project lives in your computer) appears at the top of the Files interface. Click in the symbol to create a new script. 
## The Script interface should appear on the top left corner.

## Welcome new 2025 class! 
  
#### Coding ####

# Before we actually start coding, let's establish an important ground rule: **always comment your code!**

# To do that, start the line with **#**. In RStudio, commented lines will have a different color than the rest of the code. Comments are not executable as commands are, so they will not appear when you run the code. 


## This is a comment! :)

"This is not a comment :("


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

# using rightward operator
33/3 -> eleven
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


# In the same way we make operations with numbers, we can make operations with variables. See below:

apples <- 5

oranges <- 7

fruits <- apples + oranges
print(fruits)

less_oranges <- oranges / 2
print(less_oranges)


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

totalB <- sum(vectorB)
print(totalB)


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

# Now, if we want to quickly consult what meal we will cook on Thursday, we can use a construction like this:
meals_vector["Thursday"]

# Note that we use "[]" to select items within vectors. 
# We can also use **index numbers**, instead of the item name.

# let's see Monday
# note that indexes in R start with 1, not zero
meals_vector[1]

# to select more than one item, our friend c comes in again
meals_vector[c(1,3)]

# to select a sequence
meals_vector[2:4]

# Vectors extracted with "[]" can be further stored in a separate variable. This is also called subsetting.

even_days <- meals_vector[c(2,4)]
even_days

# Imagine we need to add Saturday and Sunday in the menu. How could we go about doing that? Fill in the gaps (...) below:

# create the new meals and days:
weekend_meals <- c("...", "roast")
weekend_days <- c("..." , "...")

# set the names of the new weekend menu
names(weekend_meals) <- ...

# let's try summing up the two vectors
week_meals <- meals_vector + weekend_meals


## What happens when we try to sum the two vectors? Surprise, it's an error! The message should say: "non-numeric argument to binary operator".
## This is because we are trying to apply a function that works only on numeric variables with a string variable. 
## How do we sum up (or concatenate) two vectors?

week_meals <- c(meals_vector, weekend_meals)
print(week_meals)

# If we know a certain meal is in our menu, but we are not sure what day of the week (or position in this list) the meals is in, we can use a different type of the subsetting. 
# We will use a logical operator for this:

# let's see what day of the week we have chili
# The operator "==" means equal to
week_meals == "chili"


# Imagine that you just want to extract the day of the week with the corresponding meal, not a full list of true or false.
# This construction below instructs R to just return the items that correspond to "TRUE" in the week_meals vector. 

chili_vector <- week_meals[week_meals == 'chili']
print(chili_vector)


# Now let's practice what we learned. In this following exercise, you'll be asked to fill in gaps (...) again.

# Let's imagine that besides preparing a weekly menu, we want to investigate if we are going over budget on our food choices. 

# First, let's assemble our meals vector:
meals_vector <- c("chili", "taco", "curry", "pasta", "catfish", "salad", "roast")
 
# Now we create a new vector with the total cost of each meal
value_vector <- c(3, 2, 4, 2, 5, 2, 5)

# Now, set names for the meals vector. You'll use the "names" function and the days of the week as the names
...(meals_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" , "Sunday")

# We will also set the names of the value vector, but for that, we will use our meals as the name
names(value_vector) <- ...("chili", "taco", "curry", "pasta", "catfish", "salad", "roast")

# Now, we want to see what are the cheap meals in our menu. We want to select only meals that cost less than 4 dollars.
# Store these filtered entries in a new vector called "cheap_vector"

..._vector <- value_vector < 4

# That's a good start, but it would be more useful to have only the meals that are cheap with their values. 
# Remember that double filtering we used last?

cheap_vector <- value_vector[..._vector < 4]

# That's better. But suppose we want to figure out what days of the week and meals are above our budget. 
# We need to use another "vector[vector > number] type of filtering, but with an added complication.
# Remember that the names for our meal vector are the days of the week and the names of the cost vector are the meals.

expensive_vector<- meals_vector[..._vector >= 4]

# Now we know which meals we need to replace. We can swap them using the "replace" function
# Note the construction here. We first list the vector to be changed, then the index numbers of the items we want to change, then the replacement values.
new_menu <- replace(meals_vector, c(3, 5, 7), c("beans", "wings", "pizza"))
print(new_menu)

# To replace the values, we have to change the values vector
new_values <- replace(value_vector, c(3, 5, 7), c(3, 3, 3))

# let's make sure our new menu is cheaper
sum(new_values) < sum(value_vector)


# This all seems good, but working with multiple vectors can get complicated. Wouldn't it be easier if we had a table? You bet!
# Can R deal with tables? Of course!
# Tables in R are called data frames, and have all sorts of functions related to them. Let's try this:
  
# first, let's prepare our columns and values
days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" , "Sunday")
meals <- c("chili", "taco", "beans", "pasta", "wings", "salad", "pizza")
cost <- c(3, 2, 3, 3, 4, 2, 3)

week_menu <- data.frame(days, meals, cost)
print(week_menu)

# You see that R automatically includes the name of the vector as column headers. To change this, we can use the names function again.

names(week_menu) <- c("Weekdays", "Meals", "Meal_cost")
print(week_menu)

# We can now use filtering to select the rows we are interested in.
# In the examples below, we will filter by different columns. Note the use of the construction "dataframe$column". The $ is used to represent different columns inside the data frame. 

# First let's select the meals that cost less than 3 dollars
# Note the use of the comma in the end of the command, it is necessary to tell R which column we want
cheap <- week_menu[week_menu$Meal_cost < 3, ]
print(cheap)

# Select Saturday meals
weekend <- week_menu[week_menu$Weekdays == "Saturday" , ]
print(weekend)


# R has a dataframe function to make subsetting easier. It is called subset. With this function, it is easier to do more elaborate selections. 
# Note the use of new notations here: "|" means OR, "&" means AND. The %in% is used when subsetting by more than one value in the same column; 
# "select" is used to filter the columns that appear in the results. 

# Note the construction of the function. We first state the data frame object, then the values we are subsetting, without using the '$' operator
sub1 <- subset(week_menu, Meal_cost == 2 | Meal_cost >= 4)
print(sub1)

sub2 <- subset(week_menu, Meal_cost <3 & Weekdays %in% c("Saturday", "Sunday"))
print(sub2)

sub3 <- subset(week_menu, Meal_cost <3 & Weekdays %in% c("Saturday", "Sunday"), select = Meals)
print(sub3)

# Imagine that the prices have risen, so all the meals that costed 3 dollars now are 3.5. How can we replace these values?
# R has a function for that, called replace. Let's see how it works:

#Note the construction here. First we list the dataframe and column, then the values in that column that we want to replace, then the new value
higher_price <- replace(week_menu$Meal_cost, week_menu$Meal_cost == 3, 3.5)
print(higher_price)


# That's it for today! If you want to practice, you can try to repeat the exercise we made with the vectors using the data frame you generated. You'll see it's much easier. 
# Thank you!
  
  
  
  
  
  
  
  