setwd("C:/Users/davil/Desktop/6 periodo/SistemasInteligentes/pratica2")
dataset <- read.csv("OnlineNewsPopularity.csv")
monday <- subset(dataset,weekday_is_monday == 1)
tuesday <- subset(dataset,weekday_is_tuesday  == 1)
wednesday <-  subset(dataset,weekday_is_wednesday == 1)
thursday <-  subset(dataset,weekday_is_thursday == 1)
friday <-  subset(dataset,weekday_is_friday == 1)
saturday <-  subset(dataset,weekday_is_saturday == 1)
sunday <-  subset(dataset,weekday_is_sunday == 1)
mediaMonday <- mean(monday[["shares"]]) 
mediaTuesday  <- mean(tuesday[["shares"]]) 
mediaWednesday <- mean(wednesday[["shares"]]) 
mediaThursday <- mean(thursday[["shares"]]) 
mediaFriday  <- mean(friday [["shares"]]) 
mediaSaturday <- mean(saturday[["shares"]]) 
mediaSunday <- mean(sunday[["shares"]]) 
medias <- c(mediaSunday,mediaMonday,mediaTuesday, mediaWednesday, mediaThursday,mediaFriday,mediaSaturday )
sdMonday <- sd(monday[["shares"]]) 
sdTuesday  <- sd(tuesday[["shares"]]) 
sdWednesday <- sd(wednesday[["shares"]]) 
sdThursday <- sd(thursday[["shares"]]) 
sdFriday  <- sd(friday [["shares"]]) 
sdSaturday <- sd(saturday[["shares"]]) 
sdSunday <- sd(sunday[["shares"]]) 
desvios <- c(sdMonday,sdTuesday, sdWednesday,sdThursday,sdFriday,sdSaturday,sdSunday)
shares <- c(monday[["shares"]],tuesday[["shares"]],wednesday[["shares"]],thursday[["shares"]],friday [["shares"]],saturday[["shares"]],sunday[["shares"]])

plot(medias,type='o',col='blue',axes="False",lty=2, main = "Compartilhamento de Dias da Semana",ylab="Quantidade de Compartilahmentos",xlab = "Dias da Semana",sub="Visualização de Dados com R")
axis(1, at=1:7, lab=c("Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado","Domingo"))
axis(2, las=1, at=shares)
box()
legend("topleft",cex =0.56, title="Legenda","Média de Compartilhamento", lty=2, col= "blue")








