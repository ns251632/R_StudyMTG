#20210520Rlrn

#data
library(tidyverse)
df <- read_csv("R_book_data.csv",  
               stringsAsFactors = F,
               na.strings = (c("NA", "NaN", "")),    #missing="NA", "NaN", ""
               locale = locale(encoding = 'UTF-8'))  #encoding=UTF-8
glimpse(df)  #check

library(tableone)  #call tableone package
?CreateTableOne  #help

#Table1
tb1_1 <- CreateTableOne(vars = c("Age","Sex","Height","Weight","Severity","DM"), 
                        strata = "New_Treatment", 
                        factorVars = c("Sex","DM"), 
                        addOverall = TRUE,  #全件表示を表に追加
                        data = df)

print(tb1_1, showAllLevels = TRUE)  #showAllLevels = TRUE で全水準を表示する

#Excercise
tb1_fisher <- 
  CreateTableOne(
    vars = "Sex",
    strata = "New_Treatment",
    factorVars = "Sex",
    df
  )
print(tb1_fisher, showAllLevels = TRUE, exact = "Sex")

tb1_chisq <- 
  CreateTableOne(
    vars = "Sex",
    strata = "New_Treatment",
    factorVars = "Sex",
    df
  )
print(tb1_chisq, showAllLevels = TRUE)
