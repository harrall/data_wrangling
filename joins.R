library(tidyverse)
library(dslabs)

co2
co2_wide <- data.frame(matrix(co2, ncol = 12, byrow = TRUE)) %>% 
  setNames(1:12) %>%
  mutate(year = as.character(1959:1997))
co2_wide


co2_tidy <- gather(co2_wide,month,co2,year)
co2_tidy
co2_tidy <- gather(co2_wide,co2,month,-year)
co2_tidy
co2_tidy <- gather(co2_wide,co2,month,year)
co2_tidy
co2_tidy <- gather(co2_wide,month,co2,-year)
co2_tidy

co2_tidy %>% ggplot(aes(as.numeric(month), co2, color = year)) + geom_line()

library(dslabs)
data(admissions)
dat <- admissions %>% select(-applicants)
dat

dat_tidy <- spread(dat, major, admitted)
dat_tidy

dat_tidy <- spread(dat, gender, major) 
dat_tidy

dat_tidy <- spread(dat, gender, admitted) 
dat_tidy

dat_tidy <- spread(dat, admitted, gender) 
dat_tidy

tmp <- gather(admissions, key, value, admitted:applicants)
tmp

tmp2 <- spread(tmp, column_name, key, gender) 
tmp2

tmp2 <- gather(tmp, column_name, c(gender,key)) 
tmp2

tmp2 <- unite(tmp, column_name, c(gender, key)) 
tmp2

tmp2 <- spread(tmp, column_name, c(key,gender)) 
tmp2

tmp2 <- unite(tmp, column_name, c(key, gender)) 
tmp2

tmp2

# combinig tables

tab1 <- read_csv("tab1.csv")
tab2 <- read_csv("tab2.csv")

dim(tab1)
dim(tab2)
dat <- left_join(tab1, tab2, by = 'state')
dat
dim(dat)

dat <- inner_join(tab1, tab2, by = 'state') 
dim(dat)

dat <- semi_join(tab1, tab2, by = 'state')
dim(dat)


install.packages("Lahman")
library(Lahman)
top <- Batting %>% 
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%    # arrange by descending HR count
  slice(1:10)    # take entries 1-10
top %>% as_tibble()

Master %>% as_tibble()

top_names <- top %>% left_join(Master) %>%
  select(playerID, nameFirst, nameLast, HR)

top_salary <- Salaries %>% filter(yearID == 2016) %>%
  right_join(top_names) %>%
  select(nameFirst, nameLast, teamID, HR, salary)


AwardsPlayers %>% as_tibble()
awards <- AwardsPlayers %>% filter(yearID == 2016) %>% select(playerID)
top2 <- top_names %>% select(playerID)

dplyr::intersect(top2, awards) 
dplyr::setdiff(awards, top2) 










