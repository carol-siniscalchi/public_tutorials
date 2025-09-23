## Data visualization is an extensive subject, with almost infinite resources. Despite that, knowing a little bit about data visualization can be very valuable to improve our communication about our research. 
## ggplot2 is designed to work iteratively. You start with a layer that shows the raw data. Then you add layers of annotations and statistical summaries. 
## This allows you to produce graphics using the same structured thinking that you would use to design an analysis. 

## First we install and load ggplot:

install.packages("ggplot2")
library(ggplot2)

### Now let's check the dataset:

str(iris)
summary(iris)

### Scatterplots ###

## scatterplots require the use of the geom_point geometry

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()

# we can change the color and size of the points by adding parameters to geom_point

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(color = "forestgreen", size = 4)

# we can also change point shape, calling them by either name or number (see full list here: https://ggplot2.tidyverse.org/articles/ggplot2-specs.html?q=point%20shape#sec:shape-spec)

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(color = "purple", size = 4, shape = "triangle")

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(color = "dodgerblue", size = 4, shape = 15)

## because we have a categorical variable in the dataset, we can include more information to the plot (by coloring the points by category, for example)
## For this, we need to include a new aesthetics, called color. 

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point()

## we can change the colors by adding a scale element 

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) + 
  scale_color_manual(values = c("deeppink", "goldenrod", "tomato2")) + 
  theme_light()

# We can change the text on the axis labels by adding a new layer

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) + 
  scale_color_manual(values = c("deeppink", "goldenrod", "tomato2")) + 
  theme_light() +
  labs(title = "Sepal dimentions", x = "Sepal length (mm)", y = "Sepal width (mm)")


# ggplot allows the inclusion of more than one geometry in the same plot
# for example, we can add a regression line to represent the relationship between variables

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) +   
  scale_color_manual(values = c("deeppink", "goldenrod", "tomato2")) + 
  theme_light() +
  labs(title = "Sepal dimentions", x = "Sepal length (mm)", y = "Sepal width (mm)") +
  geom_smooth(method = "lm")

# because we added the color parameter to the main aesthetics, the geom_smooth geometry inherits it
# to add a single line, maintaining the mapping of different colors to different categories, we need to move the color parameter
# we will also change the line color and remove the standard error "se" band

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(aes(color = Species), size = 3) +   
  scale_color_manual(values = c("deeppink", "goldenrod", "tomato2")) + 
  theme_light() +
  labs(title = "Sepal dimentions", x = "Sepal length (mm)", y = "Sepal width (mm)") +
  geom_smooth(method = "lm", color = "black", se = FALSE)

# another useful type of plot for continuous variables are histograms. They represent the distribution
# of a single continuous variable

ggplot(iris, aes(x = Petal.Length)) +
  geom_histogram()

# this functions collates all the measures recorded in the dataset and distributes them into bins
# the default bin size is 30, Let's try to modify it.

ggplot(iris, aes(x = Petal.Length)) +
  geom_histogram(binwidth = 0.1)

ggplot(iris, aes(x = Petal.Length)) +
  geom_histogram(binwidth = 1)

# we can also color the bars by species, like we did with the scatterplot.

## first, let's save the collor pallete as a variable:
cols <- c("deeppink", "goldenrod", "tomato2")

# then, we add a new parameter in our aesthetic, called "fill"
# it has the same function as color, but works for filling larger shapes, like bars
ggplot(iris, aes(x = Petal.Length, fill = Species)) +
  geom_histogram() +
  scale_fill_manual(values = cols) +
  theme_classic()

# we can add a border to the bars by adding a color parameter in our geometry
ggplot(iris, aes(x = Petal.Length, fill = Species)) +
  geom_histogram(color = "grey30") +
  scale_fill_manual(values = cols) +
  theme_classic()

## if we are looking at distributions of continuous variables, another type of graph, the boxplot, can
## be more useful. 
## Boxplots summarize the shape of the distribution of the continuous variable providing summary 
## statistics: median, first and third quartiles, and outliers.

ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot() +
  scale_fill_manual(values = cols) +
  theme_classic()

## boxplots can be difficult to interpret because they hide the real distribution of points.
## we can add them back by including a second geometry

ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.5) +
  scale_fill_manual(values = cols) +
  theme_classic()

## another way of representing the distribution of points is through a violin plot
## the violin is wider in the areas where there are more points

ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_violin() +
  scale_fill_manual(values = cols) +
  theme_classic()

# a common strategy is to represent a boxplot inside the vionlin
ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_violin() +
  geom_boxplot(width=0.05, fill = "grey75", alpha = 0.5) +
  scale_fill_manual(values = cols) +
  theme_classic()

## let's make it prettier

violinbase <- ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_violin() +
  geom_boxplot(width=0.05, fill = "grey75", alpha = 0.5) +
  scale_fill_manual(values = cols) +
  theme_classic()

violinbase +
  labs(title = "Petal length by species", x = "", y = "Petal length (cm)") +
  theme(legend.position = "none")

## it's easy to invert the axis
violinbase +
  labs(title = "Petal length by species", x = "", y = "Petal length (cm)") +
  theme(legend.position = "none") +
  coord_flip()

## let's go back to our scatterplot 
scatterbase <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) + 
  scale_color_manual(values = c("deeppink", "goldenrod", "tomato2")) + 
  theme_light()

# there is a lot of overlap between the species versicolor and virginica
# we can take care of this by using facetting, a function that allows to 
# split a plot into smaller plots by category. There are two main functions for this

# this is the facet_grid function. It can be used to split the values either by columns or rows
scatterbase +
  facet_grid(cols = vars(Species))

scatterbase +
  facet_grid(rows = vars(Species))

# we can save a pdf of our plot by using the pdf function

pdf("scatter_rows.pdf", height = 7, width = 5)
scatterbase +
  facet_grid(rows = vars(Species)) +
  theme(legend.position = "none")
dev.off()

# we can use a different package, called ggpubr, to make composite figures
library(ggpubr)

## first we save our plots as variables
sc <- ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3) + 
  scale_color_manual(values = c("deeppink", "goldenrod", "tomato2")) + 
  theme_classic() +
  labs(x = "Petal length", y = "Petal width") +
  theme(legend.position = "none")

vl <- ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_violin() +
  geom_boxplot(width=0.05, fill = "grey75", alpha = 0.5) +
  scale_fill_manual(values = cols) +
  theme_classic() +
  labs(x = "", y = "Petal length") +
  theme(legend.position = "none")

ht <- ggplot(iris, aes(x = Petal.Length, fill = Species)) +
  geom_histogram() +
  scale_fill_manual(values = cols) +
  theme_classic() +
  labs(x = "Petal length", y = "") +
  theme(legend.position = "none")

bx <- ggplot(iris, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.5) +
  scale_fill_manual(values = cols) +
  theme_classic() +
  labs(x = "", y = "Petal length") +
  theme(legend.position = "none")

## then we set it
pdf("four_plots.pdf", height = 6, width = 6)
ggarrange(ht, sc, bx, vl,
          ncol = 2, nrow = 2, 
          common.legend = TRUE, legend = "bottom",
          labels="AUTO")
dev.off()

## and that's it for today! Happy plotting!

