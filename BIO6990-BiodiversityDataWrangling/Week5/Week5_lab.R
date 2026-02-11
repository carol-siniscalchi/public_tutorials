#### Week 5: tidyverse ####

######################################################
# You have one main task for this week's lab: cleaning the dataframe contained in the file "seed_dirty.csv"
# This is a table that I extracted from a website. We saw a clean version of this table during Monday's lecture.
# I'm also providing a second table containing the type of vegetable and the family they belong to.
# The final clean data should be tidy: one variable per column, one observation per row and one value per cell
# You should preferably use functions from the dplyr and tidyr packages, but feel free to bring in functions from other packages.
# Please return this script to me with all the steps you used. Comment your code to explain why each function is being used. 


## Tips:

# the "row.names = NULL" parameter in the read.csv function can come in handy here

# remember that transformation of columns into numeric or factor variables might be needed

# the following function structure can be used to replace text within columns
mutate(across('column_name', str_replace, 'text to replace', 'new text')






# After you've cleaned the data, please respond to the questions below:

# 1) What is the plant family that has the lowest minimum germination temperature?
# 2) What is the family that has the lowest average maximum germination time?
# 3) Calculate the difference between the minimum and maximal temperatures. What families share the same average range?
# 4) What is the type of vegetable that has the lowest germination temperatures?
# 5) Calculate the average maximum temperatures of the four types of vegetables. 
#     5a) How would you test if the differences in these averages is statistically significant? Take a stab at a function that performs this type of test.
#     5b) How would you test which pairwise comparisons among the vegetable types are statistically significant? Take a try at it.
