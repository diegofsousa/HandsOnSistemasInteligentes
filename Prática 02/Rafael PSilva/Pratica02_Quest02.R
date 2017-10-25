taxa_positiva <- c(mean(domingo$global_rate_positive_words),mean(segunda$global_rate_positive_words), mean(terca$global_rate_positive_words), mean(quarta$global_rate_positive_words), mean(quinta$global_rate_positive_words), mean(sexta$global_rate_positive_words), mean(sabado$global_rate_positive_words))
taxa_negativa <- c(mean(domingo$global_rate_negative_words),mean(segunda$global_rate_negative_words), mean(terca$global_rate_negative_words), mean(quarta$global_rate_negative_words), mean(quinta$global_rate_negative_words), mean(sexta$global_rate_negative_words), mean(sabado$global_rate_negative_words))


par(mfrow = c(1,2))
plot(taxa_positiva, type='o',
     xaxt = "n",
     ylim = c (0.01, 0.05),
     main="Taxas Globais",
     xlab = "Dias da Semana", ylab = "Taxas",
     col= "blue", lwd =2)

lines(taxa_negativa, type = 'o', col="red", lwd=2)


legend("center", legend = c("Positivia", "Negativa"), col = c("blue", "red"), lty=1, cex=0.6, title = "Legenda")
axis(1,labels = days,seq(7))


token_negativo <- c(mean(domingo$rate_positive_words),mean(segunda$rate_positive_words), mean(terca$rate_positive_words), mean(quarta$rate_positive_words), mean(quinta$rate_positive_words), mean(sexta$rate_positive_words), mean(sabado$rate_positive_words))
token_positivo <- c(mean(domingo$rate_negative_words),mean(segunda$rate_negative_words), mean(terca$rate_negative_words), mean(quarta$rate_negative_words), mean(quinta$rate_negative_words), mean(sexta$rate_negative_words), mean(sabado$rate_negative_words))


plot(token_positivo, type='o',
     xaxt = "n",
     ylim = c (0.2, 0.8),
     main="Taxas",
     xlab = "Dias da Semana", ylab = "Taxas",
     col= "blue", lwd =2)
lines(token_negativo, type = 'o', col="red", lwd=2)

legend("center", legend = c("Positiva", "Negativa"), col = c("blue", "red"), lty=1, cex=0.6, title = "Legenda")
axis(1,labels = days,seq(7))