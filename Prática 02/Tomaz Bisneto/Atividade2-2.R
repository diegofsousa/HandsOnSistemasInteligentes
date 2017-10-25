setwd("/home/tomaz/Documentos/R\ Teste/Tomaz\ Bisneto\ /")
dados <- read.csv("OnlineNewsPopularity.csv",header = TRUE)
str(dados)
#summary(dados)
domingos <- subset(dados,dados["weekday_is_sunday"]==1.0)
segundas <- subset(dados,dados["weekday_is_monday"]==1.0)
terca <- subset(dados,dados["weekday_is_tuesday"]==1.0)
quarta <- subset(dados,dados["weekday_is_wednesday"]==1.0)
quinta <- subset(dados,dados["weekday_is_thursday"]==1.0)
sexta <- subset(dados,dados["weekday_is_friday"]==1.0)
sabado <- subset(dados,dados["weekday_is_saturday"]==1.0)
#Valores Positivos 1 
positivo_domingos = mean(domingos$global_rate_positive_words,na.rm = TRUE)
positivo_segundas = mean(segundas$global_rate_positive_words,na.rm = TRUE)
positivo_terca = mean(terca$global_rate_positive_words,na.rm = TRUE)
positivo_quarta = mean(quarta$global_rate_positive_words,na.rm = TRUE)
positivo_quinta = mean(quinta$global_rate_positive_words,na.rm = TRUE)
positivo_sexta = mean(sexta$global_rate_positive_words,na.rm = TRUE)
positivo_sabado = mean(sabado$global_rate_positive_words,na.rm = TRUE)
#Valores negativos 1
negativo_domingos = mean(domingos$global_rate_negative_words,na.rm = TRUE)
negativo_segundas = mean(segundas$global_rate_negative_words,na.rm = TRUE)
negativo_terca = mean(terca$global_rate_negative_words,na.rm = TRUE)
negativo_quarta = mean(quarta$global_rate_negative_words,na.rm = TRUE)
negativo_quinta = mean(quinta$global_rate_negative_words,na.rm = TRUE)
negativo_sexta = mean(sexta$global_rate_negative_words,na.rm = TRUE)
negativo_sabado = mean(sabado$global_rate_negative_words,na.rm = TRUE)

#Valores Positivos 2 
tokens_positivo_domingos = mean(domingos$rate_positive_words,na.rm = TRUE)
tokens_positivo_segundas = mean(segundas$rate_positive_words,na.rm = TRUE)
tokens_positivo_terca = mean(terca$rate_positive_words,na.rm = TRUE)
tokens_positivo_quarta = mean(quarta$rate_positive_words,na.rm = TRUE)
tokens_positivo_quinta = mean(quinta$rate_positive_words,na.rm = TRUE)
tokens_positivo_sexta = mean(sexta$rate_positive_words,na.rm = TRUE)
tokens_positivo_sabado = mean(sabado$rate_positive_words,na.rm = TRUE)
#Valores negativos 2 
tokens_negativo_domingos = mean(domingos$rate_negative_words,na.rm = TRUE)
tokens_negativo_segundas = mean(segundas$rate_negative_words,na.rm = TRUE)
tokens_negativo_terca = mean(terca$rate_negative_words,na.rm = TRUE)
tokens_negativo_quarta = mean(quarta$rate_negative_words,na.rm = TRUE)
tokens_negativo_quinta = mean(quinta$rate_negative_words,na.rm = TRUE)
tokens_negativo_sexta = mean(sexta$rate_negative_words,na.rm = TRUE)
tokens_negativo_sabado = mean(sabado$rate_negative_words,na.rm = TRUE)

#Construindo as listas Para plot

taxa_positiva <- c(positivo_domingos,positivo_segundas,positivo_terca,positivo_quarta,positivo_quinta,positivo_sexta,positivo_sabado)
taxa_negativa <- c(negativo_domingos,negativo_segundas,negativo_terca,negativo_quarta,negativo_quinta,negativo_sexta,negativo_sabado)

tokens_taxa_positiva <- c(tokens_positivo_domingos,tokens_positivo_segundas,tokens_positivo_terca,tokens_positivo_quarta,tokens_positivo_quinta,tokens_positivo_sexta,tokens_positivo_sabado)
tokens_taxa_negativa <- c(tokens_negativo_domingos,tokens_negativo_segundas,tokens_negativo_terca,tokens_negativo_quarta,tokens_negativo_quinta,tokens_negativo_sexta,tokens_negativo_sabado)

dias_da_Semana <- c("Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sabado")
d = c(1,2,3,4,5,6,7)

#Plotagem do Grafico 
par(mfrow=c(1,2))
par(mar=c(6,6,6,6))
plot(taxa_positiva~d,type = "o",xaxt = "n",col = "red", lwd =2,main = "Taxas do Usos de Palavras Negativas e Positivas",xlab = "Dias Da Semana",ylim = c(0.009,0.05),ylab = "Taxas",lty =1,pch =1,sub = "Valores Medios de Taxa Por  Dia")
lines(taxa_negativa~d,type = "o",xaxt = "n", col = "blue", lwd =2,lty =3,pch =1)
axis(1,at = d,labels = dias_da_Semana)
legend(x=3,y=0.03,legend = c("Taxas Positivas","Taxas Negativas"),col = c("red","blue"),lty=2, cex=0.6,title = "Legendas")

plot(tokens_taxa_positiva~d,type = "o",xaxt = "n",col = "red", lwd =2,main = "Taxas do Usos de Palavras Negativas e Positivas(Tokens)",xlab = "Dias Da Semana",ylim = c(0.2,0.7),ylab = "Taxas(Tokens)",lty =1,pch =1,sub = "Valores Medios de Taxa Por  Dia(Tokens)")
lines(tokens_taxa_negativa~d,type = "o",xaxt = "n", col = "blue", lwd =2,lty =3,pch =1)
axis(1,at = d,labels = dias_da_Semana)
legend(x=3,y=0.5,legend = c("Taxas Positivas","Taxas Negativas"),col = c("red","blue"),lty=2, cex=0.6,title = "Legendas")