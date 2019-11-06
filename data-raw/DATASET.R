## code to prepare `DATASET` dataset goes here
set.seed(11)
library(dplyr)
student_data<-data.frame(Instructor=sample(c("Professor 1","Professor 2","Professor 3"
                                             ,"Professor 4","Professor 5","Professor 6"),
                                           9000,replace=TRUE),
                         Subject=rep(c("English"), each=9000, replace = TRUE),
                         Crse_Num=rep(c("101","110", "120","300"), each=2250, replace = TRUE),
                         Official_Grade=sample(c("A","B","C","D","F","W"),9000,replace=TRUE,
                                               prob=c(.20,.26,.18,.16,.12,.08)),
                         Gender=sample(c('M', 'F','U','X'), 9000, replace=TRUE, prob=c(.45,.51,.3,.1)),
                         Semester=sample(c('Fall 2016', 'Fall 2017','Fall 2018','Fall 2019'), 9000, replace=TRUE),
                         Race=sample(c("African American","Asian","Hispanic/Latino","White"),9000,replace=TRUE))
student_data$Course<-paste(student_data$Subject,student_data$Crse_Num)
student_data<-student_data%>%dplyr::mutate(success=ifelse(Official_Grade=="A"|Official_Grade=="B"|Official_Grade=="C",1,0))
student_data<-student_data%>%dplyr::mutate(mastery=ifelse(Official_Grade=="A"|Official_Grade=="B",1,0))
student_data<-student_data%>%dplyr::mutate(drop=ifelse(Official_Grade=="D"|Official_Grade=="F"|Official_Grade=="W",1,0))
usethis::use_data(student_data)
