#I condensed five libraries in one line
library("lubridate","dplyr","dslabs","caret","e1071")

#lines 5 to 10 were taken from third-party source
data("reported_heights")

dat <- mutate(reported_heights, date_time = ymd_hms(time_stamp)) %>%
  filter(date_time >= make_date(2016, 01, 25) & date_time < make_date(2016, 02, 1)) %>%
  mutate(type = ifelse(day(date_time) == 25 & hour(date_time) == 8 & between(minute(date_time), 15, 30), "inclass","online")) %>%
  select(sex, type)

#lines 13 to 19 were written by me
y <- factor(dat$sex, c("Female", "Male"))
y_hat <- ifelse(x == "inclass", "Female","Male") %>% factor()
x <- dat$type

table(sex = dat$sex, type = dat$type)

confusionMatrix(data = y_hat, reference = y)

