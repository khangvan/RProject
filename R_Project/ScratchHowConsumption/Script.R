#
library(xlsx)
dt <- read_excel("YMM13.xlsx", "Sheet1")
my_data <- read_excel(file.choose())


#dataset
cons <- select(dt, Material,Product.hierarchy, starts_with("cons")) # collection


#1 var as key field
constidy <-melt(cons, "Material") # 1 var ok
#2 var as keyfield
constidy <-melt(cons, "Material","Product.hierarchy") #wrong
constidy <-melt(cons,id.vars = c("Material","Product.hierarchy")) #ok with id.vars=
names(constidy)<-c("Mat","Prd","Consp","Value"); # !collection

#how to export 


library(RODBC)
dbhandle <- odbcDriverConnect('driver={SQL Server};server=vnmacsdb;database=ACS EE;trusted_connection=true')
res <- sqlQuery(dbhandle, 'select  * from temptestlogRS')
glimpse(res)
tmp<-as_tibble(res)

library(RODBC)
library(tidyverse)
test=function(x){
 
  dbhandle <- odbcDriverConnect('driver={SQL Server};server=vnmacsdb;database=ACS EE;trusted_connection=true')
  res <- sqlQuery(dbhandle, x)
  return (res);
}
data <-as_tibble (test('select  * from temptestlogRS'))
head(data)

dfmodel<-select(res,-station,-event_date,-lastdatetime)
library(dplyr)
library(rshape2)
dfrs<-dfmodel %>%melt(var.id=c("sap_model"))%>%head()
glimpse(dfrs)
summarise(dfrs)

library(RODBC)
library(dplyr)
dbhandle <- odbcDriverConnect('driver={SQL Server};server=vnmacsdb;database=ACS EE;trusted_connection=true')
tl <- sqlQuery(dbhandle, 'select  *, datepart(mm,event_date) Fdata from temptestlogRS')
glimpse(tl)
unique(tl$sap_model)
#detect oulior from yield, fct
library(ggplot2)
ggplot(data=tf)+



df1 <- select(tl,-station, -event_date,-lastdatetime, -Fdata)
glimpse(df1)
df2<-melt(df1,"sap_model")




#install.packages(c("ggplot2","RColorBrewer","scales"))
library(ggplot2); library(scales); library(grid); library(RColorBrewer)
ggplot(tl, aes(x=fcnt, y=Total)) +
  geom_point()


ggplot(tl, aes(x=Total, y=fcnt)) +
  geom_point(alpha=0.05) 
