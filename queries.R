# script del reto 7

install.packages("DBI")
install.packages("RMySQL")

library(DBI)
library(RMySQL)

MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

library(dplyr)

dbListFields(MyDataBase, 'CountryLanguage')

Lang <- dbGetQuery(MyDataBase, "select CountryCode, Percentage, IsOfficial from CountryLanguage where Language = 'Spanish'")

head(Lang)

install.packages("ggplot2")

library(ggplot2)

ggplot(Lang, aes(x = CountryCode, y = Percentage, fill = IsOfficial)) +
  geom_bin2d() + coord_flip()