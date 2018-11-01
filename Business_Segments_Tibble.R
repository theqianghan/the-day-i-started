x <- c("readxl","tidyverse")
lapply(x, require, character.only=TRUE)
Bike_Store <- read_excel("C:\\Users\\UserPC\\Documents\\Data Analyst Practice\\Bike Store Data.xlsx")

Pivot_BusinessSegment <- Bike_Store %>% 
  group_by(Bike_Store$'Business Segment') %>%
  summarize(n = n()) %>%
  arrange(desc(n))%>%
  print()