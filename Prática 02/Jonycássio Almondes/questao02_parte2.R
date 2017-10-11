
pratica <- read.csv("OnlineNewsPopularity.csv", header = TRUE, sep = ",")


domingo <- pratica [pratica $weekday_is_sunday == 1,]
segunda <- pratica [pratica $weekday_is_monday == 1,]
terça <- pratica [pratica $weekday_is_tuesday == 1,]
quarta <- pratica [pratica $weekday_is_wednesday == 1,]
quinta <- pratica [pratica $weekday_is_thursday == 1,]
sexta <- pratica [pratica $weekday_is_friday == 1,]
sabado <- pratica [pratica $weekday_is_saturday == 1,]


# ====================Média de rate_positive_words==================================


mediaP1 <- mean(domingo$rate_positive_words)
print(mediaP1)

mediaP2 <- mean(segunda$rate_positive_words)
print(mediaP2)

mediaP3 <- mean(terça$rate_positive_words)
print(mediaP3)

mediaP4 <- mean(quarta$rate_positive_words)
print(mediaP4)

mediaP5 <- mean(quinta$rate_positive_words)
print(mediaP5)

mediaP6 <- mean(sexta$rate_positive_words)
print(mediaP6)

mediaP7 <- mean(sabado$rate_positive_words)
print(mediaP7)

# ====================Média de rate_negative_words==================================

mediaN1 <- mean(domingo$rate_negative_words)
print(mediaN1)

mediaN2 <- mean(segunda$rate_negative_words)
print(mediaN2)

mediaN3 <- mean(terça$rate_negative_words)
print(mediaN3)

mediaN4 <- mean(quarta$rate_negative_words)
print(mediaN4)

mediaN5 <- mean(quinta$rate_negative_words)
print(mediaN5)

mediaN6 <- mean(sexta$rate_negative_words)
print(mediaN6)

mediaN7 <- mean(sabado$rate_negative_words)
print(mediaN7)



medias_positive <- c(mediaP1, mediaP2, mediaP3, mediaP4, mediaP5, mediaP6, mediaP7)
medias_negative <- c(mediaN1, mediaN2, mediaN3, mediaN4, mediaN5, mediaN6, mediaN7)


dias <- c("Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado")


plot(medias_positive, 
     main = "Taxas de palavras positivas e negativas entre tokens não neutros",
     xlab = "Dias da semana",
     ylab = "Taxas de palavras positivas e negativas",
     sub="Visualização de Dados com R",
     ylim= c(0.1, 0.7),
     type = "b",col = "blue", lty = 5, xaxt="n")



lines(medias_negative,type = "b",col = "red", lty = 5)




axis(1, at = seq_along(dias), labels = dias)





legend("center",legend = c("Taxas Positivas","Taxas Negativas" ), 
       col = c("blue","red"),lty = 5,cex = 0.6, title= "Legenda:")










