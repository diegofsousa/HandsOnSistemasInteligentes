
dado <- read.csv(file = "OnlineNewsPopularity.csv", sep=",")

amostra1 <- dado[dado$weekday_is_sunday ==1,]
amos2 <- dado[dado$weekday_is_monday ==1,]
amos3 <- dado[dado$weekday_is_tuesday ==1,]
amos4 <- dado[dado$weekday_is_wednesday ==1,]
amos5 <- dado[dado$weekday_is_thursday ==1,]
amos6 <- dado[dado$weekday_is_friday ==1,]
amos7 <- dado[dado$weekday_is_saturday ==1,]


domingo <- mean(amostra1$global_subjectivity)
segunda <- mean(amos2$global_subjectivity)
terca <- mean(amos3$global_subjectivity)
quarta <- mean(amos4$global_subjectivity)
quinta <- mean(amos5$global_subjectivity)
sexta <- mean(amos6$global_subjectivity)
sabado <- mean(amos7$global_subjectivity)


medias <- c(domingo,segunda,terca,quarta,quinta,sexta,sabado)
dias <- c("Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado")




plot(medias,main = "Compartilhamento de Noticias pela Internet",xlab = "Dias da semana",ylab = "Quantidade de compartilhamento",type = "b",col = "blue", lty = 5, xaxt="n")
axis(1, at = seq_along(dias), labels = dias)

legend("top","topleft",legend = c("Media" ), 
       col = c("blue"),lty = 5,cex = 0.6, title= "Media de subjetividade")

