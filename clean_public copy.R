# Read in data set
library(readr)
publichouse <- read_csv("~/Documents/artificialecon/raw/Public_Housing_Buildings.csv")

# Sort by State
publichouse <- publichouse[order(publichouse$STATE2KX),] 

