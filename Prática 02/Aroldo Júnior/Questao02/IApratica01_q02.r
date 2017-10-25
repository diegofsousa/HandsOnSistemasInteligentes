onpdataset2 <- read.csv(file = "OnlineNewsPopularity.csv", sep=",")

dado1 <- onpdataset2[onpdataset2$weekday_is_sunday ==1,]
dado2 <- onpdataset2[onpdataset2$weekday_is_monday ==1,]
dado3 <- onpdataset2[onpdataset2$weekday_is_tuesday ==1,]
dado4 <- onpdataset2[onpdataset2$weekday_is_wednesday ==1,]
dado5 <- onpdataset2[onpdataset2$weekday_is_thursday ==1,]
dado6 <- onpdataset2[onpdataset2$weekday_is_friday ==1,]
dado7 <- onpdataset2[onpdataset2$weekday_is_saturday ==1,]

dom <- mean(dado1$rate_positive_words)
seg <- mean(dado2$rate_positive_words)
ter <- mean(dado3$rate_positive_words)
qua <- mean(dado4$rate_positive_words)
qui <- mean(dado5$rate_positive_words)
sex <- mean(dado6$rate_positive_words)
sab <- mean(dado7$rate_positive_words)

dom1 <- mean(dado1$rate_negative_words)
seg1 <- mean(dado2$rate_negative_words)
ter1 <- mean(dado3$rate_negative_words)
qua1 <- mean(dado4$rate_negative_words)
qui1 <- mean(dado5$rate_negative_words)
sex1 <- mean(dado6$rate_negative_words)
sab1 <- mean(dado7$rate_negative_words)

print(dom)
print(seg)
print(ter)
print(qua)
print(qui)
print(sex)
print(sab)
print("\n \n")
print(dom1)
print(seg1)
print(ter1)
print(qua1)
print(qui1)
print(sex1)
print(sab1)

medias_positive <- c(dom, seg, ter, qua, qui, sex, sab)
medias_negative <- c(dom1, seg1, ter1, qua1, qui1, sex1, sab1)
dias <- c("Domingo", "Segunda-Feira", "Terca-Feira", "Quarta-Feira", "Quinta-Feira", "Sexta-Feira", "Sabado")

plot(medias_positive,ylim= c(0.1, 0.9), main = "Compartilhamento de Noticias pela Internet",xlab = "Dias da semana",ylab = "Quantidade de compartilhamento",type = "b",col = "blue", lty = 5, xaxt="n")

lines(medias_negative,type = "b", col = "red", lty = 5)

axis(1, at = seq_along(dias), labels = dias)

legend("topright",legend = c("Medias Positivas","Medias Negativas" ), 
       col = c("blue","red"),lty = 5,cex = 0.6, title= "Legenda")