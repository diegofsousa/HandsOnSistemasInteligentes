
pratica <- read.csv("OnlineNewsPopularity.csv", header = TRUE, sep = ",")

domingo <- pratica [pratica $weekday_is_sunday == 1,]
segunda <- pratica [pratica $weekday_is_monday == 1,]
terça <- pratica [pratica $weekday_is_tuesday == 1,]
quarta <- pratica [pratica $weekday_is_wednesday == 1,]
quinta <- pratica [pratica $weekday_is_thursday == 1,]
sexta <- pratica [pratica $weekday_is_friday == 1,]
sabado <- pratica [pratica $weekday_is_saturday == 1,]



media1 <- mean(domingo$num_keywords)
print(media1)
media2 <- mean(segunda$num_keywords)
print(media2)
media3 <- mean(terça$num_keywords)
print(media3)
media4 <- mean(quarta$num_keywords)
print(media4)
media5 <- mean(quinta$num_keywords)
print(media5)
media6 <- mean(sexta$num_keywords)
print(media6)
media7 <- mean(sabado$num_keywords)
print(media7)



medias <- c(media1, media2, media3, media4, media5, media6, media7)

dias <- c("Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sabado")




plot(medias,main = "Media de palavras-chave dos artigos em cada dia da semana",
     xlab = "Dias da semana",
     ylab = "Quantidade de palavras",
     sub="Visualização de Dados com R",
     type = "b",col = "blue", lty = 5, xaxt="n")

axis(1, at = seq_along(dias), labels = dias)

legend("top","topleft",legend = c("Media de Palavras-chave" ), 
       col = c("blue"),lty = 5,cex = 0.6, title= "Legenda:")







