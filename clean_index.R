# Read in data set
library(readr)
file_location <- "~/Desktop/artificialecon"
setwd(file_location)
healthdata <- read_csv("./datasets/Environmental_Health_Hazard_Index.csv")
jobsdata <- read_csv("./datasets/Jobs_Proximity_Index.csv")
locationdata <- read_csv("./datasets/Location_Affordability_Index_Data.csv")
transportdata <- read_csv("./datasets/Low_Transportation_Cost_Index.csv")
schooldata <- read_csv("./datasets/School_Proficiency_Index.csv")

# Merge data set
tract_merge<- merge(healthdata, transportdata, by="TRACT_ID", all.x=TRUE, all.y=TRUE)
locationdata$BLOCKGROUPID <- locationdata$blkgrp
block_merge<- merge(jobsdata, locationdata, by="BLOCKGROUPID", all.x=TRUE, all.y=TRUE)
block_merge<- merge(block_merge, schooldata, by="BLOCKGROUPID", all.x=TRUE, all.y=TRUE)

write.csv(tract_merge, file = "./clean/tract_data.csv")
