setwd("C:/Users/Tacinho Moreira/HandsOnSistemasInteligentes/Prática 02/tacio moreira")
dataurl <- read.csv("OnlineNewsPopularity.csv", header = TRUE, sep = ",")


#______________________________________________________________________________________#
#_______________________________________GRAFICO 1______________________________________#
#______________________________________________________________________________________#

#TAXA POSITIVA

tax_segunda <- subset(dataurl, dataurl$weekday_is_monday == 1)
p_seg <- mean(x=tax_segunda$global_rate_positive_words)
print(p_seg)

tax_terca <- subset(dataurl, dataurl$weekday_is_tuesday == 1)
p_ter <- mean(x=tax_terca$global_rate_positive_words)
print(p_ter)

tax_quarta <- subset(dataurl, dataurl$weekday_is_wednesday == 1)
p_quar <- mean(x=tax_quarta$global_rate_positive_words)
print(p_quar)

tax_quinta <- subset(dataurl, dataurl$weekday_is_thursday == 1)
p_quin <- mean(x=tax_quinta$global_rate_positive_words)
print(p_quin)

tax_sexta <- subset(dataurl, dataurl$weekday_is_friday == 1)
p_sex <- mean(x=tax_sexta$global_rate_positive_words)
print(p_sex)

tax_sabado <- subset(dataurl, dataurl$weekday_is_saturday == 1)
p_sab <- mean(x=tax_sabado$global_rate_positive_words)
print(p_sab)

tax_domingo <- subset(dataurl, dataurl$weekday_is_sunday == 1)
p_dom <- mean(x=tax_domingo$global_rate_positive_words)
print(p_dom)

taxa_positiva <- c(p_seg, p_ter, p_quar, p_quin, p_sex, p_sab, p_dom)

#TAXA NEGATIVA

tax_segunda <- subset(dataurl, dataurl$weekday_is_monday == 1)
n_seg <- mean(x=tax_segunda$global_rate_negative_words)
print(n_seg)

tax_terca <- subset(dataurl, dataurl$weekday_is_tuesday == 1)
n_ter <- mean(x=tax_terca$global_rate_negative_words)
print(n_ter)

tax_quarta <- subset(dataurl, dataurl$weekday_is_wednesday == 1)
n_quar <- mean(x=tax_quarta$global_rate_negative_words)
print(n_quar)

tax_quinta <- subset(dataurl, dataurl$weekday_is_thursday == 1)
n_quin <- mean(x=tax_quinta$global_rate_negative_words)
print(n_quin)

tax_sexta <- subset(dataurl, dataurl$weekday_is_friday == 1)
n_sex <- mean(x=tax_sexta$global_rate_negative_words)
print(n_sex)

tax_sabado <- subset(dataurl, dataurl$weekday_is_saturday == 1)
n_sab <- mean(x=tax_sabado$global_rate_negative_words)
print(n_sab)

tax_domingo <- subset(dataurl, dataurl$weekday_is_sunday == 1)
n_dom <- mean(x=tax_domingo$global_rate_negative_words)
print(n_dom)

taxa_negativa <- c(n_seg, n_ter, n_quar, n_quin, n_sex, n_sab, n_dom)

#TAXA NULA POSITIVA

nula_positiva_segunda <- subset(dataurl, dataurl$weekday_is_monday == 1)
nula_positiva_seg <- mean(x=nula_positiva_segunda$rate_positive_words)
print(nula_positiva_seg)

nula_positiva_terca <- subset(dataurl, dataurl$weekday_is_tuesday == 1)
nula_positiva_ter <- mean(x=nula_positiva_terca$rate_positive_words)
print(nula_positiva_ter)

nula_positiva_quarta <- subset(dataurl, dataurl$weekday_is_wednesday == 1)
nula_positiva_quar <- mean(x=nula_positiva_quarta$rate_positive_words)
print(nula_positiva_quar)

nula_positiva_quinta <- subset(dataurl, dataurl$weekday_is_thursday == 1)
nula_positiva_quin <- mean(x=nula_positiva_quinta$rate_positive_words)
print(nula_positiva_quin)

nula_positiva_sexta <- subset(dataurl, dataurl$weekday_is_friday == 1)
nula_positiva_sex <- mean(x=nula_positiva_sexta$rate_positive_words)
print(nula_positiva_sex)

nula_positiva_sabado <- subset(dataurl, dataurl$weekday_is_saturday == 1)
nula_positiva_sab <- mean(x=nula_positiva_sabado$rate_positive_words)
print(p_sab)

nula_positiva_domingo <- subset(dataurl, dataurl$weekday_is_sunday == 1)
nula_positiva_dom <- mean(x=nula_positiva_domingo$rate_positive_words)
print(nula_positiva_dom)

taxa_nula_positiva <- c(nula_positiva_seg, nula_positiva_ter, nula_positiva_quar, 
                        nula_positiva_quin, nula_positiva_sex, nula_positiva_sab,
                        nula_positiva_dom)

#TAXA NULA NEGATIVA

nula_negativa_segunda <- subset(dataurl, dataurl$weekday_is_monday == 1)
nula_negativa_seg <- mean(x=nula_negativa_segunda$rate_negative_words)
print(nula_negativa_seg)

nula_negativa_terca <- subset(dataurl, dataurl$weekday_is_tuesday == 1)
nula_negativa_ter <- mean(x=nula_negativa_terca$rate_negative_words)
print(nula_negativa_ter)

nula_negativa_quarta <- subset(dataurl, dataurl$weekday_is_wednesday == 1)
nula_negativa_quar <- mean(x=nula_negativa_quarta$rate_negative_words)
print(nula_negativa_quar)

nula_negativa_quinta <- subset(dataurl, dataurl$weekday_is_thursday == 1)
nula_negativa_quin <- mean(x=nula_negativa_quinta$rate_negative_words)
print(nula_negativa_quin)

nula_negativa_sexta <- subset(dataurl, dataurl$weekday_is_friday == 1)
nula_negativa_sex <- mean(x=nula_negativa_sexta$rate_negative_words)
print(nula_negativa_sex)

nula_negativa_sabado <- subset(dataurl, dataurl$weekday_is_saturday == 1)
nula_negativa_sab <- mean(x=nula_negativa_sabado$rate_negative_words)
print(nula_negativa_sab)

nula_negativa_domingo <- subset(dataurl, dataurl$weekday_is_sunday == 1)
nula_negativa_dom <- mean(x=nula_negativa_domingo$rate_negative_words)
print(nula_negativa_dom)

taxa_nula_negativa <- c(nula_negativa_seg, nula_negativa_ter, nula_negativa_quar,
                        nula_negativa_quin, nula_negativa_sex, 
                        nula_negativa_sab, nula_negativa_dom)




#GRAFICO 1
par(mfrow=c(1,2))
par(mar=c(6,6,6,6))

plot(taxa_positiva, main = "Palavras Positivas e \n Negativas Por Dia Da Semana", 
     ylim = c(0.01,0.045), ylab = "Quantidade De palavras \n Positivas e Negativas", 
     xlab = "Dias Da Semana", 
     type = "b", pch = 1, col= 'red',xaxt = 'n', lwd = 2)

lines(taxa_negativa, type = "b", pch = 1, col="blue", lwd=2, xaxt = 'n')

legend(x=4, y=0.03, legend = c("Nulas Positivas", "Nulas Negativas"), col = c("red", "blue"),
       lty=1, cex=0.6, title = "Legenda")

dia <- c("Domingo", "Segunda", 
         "Terça", "Quarta", 
         "Quinta", "Sexta", 
         "Sábado")
num <- c(1, 2, 3, 4, 5, 6, 7)

axis(1, at = num, labels = dia)

#GRAFICO 2
plot(taxa_nula_positiva, 
     main = "Palavras Nulas Positivas e \n Nulas Negativas Por Dia Da Semana", 
     ylim = c(0,1), 
     ylab = "Quantidade De palavras \n Nulas Positivas e \n Nulas Negativas", 
     xlab = "Dias Da Semana", 
     type = "b", pch = 1, col= 'red',xaxt = 'n', lwd = 2)
legend(x=5, y=0.95, legend = c("Positivas", "Negativas"), col = c("red", "blue"),
       lty=1, cex=0.6, title = "Legenda")

lines(taxa_nula_negativa, type = "b", pch = 1, col="blue", lwd=2, xaxt = 'n')


dia <- c("Domingo", "Segunda", 
         "Terça", "Quarta", 
         "Quinta", "Sexta", 
         "Sábado")
num <- c(1, 2, 3, 4, 5, 6, 7)

axis(1, at = num, labels = dia)
