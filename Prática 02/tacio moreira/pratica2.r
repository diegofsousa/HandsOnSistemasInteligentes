setwd("C:/Users/Tacinho Moreira/HandsOnSistemasInteligentes/Prática 02/tacio moreira")
dataurl <- read.csv("OnlineNewsPopularity.csv", header = TRUE, sep = ",")

segunda <- subset(dataurl, dataurl$weekday_is_monday == 1)
seg <- mean(x=segunda$shares)
print(seg)

terca <- subset(dataurl, dataurl$weekday_is_tuesday == 1)
ter <- mean(x=terca$shares)
print(ter)

quarta <- subset(dataurl, dataurl$weekday_is_wednesday == 1)
quar <- mean(x=quarta$shares)
print(quar)

quinta <- subset(dataurl, dataurl$weekday_is_thursday == 1)
quin <- mean(x=quinta$shares)
print(quin)

sexta <- subset(dataurl, dataurl$weekday_is_friday == 1)
sex <- mean(x=sexta$shares)
print(sex)

sabado <- subset(dataurl, dataurl$weekday_is_saturday == 1)
sab <- mean(x=sabado$shares)
print(sab)

domingo <- subset(dataurl, dataurl$weekday_is_sunday == 1)
dom <- mean(x=domingo$shares)
print(dom)

medias <- c(seg, ter, quar, quin, sex, sab, dom)

plot(medias, main = "Compartilhamento Por Dia Da Semana", 
     ylim = c(3000,4500), ylab = "Quantidade De Compartilhamento", xlab = "Dias Da Semana", 
     type = "b", lty = 2, pch = 1, col= 'blue',xaxt = 'n')
legend(x=4, y=4500, legend = c("Média de compartilhamento"), col = ("blue"),
       lty=1, cex=0.6, title = "Legenda")

#axis(1, c("Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"))

dia <- c("Domingo", "Segunda", 
         "Terça", "Quarta", 
         "Quinta", "Sexta", 
         "Sábado")
num <- c(1, 2, 3, 4, 5, 6, 7)

axis(1, at = num, labels = dia)
