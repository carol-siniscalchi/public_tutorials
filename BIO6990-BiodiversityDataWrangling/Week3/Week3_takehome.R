
### First, install and load the BioWorldR package (https://cran.r-project.org/web/packages/BioWorldR/BioWorldR.pdf)

install.packages("BioWorldR")
library(BioWorldR)

### Now, load the Germ_lines and Brain_animals datasets:        
germ <- as.data.frame(BioWorldR::Germ_lines_df)
brain <- as.data.frame(BioWorldR::Brain_animals)

## Your task will be to:
  # 1 - filter these two datasets to contain only 3 animals that match across both of them
  # 2 - transform the species column on both to factor
  # 3 - rename the factor levels to match each other
  # 4 - merge the two datasets together; all rows in the germ line dataset should be kept


# please return this R script to me by email when you are done (my email: csiniscalchi@library.msstate.edu)