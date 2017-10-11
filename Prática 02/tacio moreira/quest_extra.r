setwd("C:/Users/Tacinho Moreira/HandsOnSistemasInteligentes/Prática 02/tacio moreira")
dataurl <- read.csv("OnlineNewsPopularity.csv", header = TRUE, sep = ",")

segunda <- subset(dataurl, dataurl$weekday_is_monday == 1)
seg <- mean(x=segunda$num_imgs)
print(seg)

terca <- subset(dataurl, dataurl$weekday_is_tuesday == 1)
ter <- mean(x=terca$num_imgs)
print(ter)

quarta <- subset(dataurl, dataurl$weekday_is_wednesday == 1)
quar <- mean(x=quarta$num_imgs)
print(quar)

quinta <- subset(dataurl, dataurl$weekday_is_thursday == 1)
quin <- mean(x=quinta$num_imgs)
print(quin)

sexta <- subset(dataurl, dataurl$weekday_is_friday == 1)
sex <- mean(x=sexta$num_imgs)
print(sex)

sabado <- subset(dataurl, dataurl$weekday_is_saturday == 1)
sab <- mean(x=sabado$num_imgs)
print(sab)

domingo <- subset(dataurl, dataurl$weekday_is_sunday == 1)
dom <- mean(x=domingo$num_imgs)
print(dom)

medias_img <- c(seg, ter, quar, quin, sex, sab, dom)

plot(medias_img, main = "Media de Imagens \n Por Dia Da Semana \n Em Artigo", 
     ylim = c(4,6.5), ylab = "Quantidade De \n Imagens", xlab = "Dias Da Semana", 
     type = "b", pch = 1, col= 'blue',xaxt = 'n', lwd = 2, lty = 2)
legend(x=1, y=6.5, legend = c("Média\n De Imagens"), col = ("blue"),
       lty=2, cex=0.7, pch = 1,  title = "Legenda")

dia <- c("Domingo", "Segunda", 
         "Terça", "Quarta", 
         "Quinta", "Sexta", 
         "Sábado")
num <- c(1, 2, 3, 4, 5, 6, 7)

axis(1, at = num, labels = dia)

