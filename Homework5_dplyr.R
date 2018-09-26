# Homework #5 from Computation Biology. Learning to manipulate data with dplyr, and especially how to do it with piping. Working with dataframes and tibbles to do things like filter, arrange, mutate, etc. 
#
# 26 September 2018
# LKB
# ---------------------------------------------


## Preliminaries 

library(dplyr)

## Create or read in data and take a peek at it
data(iris)
class(iris)
iris
glimpse(iris)

## Code

iris1 <- filter(iris, Species == "virginica" | Species == "versicolor", Sepal.Length > 6, Sepal.Width > 2.5)
glimpse(iris1)

iris2 <- select(iris1, (c(Species, Sepal.Length, Sepal.Width)))
glimpse(iris2)
head(iris2)


iris3 <- arrange(iris2, desc(Sepal.Length))
head(iris3)


iris4 <- mutate(iris3, Sepal.Area = Sepal.Length * Sepal.Width)
glimpse(iris4)


iris5 <- summarize(iris4, mean.Sepal.Length = mean(Sepal.Length), mean.Sepal.Width = mean(Sepal.Width), TotalNumber = n())
iris5
class(iris5)

iris6 <- summarize(group_by(iris4, Species), mean.Sepal.Length = mean(Sepal.Length), mean.Sepal.Width = mean(Sepal.Width), TotalNumber = n())
iris6
str(as.data.frame(iris6))



############# PIPPING

iris7 <- iris %>%
  group_by(Species) %>%
  filter(Species == 'virginica' | Species == 'versicolor', Sepal.Length > 6, Sepal.Width > 2.5) %>%
  select(Species, Sepal.Length, Sepal.Width) %>%
  arrange(desc(Sepal.Length)) %>%
  mutate(Sepal.Area = Sepal.Length * Sepal.Width) %>%
  summarize(mean.Sepal.Length = mean(Sepal.Length), mean.Sepal.Width = mean(Sepal.Width), TotalNumber = n())
