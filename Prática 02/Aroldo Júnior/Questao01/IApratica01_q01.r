onpdataset <- read.csv(file = "OnlineNewsPopularity.csv", sep=",")

dado1 <- onpdataset[onpdataset$weekday_is_sunday == 1, ]
dado2 <- onpdataset[onpdataset$weekday_is_monday == 1, ]
dado3 <- onpdataset[onpdataset$weekday_is_tuesday == 1, ]
dado4 <- onpdataset[onpdataset$weekday_is_wednesday == 1, ]
dado5 <- onpdataset[onpdataset$weekday_is_thursday == 1, ]
dado6 <- onpdataset[onpdataset$weekday_is_friday == 1, ]
dado7 <- onpdataset[onpdataset$weekday_is_saturday == 1, ]

dom <- mean(dado1$shares)
seg <- mean(dado2$shares)
ter <- mean(dado3$shares)
qua <- mean(dado4$shares)
qui <- mean(dado5$shares)
sex <- mean(dado6$shares)
sab <- mean(dado7$shares)

print(dom)
print(seg)
print(ter)
print(qua)
print(qui)
print(sex)
print(sab)

medias <- c(dom, seg, ter, qua, qui, sex, sab)
dias <- c("Domingo","Segunda-Feira","Terca-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sabado")

plot(medias,main = "Compartilhamento de Noticias pela Internet",xlab = "Dias da semana - Visualização de dados em R",ylab = "Quantidade de compartilhamento",type = "b",col = "blue", lty = 5, xaxt="n")
axis(1, at = seq_along(dias), labels = dias)

legend("top","topleft",legend = c("Media de compartilhamento" ), 
       col = c("blue"),lty = 6,cex = 0.6, title= "Legenda")