# Week 3 lab: data processing with base R

# Our goal for today's lab is to process several data files into a single dataframe that can be posteriorly used for data analysis. 
# We will use functions that we saw in the lecture. 


# Our first step is to load our data into R. We will use the "read.csv" function for this:

traits <- read.csv("traits.csv")

# use the structure function to investigate the variables in this dataframe:
str()

# load the BIO files using the read.csv function, than analyze them using str:

BIO12 <-
BIO1 <- 
  
# Are all the dataframes loaded correctly? Do they all have 2 columns?

# Open the BIO1 file in Notepad (or similar). Can you identify what is the issue?
  
# Use the Help box to investigate the parameters of the read.csv function. 
# Can you see a solution to load this file correctly?
  
BIO1 <-
  
# Is there missing data in these data frames? How is it coded in each file?
# To check, you can either open the data frame using the Global Environment menu, or use the formula below:
  
BIO12[is.na(BIO12)]

# How you could you recode the missing data in the traits data frame to the more generally used "NA"?
# Remember the formula we saw during the lecture: "data$NC13[data$NC13 == -9] <- NA"


# How would remove the missing values from the BIO12 data frame? Remember the na.omit function.


# Let's look at the third environmental file. Load it as elev_rad and analyze its structure.
# is this data in the long or wide format? What format does it need to be to be merged with the other files?

# cast the dataframe so it matches the others. Load the reshape2 package first

library(reshape2)

# Now we will prepare our data to be merged. The first step will be to combine BIO1, BIO12 and elev_rad into one data frame called "environment". 
# For our analysis, it will be important to only keep complete cases, meaning only rows that appear with valid values in all data frames. 

# First, check if the key columns are equally named in the 3 data frames

head()

# Now, use the names() function to set all of them to "species"

names() <- c("species", "")

# use the merge function to create the "environmental" data frame. Remember we can only merge 2 objects at a time.

environmental <- merge()

# To learn what columns were dropped from the original data frame, we can use the setdiff function:

setdiff(BIO1$species, environmental$species)

# We can use the nrow() function to check how many rows we have in the daatframes
# Also, we can use a logical operator to see if the combined dataframe is different than the originals

nrow(environmental) == nrow()

### now, we will merge some of columns im the traits data frame with the environmental. 
# Before doing that, generate a new dataframe, called "traits_reduced", containing only the species and the FTM columns


# merge the reduced database with the environmental database. Make sure all rows of the traits dataframe are kept. 


# use the str() function to check how the FTM variable is coded. We will recode it as a factor.

final$FTM <- as.factor()

# Now, let's rename the factor levels so they show "absent" and "present". We'll use the levels() function:

levels(final$FTM) <- c()

# Finally, let's save this wrangled dataframe as a csv:

write.csv(final, "final_wrangled.csv", row.names = FALSE)






