library(dslabs)
library(tidyverse)    # includes readr
library(readxl)

getwd()
# setwd(\bb_test\data_wrangling)
path <- system.file("extdata", package="dslabs")
list.files(path)

# generate a full path to a file
filename <- "murders.csv"
fullpath <- file.path(path, filename)
fullpath

# copy file from dslabs package to your working directory
file.copy(fullpath, getwd())

# check if the file exists
file.exists(filename)

# inspect the first 3 lines
read_lines("murders.csv", n_max = 3)

# read file in CSV format
dat <- read_csv(filename)


head(dat)

getwd()
filename <- "murders.csv"
path <- system.file("extdata", package = "dslabs")
path
file.copy(file.path(path, "murders.csv"), getwd())
setwd("data")
file.copy(file.path(path, filename), getwd()) 

file.copy(file.path(path, "murders.csv"), file.path(getwd(), "data"))

url <- "http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"
dat <- read_csv(url, col_names = FALSE)

nrow(dat)

url <- "ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_annmean_mlo.txt"
dat <- read_table(url, skip = 56)


setwd("data")
d <- read_csv("times.csv")
getwd()

tidy_data <- d %>%
  gather(year, time, `2015`:`2017`)

tidy_data

dat_wide <- read_csv("sick.csv")

dat_tidy <- dat_wide %>%
  gather(key = disease, value = count, HepatitisA:Rubella)

dat_tidy

setwd("data")
tidy_data <- read_csv("tidyt.csv")
tidy_data

tidy_data %>% spread(year, time)


d <- read_csv("times2.csv")
d

tidy_data <- d %>%
  gather(key = 'key', value = 'value', -age_group) %>%
  separate(col = key, into = c('year', 'variable_name'), sep = '.') %>% 
  spread(key = variable_name, value = value)
tidy_data

tidy_data <- d %>%
  gather(key = 'key', value = 'value', -age_group) %>%
  separate(col = key, into = c('year', 'variable_name'), sep = '_') %>% 
  spread(key = variable_name, value = value)

tidy_data <- d %>%
  gather(key = 'key', value = 'value') %>%
  separate(col = key, into = c('year', 'variable_name'), sep = '_') %>% 
  spread(key = variable_name, value = value)
tidy_data

tidy_data <- d %>%
  gather(key = 'key', value = 'value', -age_group) %>%
  separate(col = key, into = 'year', sep = '_') %>% 
  spread(key = year, value = value)
tidy_data

path <- system.file("extdata", package = "dslabs")
path

# read file
raw_dat <- read_csv("life-expectancy-and-fertility-two-countries-example.csv")
select(raw_dat, 1:5)

# gather all columns except country
dat <- raw_dat %>% gather(key, value, -country)
head(dat)
dat$key[1:5]

# separate on underscores
dat %>% separate(key, c("year", "variable_name"), "_")

# split on all underscores, pad empty cells with NA
dat %>% separate(key, c("year", "first_variable_name", "second_variable_name"), 
                 fill = "right")

# split on first underscore but keep life_expectancy merged
dat %>% separate(key, c("year", "variable_name"), sep = "_", extra = "merge")

# separate then spread
dat %>% separate(key, c("year", "variable_name"), sep = "_", extra = "merge") %>%
  spread(variable_name, value) 


stats <- read_csv("stats.csv")
stats

tidy_data <- stats %>%
  separate(col = key, into = c("player", "variable_name"), sep = "_", extra = "merge") %>% 
  spread(key = variable_name, value = value)
tidy_data

tidy_data <- stats %>%
  separate(col = key, into = c("player", "variable_name1", "variable_name2"), sep = "_", fill = "right") %>% 
  unite(col = variable_name, variable_name1, variable_name2, sep = "_") %>% 
  spread(key = variable_name, value = value)
tidy_data


tidy_data <- stats %>%
  separate(col = key, into = c("player", "variable_name"), sep = "_") %>% 
  spread(key = variable_name, value = value)
tidy_data



