setwd("/home/andre/André Lucas")
dados <- read.csv("OnlineNewsPopularity.csv", header = TRUE, sep= ",")

seg <- subset(dados, dados$weekday_is_monday == 1)
pstWordSeg <- mean(x = seg$global_rate_positive_words)
ngtWordSeg <- mean(x = seg$global_rate_negative_words)
tokPstSeg <- mean(x = seg$rate_positive_words)
tokNgtSeg <- mean(x = seg$rate_negative_words)

tue <- subset(dados, dados$weekday_is_tuesday == 1)
pstWordTue <- mean(x = tue$global_rate_positive_words)
ngtWordTue <- mean(x = tue$global_rate_negative_words)
tokPstTue <- mean(x = tue$rate_positive_words)
tokNgtTue <- mean(x = tue$rate_negative_words)

wed <- subset(dados, dados$weekday_is_wednesday == 1)
pstWordWed <- mean(x = wed$global_rate_positive_words)
ngtWordWed <- mean(x = wed$global_rate_negative_words)
tokPstWed <- mean(x = wed$rate_positive_words)
tokNgtWed <- mean(x = wed$rate_negative_words)

thur <- subset(dados, dados$weekday_is_thursday == 1)
pstWordThur <- mean(x = thur$global_rate_positive_words)
ngtWordThur <- mean(x = thur$global_rate_negative_words)
tokPstThur <- mean(x = thur$rate_positive_words)
tokNgtThur <- mean(x = thur$rate_negative_words)

frid <- subset(dados, dados$weekday_is_friday == 1)
pstWordFrid <- mean(x = frid$global_rate_positive_words)
ngtWordFrid <- mean(x = frid$global_rate_negative_words)
tokPstFrid <- mean(x = frid$rate_positive_words)
tokNgtFrid <- mean(x = frid$rate_negative_words)

sat <- subset(dados, dados$weekday_is_saturday == 1)
pstWordSat <- mean(x = sat$global_rate_positive_words)
ngtWordSat <- mean(x = sat$global_rate_negative_words)
tokPstSat <- mean(x = sat$rate_positive_words)
tokNgtSat <- mean(x = sat$rate_negative_words)

sund <- subset(dados, dados$weekday_is_sunday == 1)
pstWordSund <- mean(x = sund$global_rate_positive_words)
ngtWordSund <- mean(x = sund$global_rate_negative_words)
tokPstSund <- mean(x = sund$rate_positive_words)
tokNgtSund <- mean(x = sund$rate_negative_words)

taxa_positiva <- c(pstWordSund, pstWordSeg, pstWordTue, pstWordWed, pstWordThur, pstWordFrid, pstWordSat)
taxa_negativa <- c(ngtWordSund, ngtWordSeg, ngtWordTue, ngtWordWed, ngtWordThur, ngtWordFrid, ngtWordSat)
tokPst <- c(tokPstSund, tokPstSeg, tokPstTue, tokPstWed, tokPstThur, tokPstFrid, tokPstSat)
tokNgt <- c(tokNgtSund, tokNgtSeg, tokNgtTue, tokNgtWed, tokNgtThur, tokNgtFrid, tokNgtSat)

lbl <- c("Domingo", "Segunda-Feira", "Terça-Feira", "Quarta-Feira", "Quinta-Feira", 
         "Sexta-Feira", "Sábado")
lb <- c(1, 2, 3, 4, 5, 6, 7)

par(mfrow=c(1,2))
par(mar=c(6,6,6,6))

plot(taxa_positiva~lb, type="o", main = "Palavras Positivas e Negativas por Dia da Semana", 
     xlab="Dias da Semana", 
     ylab="Taxa de Palavras",
     ylim = c(0.009,0.05),
     pch=1, 
     sub = "Visualização de Dados com R",
     col="blue",
     xaxt = 'n',
     lty = 5)
lines(taxa_negativa~lb, type = "o", xaxt = 'n', col = "red", pch = 1, lty = 5)
axis(1, at = lb, labels = lbl)
legend(x=2, y=0.03, legend = c("Média de Palavras Positivas", "Média de Palavras Negativas"),
       col = c("blue", "red"), lty=2, cex=0.6, title = "Legenda")

plot(tokPst~lb, type="o", main = "Token de Palavras Positivas e Negativas por Dia da Semana", 
     xlab="Dias da Semana", 
     ylab="Taxa de Token de Palavras",
     ylim = c(0.2,0.7),
     pch=1, 
     sub = "Visualização de Dados com R",
     col="blue",
     xaxt = 'n',
     lty = 5)
lines(tokNgt~lb, type = "o", xaxt = 'n', col = "red", lty = 5, pch = 1)
axis(1, at = lb, labels = lbl)
legend(x=2, y=0.5, legend = c("Token de Palavras Positivas", "Token de Palavras Negativas"),
       col = c("blue", "red"), lty=2, cex=0.6, title = "Legenda")
