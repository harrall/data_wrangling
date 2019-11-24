library(tidyverse)
library(rvest)

h <- read_html("http://www.foodnetwork.com/recipes/alton-brown/guacamole-recipe-1940609")
recipe <- h %>% html_node(".o-AssetTitle__a-HeadlineText") %>% html_text()
prep_time <- h %>% html_node(".m-RecipeInfo__a-Description--Total") %>% html_text()
ingredients <- h %>% html_nodes(".o-Ingredients__a-Ingredient") %>% html_text()

guacamole <- list(recipe, prep_time, ingredients)
guacamole

get_recipe <- function(url){
  h <- read_html(url)
  recipe <- h %>% html_node(".o-AssetTitle__a-HeadlineText") %>% html_text()
  prep_time <- h %>% html_node(".m-RecipeInfo__a-Description--Total") %>% html_text()
  ingredients <- h %>% html_nodes(".o-Ingredients__a-Ingredient") %>% html_text()
  return(list(recipe = recipe, prep_time = prep_time, ingredients = ingredients))
} 


get_recipe("http://www.foodnetwork.com/recipes/food-network-kitchen/pancakes-recipe-1913844")

#Assessment Q1

library(rvest)
url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
h <- read_html(url)
nodes <- html_nodes(h, "table")
html_text(nodes[[8]])
html_table(nodes[[8]])


tb1 <- html_table(nodes[[1]])
tb1

tb2 <- html_table(nodes[[2]])
tb2

tb3 <- html_table(nodes[[3]])
tb3

tb4 <- html_table(nodes[[4]])
tb4

tb19 <- html_table(nodes[[19]])
tb20 <- html_table(nodes[[20]])
tb21 <- html_table(nodes[[21]])

tab_1 <- html_table(nodes[[10]])
tab_2 <- html_table(nodes[[19]])

tab_1 <- tab_1[-c(1)]
head(tab_1)

# remove the first row of each dataset
tab_1 <- subset(tab_1, X2!="Team" & X3!="Payroll" & X4!="Average")
tab_2 <- subset(tab_2, X1!="Team" & X2!="Payroll" & X3!="Average")

# set column names
tab_1 <- tab_1 %>% setNames(c("Team", "Payroll", "Average"))
tab_2 <- tab_2 %>% setNames(c("Team", "Payroll", "Average"))

both <- full_join(tab_1, tab_2, by="Team") 
nrow(both)

#q2
library(rvest)
library(tidyverse)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
h <- read_html(url)
tab <- html_nodes(h, "table")

tb1 <- html_table(tab[[1]],fill=TRUE)
tb1
tb2 <- html_table(tab[[2]],fill=TRUE)
tb2
tb3 <- html_table(tab[[3]],fill=TRUE)
tb3
tb4 <- html_table(tab[[4]],fill=TRUE)
tb4
tb5 <- html_table(tab[[5]],fill=TRUE)
tb5
tb6 <- html_table(tab[[6]],fill=TRUE)
tb6
tb7 <- html_table(tab[[7]],fill=TRUE)
tb7
tb8 <- html_table(tab[[8]],fill=TRUE)
tb8
tb9 <- html_table(tab[[9]],fill=TRUE)
tb9
tb10 <- html_table(tab[[10]],fill=TRUE)
tb10







