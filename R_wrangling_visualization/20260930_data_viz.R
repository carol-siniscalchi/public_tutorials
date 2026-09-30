## Data visualization is an extensive subject, with almost infinite resources. 
# Despite that, knowing a little bit about data visualization can be very valuable to 
# improve  communication about our research. 
## ggplot2 is designed to work iteratively. You start with a layer that shows the raw data. 
# Then you add layers of annotations and statistical summaries. 
## This allows you to produce graphics using the same structured thinking that you would 
# use to design an analysis. 

## First we install and load the tidyverse packages:

install.packages("tidyverse")
library(tidyverse)

### We will use the penguins dataset, from the palmerpenguins package
penguins<-readRDS("penguins.rds")


str(penguins)
summary(penguins)

## Let's warm up with some data wrangling first:

# we'll use a couple of "Verbs" to calculate the average and standard deviation 
# of the body mass of penguins of different species

penguins %>%
  group_by(species) %>%
  summarize(mean_bm = mean(body_mass_g), sd_bm = sd(body_mass_g))

# we get some NA values - this is because the summarize functions don't automatically get rid of NAs

penguins %>%
  drop_na() %>%
  group_by(species) %>%
  summarize(mean_bm = mean(body_mass_g), sd_bm = sd(body_mass_g))

# much better!
# we could additionally group by sex:
penguins %>%
  drop_na() %>%
  group_by(species, sex) %>%
  summarize(mean_bm = mean(body_mass_g), sd_bm = sd(body_mass_g))

# if we want to check the penguins of a single island, we can use filter
penguins %>%
  drop_na() %>%
  filter(island == "Biscoe") %>%
  group_by(species, sex) %>%
  summarize(mean_bm = mean(body_mass_g), sd_bm = sd(body_mass_g))
# we only have two species in this island

# we can easily create calculated variables:

penguins %>%
  mutate(bill_ratio = bill_depth_mm/bill_length_mm) %>%
  str()

# let's find the chonkest penguin in 2007:
penguins %>%
  filter(year == 2007) %>%
  summarize(chonker = max(body_mass_g, na.rm=TRUE))

# if we want to see the whole row, filter is a better option
penguins %>%
  filter(year == 2007) %>%
  filter(body_mass_g == max(body_mass_g, na.rm=TRUE))

# let's see the chonkiest penguin in each island
penguins %>%
  group_by(island) %>%
  filter(year == 2007) %>%
  filter(body_mass_g == max(body_mass_g, na.rm=TRUE))

## Ok, let's move on to some plots now:

### Scatterplots ###

## scatterplots are use to show the relation between two continuous variables

penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point()   # this function calls the point layer

# we can change the color and size of the points by adding parameters to geom_point

penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point(color = "firebrick", size = 4)

# we can also change point shape, calling them by either name or number (see full list here: https://ggplot2.tidyverse.org/articles/ggplot2-specs.html?q=point%20shape#sec:shape-spec)

penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point(color = "purple", size = 4, shape = "triangle")

penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm)) +
  geom_point(color = "dodgerblue", size = 4, shape = 15)

## because we have a categorical variable in the dataset, we can include more information to the plot (by coloring the points by category, for example)
## For this, we need to include a new aesthetics, called color. 

penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm, color = species)) +
  geom_point()

## we can change the colors by adding a scale element
# note that we also added a theme element here
penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm, color = species)) +
  geom_point(size = 3) + 
  scale_color_manual(values = c("deeppink", "goldenrod", "tomato2")) +
  theme_classic()

# we can save our color scale as a variable so we don't have to type it all over again
cols <- c("deeppink", "goldenrod", "tomato2")

# We can change the text on the axis labels by adding a new layer

penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm, color = species)) +
  geom_point(size = 3) + 
  scale_color_manual(values = cols) + 
  theme_light() +
  labs(title = "Bill dimentions", x = "Bill depth (mm)", y = "Bill length (mm)", color = "Species")


# ggplot allows the inclusion of more than one geometry in the same plot
# for example, we can add a regression line to represent the relationship between variables

penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm, color = species)) +
  geom_point(size = 3) +   
  scale_color_manual(values = cols) + 
  theme_light() +
  labs(title = "Bill dimentions", x = "Bill depth (mm)", y = "Bill length (mm)", color = "Species") +
  geom_smooth(method = "lm")

### Histograms
# another useful type of plot for continuous variables are histograms. 
# They represent the distribution of a single continuous variable

penguins %>%
  ggplot(aes(x = body_mass_g)) +
  geom_histogram()


# we can also color the bars by species, like we did with the scatterplot.

# then, we add a new parameter in our aesthetic, called "fill"
# it has the same function as color, but works for filling larger shapes, like bars
penguins %>%
  ggplot(aes(x = body_mass_g, fill = species)) +
  geom_histogram() +
  scale_fill_manual(values = cols) +
  theme_classic()

# we can add a border to the bars by adding a color parameter in our geometry
penguins %>%
  ggplot(aes(x = body_mass_g, fill = species)) +
  geom_histogram(color = "grey30", alpha = 0.5) +
  scale_fill_manual(values = cols) +
  theme_classic()

### Barplots
# barplots are useful when we want to study categorical variables:
penguins %>%
  count(species) %>%
  ggplot(aes(x = species, y = n, fill = species)) +
  geom_col() +
  scale_fill_manual(values = cols) +
  theme_classic()

# it's good practice to arrange the bars in ascending or descending order
penguins %>%
  count(species) %>%
  ggplot(aes(x = reorder(species, -n), y = n, fill = species)) +
  geom_col() +
  scale_fill_manual(values = cols) +
  theme_classic()


## Boxplots
## if we are looking at distributions of continuous variables, another type of graph, the boxplot, can
## be more useful. 
## Boxplots summarize the shape of the distribution of the continuous variable providing summary 
## statistics: median, first and third quartiles, and outliers.

penguins %>%
  ggplot(aes(x = species, y = body_mass_g, fill = species)) +
  geom_boxplot() +
  scale_fill_manual(values = cols) +
  theme_classic()

## Because we have a second categorical variable, sex, we could split this graph further
penguins %>%
  ggplot(aes(x = species, y = body_mass_g, fill = sex)) +
  geom_boxplot() +
  scale_fill_manual(values = c('#1AAFBC', '#ADEFD1')) +
  theme_classic()

## oops, we can remove the NAs
penguins %>%
  drop_na() %>%
  ggplot(aes(x = species, y = body_mass_g, fill = sex)) +
  geom_boxplot() +
  scale_fill_manual(values = c('#1AAFBC', '#ADEFD1')) +
  theme_classic()

# Imagine that we want this same boxplot, but with the values further divided 
# by island. We are out of dimensions in the plot itself, but we can split the plot into 
# smaller plots for each island. This is called facetting.
penguins %>%
  drop_na() %>%
  ggplot(aes(x = species, y = body_mass_g, fill = sex)) +
  geom_boxplot() +
  scale_fill_manual(values = c('#1AAFBC', '#ADEFD1')) +
  theme_classic() +
  facet_grid(cols = vars(island))


# we can save a pdf of our plot by using the pdf function

pdf("boxplot_facet.pdf", height = 5, width = 8)
penguins %>%
  drop_na() %>%
  ggplot(aes(x = species, y = body_mass_g, fill = sex)) +
  geom_boxplot() +
  scale_fill_manual(values = c('#1AAFBC', '#ADEFD1')) +
  theme_classic() +
  facet_grid(cols = vars(island)) +
  labs(x = "Species", y = "Body mass (g)", fill = "Sex")
dev.off()

# we can use a different package, called ggpubr, to make composite figures
library(ggpubr)

## first we save our plots as variables
bx <- penguins %>%
  ggplot(aes(x = species, y = body_mass_g, fill = species)) +
  geom_boxplot() +
  scale_fill_manual(values = cols) +
  theme_classic() +
  labs(x = "", y = "Body mass (g)", fill = "Species") +
  theme(legend.position = "none")

sc <- penguins %>%
  ggplot(aes(x = bill_depth_mm, y = bill_length_mm, color = species)) +
  geom_point(size = 3) +   
  scale_color_manual(values = cols) + 
  theme_light() +
  labs(x = "Bill depth (mm)", y = "Bill length (mm)" , color = "Species") +
  geom_smooth(method = "lm") +
  theme(legend.position = "none")



## then we set it
pdf("four_plots.pdf", height = 6, width = 10)
ggarrange(bx, sc,
          ncol = 2, nrow = 1, 
          common.legend = TRUE, legend = "bottom",
          labels="AUTO")
dev.off()

## and that's it for today! Happy plotting!

