library(caret)
library(mlbench)
data(Sonar)
set.seed(107)
inTrain<-createDataPartition(y=Sonar$Class,
                             p=.75,
                             list=FALSE)
str(Sonar)
summary(inTrain)
dt<-as.table(inTrain)
dt
View(dt)
levels(Sonar$Class       )








#
wbcd <- read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)
summary(wbcd)
str(wbcd)


#learn dplyr
library(dplyr)
years <- tribble(
  ~Location, ~Year, ~Month, ~Day,
  "Sydney", 2000, 9, 15,
  "Athens", 2004, 8, 13,
  "Beijing", 2008, 8, 8,
  "London", 2012, 7, 27,
  "Rio de Janeiro", 2016, 8, 5
)
View(years)
str(years)




library(caret)
library(mlbench)
data(s)


