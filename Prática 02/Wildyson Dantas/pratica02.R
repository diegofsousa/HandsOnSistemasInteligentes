#PRIMEIRA QUESTÃO

#leitura do arquivo
newspopularity <- read.csv("C:/Users/wildyson/UFPI/6 periodo/Sistemas Inteligentes/OnlineNewsPopularity/OnlineNewsPopularity.csv", sep=',')

#separando o shares por dia
segunda <- subset(newspopularity,  newspopularity$weekday_is_monday == 1)
terca <- subset(newspopularity,  newspopularity$weekday_is_tuesday == 1)
quarta <- subset(newspopularity,  newspopularity$weekday_is_wednesday == 1)
quinta <- subset(newspopularity,  newspopularity$weekday_is_thursday == 1)
sexta <- subset(newspopularity,  newspopularity$weekday_is_friday == 1)
sabado <- subset(newspopularity,  newspopularity$weekday_is_saturday == 1)
domingo <- subset(newspopularity,  newspopularity$weekday_is_sunday == 1)
#criando um vetor com os shares 
frequencia <- c( mean(domingo$shares),mean(segunda$shares), mean(terca$shares), mean(quarta$shares),
                mean(quinta$shares), mean(sexta$shares), mean(sabado$shares))
days <- c( "Domingo","Segunda Feira", "Terça Feira", "Quarta Feira", "Quinta Feira", "Sexta Feira", "Sabado")

#plotando
plot(frequencia, type="o",
     xaxt = "n",
     main="Compartilhamento por Dia da Semana",
     xlab = "Dias da Semana", ylab = "Quantidade de compartilhamentos",
     col="blue", lty = 5,  pch=5)
axis(1,labels = days,seq(7))


#SEGUNDA QUESTAO ###################

#taxa positiva
taxa_positiva <- c(mean(domingo$global_rate_positive_words),mean(segunda$global_rate_positive_words), mean(terca$global_rate_positive_words),
                    mean(quarta$global_rate_positive_words), mean(quinta$global_rate_positive_words), mean(sexta$global_rate_positive_words),
                    mean(sabado$global_rate_positive_words))
#taxa negativa
taxa_negativa <- c(mean(domingo$global_rate_negative_words),mean(segunda$global_rate_negative_words), mean(terca$global_rate_negative_words),
                   mean(quarta$global_rate_negative_words), mean(quinta$global_rate_negative_words), mean(sexta$global_rate_negative_words),
                   mean(sabado$global_rate_negative_words))


#Plotando grafico 1 -------------------------------------

par(mfrow = c(1,2))
plot(taxa_positiva, type='o',
     xaxt = "n",
     ylim = c (0.01, 0.05),
     main="Global Rate Words",
     xlab = "Dias da Semana", ylab = "Rate Words",
     col= "blue", lwd =2)

#adcionando o linhas
lines(taxa_negativa, type = 'o', col="red", lwd=2)

#adcionando uma legenda

legend("center", legend = c("Positivia", "Negativa"),
       col = c("blue", "red"), lty=1, cex=0.6, title = "Global Rate Words")
axis(1,labels = days,seq(7))

#Plotando grafico 2 ------------------------------------
#token positivo
token_negativo <- c(mean(domingo$rate_positive_words),mean(segunda$rate_positive_words), mean(terca$rate_positive_words),
                   mean(quarta$rate_positive_words), mean(quinta$rate_positive_words), mean(sexta$rate_positive_words),
                   mean(sabado$rate_positive_words))
#token negativo
token_positivo <- c(mean(domingo$rate_negative_words),mean(segunda$rate_negative_words), mean(terca$rate_negative_words),
                   mean(quarta$rate_negative_words), mean(quinta$rate_negative_words), mean(sexta$rate_negative_words),
                   mean(sabado$rate_negative_words))


plot(token_positivo, type='o',
     xaxt = "n",
     ylim = c (0.2, 0.8),
     main="Token Words",
     xlab = "Dias da Semana", ylab = "Rate Words",
     col= "blue", lwd =2)

#adcionando o linhas
lines(token_negativo, type = 'o', col="red", lwd=2)

#adcionando uma legenda

legend("center", legend = c("Positiva", "Negativa"),
       col = c("blue", "red"), lty=1, cex=0.6, title = "Rate Words")
axis(1,labels = days,seq(7))


#QUESTAO EXTRA ########## 
#listar as médias de subjetividade do texto do artigo (global_subjectivity) para cada dia da semana 

taxa_subj <- c( mean(domingo$global_subjectivity),mean(segunda$global_subjectivity), mean(terca$global_subjectivity), mean(quarta$global_subjectivity),
                 mean(quinta$global_subjectivity), mean(sexta$global_subjectivity), mean(sabado$global_subjectivity))

#plotando questao extra
plot(taxa_subj, type="o",
     xaxt = "n",
     main="Taxa de subjetividade por Dia da Semana",
     xlab = "Dias da Semana", ylab = "Taxa de Subjetividade",
     col="blue", lty = 5,  pch=5)
axis(1,labels = days,seq(7))