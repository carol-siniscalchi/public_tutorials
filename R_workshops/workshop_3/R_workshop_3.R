---

  ### title: "R for absolute beginners: Basic data visualization in R"

---
  
## Data visualization is an extensive subject, with almost infinite resources. Despite that, knowing a little bit about data visualization can be very valuable to improve our communication about our research. 
## ggplot2 is designed to work iteratively. You start with a layer that shows the raw data. Then you add layers of annotations and statistical summaries. 
## This allows you to produce graphics using the same structured thinking that you would use to design an analysis. 



## We'll start this tutorial with a standard data set that comes with ggplot2, called 'mpg', which contains a subset of vehicle fuel economy data released by the EPA. 
## Its variables are explained here: https://ggplot2.tidyverse.org/reference/mpg.html.

## First we install and load ggplot:

install.packages("ggplot2")
library(ggplot2)

### Now let's check the dataset:
  
str(mpg)
summary(mpg)

## Now we can start plotting!
  
## Every ggplot2 plot has three key components:
  
# - data,
# - a set of aesthetic mappings between variables in the data and visual properties, and
# - at least one layer which describes how to render each observation. Layers are usually created with a geom function.

## Let's see how this work in practice. Our first example will be a scatterplot of the 'displ' and 'hwy' variables. 
## We will be investigating the relationship between engine size and mileage while driving in a highway. 
## Scatterplots are useful when looking at relationships between continuous variables. 


# the first line of the command calls the ggplot package, then specifies the data we are using 'mpg'. 
## Then it specifies the aesthetics we are mapping (which usually means what variables from the dataset are being used in each axis).
# The plus sign is important here, as it adds sequential layers to our plot. 
# The second line specifies what type of graph we are using, usually as 'geom_'. 

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point()

# if we run only the first line it might make it easier to understand the construction: 
ggplot(mpg, aes(x = displ, y = hwy))


## This is neat, but we can make our plot more attractive, using just a few more parameters. 
## To modify how the points are represented, we have to add more parameters to the geom_point function. Some parameters we can use are color, size and shape.


### Let's make the points marron, by changing the color parameter
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color = "maroon")

### ggplot has ~500 named colors available (see here: https://sape.inf.usi.ch/quick-reference/ggplot2/colour), and it also accepts HEX color codes. 

# we can easily change the size of the points with the size parameter
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color = "maroon", size = 5)

# to change the point shape, we need to refer to the ggplot shape reference. They can be called with the shape parameter by number or name:
## see here: https://ggplot2.tidyverse.org/articles/ggplot2-specs.html?q=point%20shape#sec:shape-spec
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color = "maroon", size = 5, shape = 2)

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color = "maroon", size = 5, shape = "triangle")

# one more example:
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color = "lightblue", size = 5, shape = 15)


## If we want to look at the distribution of a single continuous variable, we can use a histogram, which divides the distribution in bins 
## and then counts the number of cases in which one of the bins. 
## By default, the bin size in ggplot is 30. Note here that we only represent the x axis (because the y axis will be the counts of the same variable), 
## and we change the geom_point function to geom_histogram.


# looking at the distribution of the hwy variable:
ggplot(mpg, aes(x = hwy)) + 
  geom_histogram()

## Not always the default bin size will give you the level of detail you want, or it will oversplit your data. To change this, we use the "bins" parameter with the geom_ function. 

ggplot(mpg, aes(x = hwy)) + 
  geom_histogram(bins = 15)

ggplot(mpg, aes(x = hwy)) + 
  geom_histogram(bins = 50)

## Let's change the color of the bars:

ggplot(mpg, aes(x = hwy)) + 
  geom_histogram(bins = 15, color = "turquoise")

## How did the color parameter behave this time? 
## Plot elements that have a wider area usually have two parameters: color, which controls the stroke (or the margins, border, contour) of the shape, and fill, which controls the fill. 

ggplot(mpg, aes(x = hwy)) + 
  geom_histogram(bins = 15, color = "turquoise", fill = "paleturquoise")

## Maybe we could change the background color of the plot to make it more legible? 
## ggplot has a series of pre-programmed themes that help with that. To use them, we need to add anoother layer to the plot.

ggplot(mpg, aes(x = hwy)) + 
  geom_histogram(bins = 15, color = "turquoise", fill = "paleturquoise") +
  theme_bw()

## If we wanted to plot a categorical variable, we could apply a barplot instead of a histogram, which will show the count of each category in the variable.

ggplot(mpg, aes(x = class)) + 
  geom_bar(width = 0.6, color = "forestgreen", fill = "lightgreen") +
  theme_bw()

## Pretty neat, no?
## Let's look back at our scatterplot now. 

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point(color = "maroon", size = 5, shape = "triangle")

## What if we could add more information to this plot? For example, it might be useful to learn what type of cars have a better mileage, or smaller engines. 
## One way to do this would be by coloring the points with the type of car (provided in the variable class). We can do that by adding another parameter in our aesthetics. 

ggplot(mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point(size = 5, shape = "triangle") +
  theme_bw()

## The rainbow palette is the default for categorical variables in ggplot. We can tweak in different ways.
## One is by manually setting the colors. Note here that we add a new layer to the plot ' scale_color_manual'. 
## Scales are used to override ggplot defaults. They have many uses, like changing colors, axis proportions, locations, etc. 

ggplot(mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point(size = 5, shape = "triangle") +
  scale_color_manual(values = c("red", "blue", "yellow", "purple", "#ff33ad", "#33ff86", "#ff8533" )) +
  theme_grey()

## We can also select pre-made palletes from other packages. One that works very well with ggplot is ColorBrewer. Let's get it going.
## We can see this palletes and their properties here: https://colorbrewer2.org/#type=sequential&scheme=BuGn&n=3

install.packages("RColorBrewer")
library(RColorBrewer)

# show palettes:
display.brewer.all()

## Now let's see how we use them.

ggplot(mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point(size = 5, shape = "triangle") +
  scale_fill_brewer(palette ="Set3") +
  theme_grey()

## Scatterplots are frequently used together with linear regressions, to test the relation between a dependent and an independent variable. 
## We can model a linear regression and plot the line of best fit on our scatterplot without leaving ggplot, just by adding a new layer:
  
ggplot(mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point(size = 5, shape = "triangle") +
  scale_fill_brewer(palette ="Set3") +
  stat_smooth(method = "lm", color = "black") +
  theme_grey()

# to remove the standard error shade from the line:
ggplot(mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point(size = 5, shape = "triangle") +
  scale_fill_brewer(palette ="Set3") +
  stat_smooth(method = "lm", color = "black", se = FALSE) +
  theme_grey()

## Look what happens if we don't specify the line color in the stat_smooth function:
ggplot(mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point(size = 5, shape = "triangle") +
  scale_fill_brewer(palette ="Set3") +
  stat_smooth(method = "lm") +
  theme_grey()

## Sometimes when we have too many data points, it might be easier to break down the plots by category instead of plotting them all together. This is usually called facetting. 
## ggplot makes it easier to apply this with the facet_wrap function, added as another layer:
  
### Note the ~ before the variable name
ggplot(mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point(size = 2, shape = "triangle") +
  scale_fill_brewer(palette ="Set3") +
  stat_smooth(method = "lm", color = "black") +
  facet_wrap(~class) +
  theme_grey()

## Faceting work with all types of plots, as long as you are using a categorical variable to facet:
  
ggplot(mpg, aes(x = hwy, fill = class)) + 
  geom_histogram(bins = 10) +
  facet_wrap(~class)

## It can be particularly useful to show the cross-tabulation of two categorical variables. Note the use of "y=..prop..", which sets the y axis as a proportion, not count. 
## The scale_y_continuous changes the values on the y axis to proportion as well. 

ggplot(mpg, aes(x=drv, y=..prop.., group=1))+ 
  geom_bar(fill="lightpink", color = "hotpink")+
  facet_wrap(~class)+
  scale_y_continuous(labels = scales::percent)+ 
  theme_bw()


##############

## Let's step away from the model data now and use the data table we created and cleaned on the last workshop. 

data <- read.csv("AHS2009_combined_clean.csv")
str(data)

## A type of plot that is very widely used in scientific communication is boxplots, and its cousin, the violin plot. 
## These plots summarize how levels of a continuous variable change in relation to a categorical variable. They have their own geoms: geom_boxplot and geom_violin.
## Boxplots summarize the shape of the distribution of the continuous variable providing summary statistics: median, first and third quartiles, and outliers.
## Let's look at the relationship between our variables that record time spent going to work and transportation with a boxplot.

ggplot(data, aes(x = transport_mode, y = journey_time, fill = transport_mode)) + 
  geom_boxplot()

## We can adjust the angle of the category labels on the x axis to make it more legible by adding yet another layer. 

ggplot(data, aes(x = transport_mode, y = journey_time, fill = transport_mode)) + 
  geom_boxplot() + 
  theme(axis.text.x = element_text(angle = 45))

## You probably noticed that ggplot inputs as axis labels the names of the variables. The labels can be adjusted to make them more informative. We can also add a plot title.
## All these labels are controlled by the "labs" function. Noticed that all the parameters are in the same parenthesis.
## We will also remove the legend, because it seems a little redundant here. We add another layer for this. 

ggplot(data, aes(x = transport_mode, y = journey_time, fill = transport_mode)) + 
  geom_boxplot() + 
  theme(axis.text.x = element_text(angle = 45)) + 
  labs(x = "Method of transportation", y = "Journey to work (minutes)", title = "Time spent on journey to work by method of transportation", 
       subtitle = "American Housing Survey, New Orleans, 2009") +
  theme(legend.position = "none")

## When we have multiple categorical categories, it might be interest to see how they are associated. 
## An easy way to do that is select a different variable for the color parameter in the aesthetics. 
## Let's try this with the gender category. Note that we activate the legend again and add a new item to labs to change the legend title. 

ggplot(data, aes(x = transport_mode, y = journey_time, fill = gender)) + 
  geom_boxplot() + 
  theme(axis.text.x = element_text(angle = 45)) + 
  labs(x = "Method of transportation", y = "Journey to work (minutes)", title = "Time spent on journey to work by method of transportation", 
       subtitle = "American Housing Survey, New Orleans, 2009",
       fill = "Gender") 

## We could apply faceting instead. Choosing which one to use will depend on what you want to show with the data. 
## Note that we changed the position of the legend by using the theme function.

ggplot(data, aes(x = transport_mode, y = journey_time, fill = transport_mode)) + 
  geom_boxplot() + 
  theme(axis.text.x = element_text(angle = 45)) + 
  labs(x = "Method of transportation", y = "Journey to work (minutes)", title = "Time spent on journey to work by method of transportation", 
       subtitle = "American Housing Survey, New Orleans, 2009",
       fill = "Gender") +
  facet_wrap(~gender) + 
  theme(legend.position = "left")

### Violin plots are another way of summarizing distributions. It shows a compact representation of the “density” of the distribution, 
## highlighting the areas where more points are found. It works very similarly to the boxplot. 

ggplot(data, aes(x = gender, y = income, fill = gender)) + 
  geom_violin()

### The shape of the violin changes to show where most of the points fall (the wider parts of the violin)

## Sometimes we need to transform our variables to make them fit graphs better. Here, because the income range is very wide, 
## the labels end up beign automatically put in scientific notation. Let's divide the income by a thousand to adjust it. 

ggplot(data, aes(x = gender, y = income/1000, fill = gender)) + 
  geom_violin() +
  labs(x = "Gender", y = "Annual income (thousands of dollars)", title = "Income by gender", 
       subtitle = "American Housing Survey, New Orleans, 2009",
       fill = "Gender") +
  scale_fill_manual(values = c("#ff33a2", "#ff9033"))

## Violin plots can be hard to understand because of the density calculations. One way to correct for this is to show a boxplot inside the violin. 
## Because of the layering property, it is easy to do that with ggplot.
## Here, witdth controls the width of the boxplot. When overlaying, 0.1 usually gives the right proportions. 
## The alpha parameter here controls the transparency of the grey filling in the plot.

ggplot(data, aes(x = gender, y = income/1000, fill = gender)) + 
  geom_violin() +
  geom_boxplot(width=0.1, fill = "grey75", alpha = 0.5) +
  labs(x = "Gender", y = "Annual income (thousands of dollars)", title = "Income by gender", 
       subtitle = "American Housing Survey, New Orleans, 2009",
       fill = "Gender") +
  scale_fill_manual(values = c("#ff33a2", "#ff9033"))

## Another way is to plot the distribution of points on top of the violin. This usually creates a visually polluted plot, so it might not be the best option. 

ggplot(data, aes(x = gender, y = income/1000, fill = gender)) + 
  geom_violin() +
  geom_boxplot(width=0.1, fill = "grey75", alpha = 0.5) +
  geom_jitter(alpha = 0.5) +
  labs(x = "Gender", y = "Annual income (thousands of dollars)", title = "Income by gender", 
       subtitle = "American Housing Survey, New Orleans, 2009",
       fill = "Gender") +
  scale_fill_manual(values = c("#ff33a2", "#ff9033"))

## Let's go back to scatterplots for a minute. Lets plot the relationship between age and income and color the points by gender. 
## We'll also add a best fitting line for a linear regression.

ggplot(data, aes(x=age, y=income/1000, color = gender), alpha=0.5) +
  geom_point() +
  stat_smooth(method = "lm")

## That looks neat, but imagine if we could add information about one more continuous variable to this scatterplot. 
## We definitely can, by using a bubble plot. Here, instead of having all the points being the same size, 
## we generate bubbles of different sizes based on the journey_time variable and using the "size" parameter. 

ggplot(data, aes(x=age, y=income/1000, size = journey_time/60, color = gender)) +
  geom_point(alpha=0.5) +
  scale_size(range = c(1, 20), name="Journey time (hours)") +
  ylim(20,200)

## If we want to plot a regression line, we have to change our commands a little, to avoid one geom cancelling the other

ggplot(data) +
  geom_point(aes(x=age, y=income/1000, size = journey_time/60, color = gender), alpha=0.5) +
  stat_smooth(aes(x=age, y=income/1000, color = gender), method = "lm") +
  scale_size(range = c(1, 20), name="Journey time (hours)") +
  ylim(20,200)

## Scatterplots with many points can be difficult to understand due to the overlap of points. One way to deal with this is to use a 2D-density scatterploit, 
## which instead of showing the points, created bins and colors the bins according to the number of points on it. 
## Let's see what happens with our previous scatterplot. We are using the geom_hex function. 

ggplot(data, aes(x=age, y=income/1000)) +
    geom_hex(bins = 15) +
    scale_fill_continuous(type = "viridis") +
    geom_smooth(method = "lm", color = "white")


## Now, to end this workshop, let's see how to save our plots!
## The easiest way is to send them to a pdf file:

pdf(file = "scatter_ageVincome_density.pdf", height = 4, width = 6)
ggplot(data, aes(x=age, y=income/1000)) +
  geom_hex(bins = 15) +
  scale_fill_continuous(type = "viridis") +
  geom_smooth(method = "lm", color = "white")
dev.off()

### You could also save the plot to a variable:

scatter_density <- ggplot(data, aes(x=age, y=income/1000)) + geom_hex(bins = 15) + scale_fill_continuous(type = "viridis") + geom_smooth(method = "lm", color = "white")

pdf(file = "scatter_ageVincome_density_2.pdf", height = 4, width = 6)
scatter_density
dev.off()

### We can create composite figures with a package called ggpubr

install.packages("ggpubr")
library(ggpubr)

box <- ggplot(data, aes(x = gender, y = income/1000, fill = gender)) + 
        geom_violin() +
        geom_boxplot(width=0.1, fill = "grey75", alpha = 0.5) +
        labs(x = "Gender", y = "Annual income (thousands of dollars)", title = "Income by gender", 
        subtitle = "American Housing Survey, New Orleans, 2009",
        fill = "Gender") +
        scale_fill_manual(values = c("#ff33a2", "#ff9033"))

scatter <- ggplot(data, aes(x = age, y = income/1000, color = gender, shape = gender)) + 
            geom_point(size = 2) +
            labs(x = "Age", y = "Annual income (thousands of dollars)", title = "Income by age", 
            subtitle = "American Housing Survey, New Orleans, 2009",
            fill = "Gender") +
            scale_color_manual(values = c("#ff33a2", "#ff9033"))

pdf(file="genderVincomeVage.pdf", width = 10, height = 5)
ggarrange(box, scatter, 
          ncol = 2, nrow = 1,
          common.legend = TRUE, legend = "bottom",
          labels="AUTO")
dev.off()












  
  
  