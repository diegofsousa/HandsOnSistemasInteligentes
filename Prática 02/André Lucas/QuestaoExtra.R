#Média do Número de Palavras do Título do Artigo Por Dia da Semana
setwd("/home/andre/André Lucas")
dados <- read.csv("OnlineNewsPopularity.csv", header = TRUE, sep= ",")

artPbSund <- sum(x = dados$weekday_is_sunday)
print(artPbSund)

artPbSeg <- sum(x = dados$weekday_is_monday)
print(artPbSeg)

artPbTuesday <- sum(x = dados$weekday_is_tuesday)
print(artPbTuesday)

artPbWed <- sum(x = dados$weekday_is_wednesday)
print(artPbWed)

artPbThur <- sum(x = dados$weekday_is_thursday)
print(artPbThur)

artPbFrid <- sum(x = dados$weekday_is_friday)
print(artPbFrid)

artPbSat <- sum(x = dados$weekday_is_saturday)
print(artPbSat)

qtdArtigoPb <- c(artPbSund, artPbSeg, artPbTuesday, artPbWed, artPbThur, artPbFrid, artPbSat)
plot(qtdArtigoPb, ylim = c(2500, 8000), type = "o", 
     xlab = "Dias da Semana", sub = "Visualização de Dados com R",
     ylab = "Quantidade de Publicações", main = "Publicações por Dia da Semana",
     xaxt = "n", col = "red", lty = 5)
axis(1, at=1:7, labels = c("Domingo", "Segunda-Feira", "Terça-Feira", 
                           "Quarta-Feira", "Quinta-Feira", 
                           "Sexta-Feira", "Sábado"))
legend(x=6, y=7500, legend = c("Publicações de Artigo"),
       col = c("red"), lty=2, cex=0.6, title = "Legenda")