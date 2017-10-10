setwd("/home/andre/André Lucas")
dados <- read.csv("OnlineNewsPopularity.csv", header = TRUE, sep= ",")

seg <- subset(dados, dados$weekday_is_monday == 1)
sharesSeg <- mean(x = seg$shares)
print(sharesSeg)

tue <- subset(dados, dados$weekday_is_tuesday == 1)
sharesTuesday <- mean(x = tue$shares)
print(sharesTuesday)

wed <- subset(dados, dados$weekday_is_wednesday == 1)
sharesWed <- mean(x = wed$shares)
print(sharesWed)

thur <- subset(dados, dados$weekday_is_thursday == 1)
sharesThur <- mean(x = thur$shares)
print(sharesThur)

frid <- subset(dados, dados$weekday_is_friday == 1)
sharesFrid <- mean(x = frid$shares)
print(sharesFrid)

sat <- subset(dados, dados$weekday_is_saturday == 1)
sharesSat <- mean(x = sat$shares)
print(sharesSat)

sund <- subset(dados, dados$weekday_is_sunday == 1)
sharesSund <- mean(x = sund$shares)
print(sharesSund)

medias <- c(sharesSund, sharesSeg, sharesTuesday, sharesWed, sharesThur, sharesFrid, sharesSat)
plot(medias, type="o", main = "Compartilhamento por Dia da Semana", 
     xlab="Dias da Semana", 
     ylab="Quantidade de Compartilhamentos",
     ylim = c(3000,4500),
     pch = 1, 
     sub = "Visualização de Dados com R",
     col="blue",
     xaxt = 'n',
     lty = 5)
axis(1, at=1:7, labels = c("Domingo", "Segunda-Feira", "Terça-Feira", 
                           "Quarta-Feira", "Quinta-Feira", 
                           "Sexta-Feira", "Sábado"))
legend(x=4.9, y=4400, legend = c("Média de Compartilhamento"),
       col = c("blue"), lty=2, cex=0.6, title = "Legenda")