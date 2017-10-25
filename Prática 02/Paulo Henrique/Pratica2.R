library(caret)
dataset_news <- read.csv("OnlineNewsPopularity.csv")
summary(dataset_news)

#Questão 01
png(filename="questao01.png", width = 899, height = 445)

monday <- dataset_news[dataset_news$weekday_is_monday==1,]
media_segunda <- mean(monday$shares)
desvio_segunda <- sd(monday$shares)

tuesday <- dataset_news[dataset_news$weekday_is_tuesday==1,]
media_terca <- mean(tuesday$shares)
desvio_terca <- sd(tuesday$shares)

wednesday <- dataset_news[dataset_news$weekday_is_wednesday==1,]
media_quarta <- mean(wednesday$shares)
desvio_quarta <- sd(wednesday$shares)

thursday <- dataset_news[dataset_news$weekday_is_thursday==1,]
media_quinta <- mean(thursday$shares)
desvio_quinta <- sd(thursday$shares)

friday <- dataset_news[dataset_news$weekday_is_friday==1,]
media_sexta <- mean(friday$shares)
desvio_sexta <- sd(friday$shares)

saturday <- dataset_news[dataset_news$weekday_is_saturday==1,]
media_sabado <- mean(saturday$shares)
desvio_sabado <- sd(saturday$shares)

sunday <- dataset_news[dataset_news$weekday_is_sunday==1,]
media_domingo <- mean(sunday$shares)
desvio_domingo <- sd(sunday$shares)

medias <- c(media_domingo, media_segunda, media_terca, media_quarta, media_quinta, media_sexta, media_sabado)

desvios_padroes <- c(desvio_domingo, desvio_segunda, desvio_terca, desvio_quarta, desvio_quinta, desvio_sexta, desvio_sabado)

week <- 1:7
dias <- c("Domingo","Segunda-Feira" ,"Terça-Feira", "Quarta-Feira", "Quinta-Feira", "Sexta-Feira", "Sábado")

#Plotando Grafico
plot(medias~week, type="o", col="blue", lwd=1, lty=8, ylim=c(3000,4500), xaxt="n", xlab="Dias da Semana", ylab = "Quantidade de Compartilhamento", main="Compartilhamento Por Dia da Semana",sub="Visualização dos Dados com R", cex.sub=0.9)
axis(1, at = seq_along(dias), labels = dias)

#adicionando uma legenda
legend("topright", legend=c("Média de Compartilhamento"), col=c("blue"), lty=8, cex=0.8, title="Legenda")


dev.off()


#Questão 02
png(filename="questao02.png", width = 899, height = 445)

media_taxa_positiva_segunda <- mean(monday$global_rate_positive_words)
media_taxa_positiva_terca <- mean(tuesday$global_rate_positive_words)
media_taxa_positiva_quarta <- mean(wednesday$global_rate_positive_words)
media_taxa_positiva_quinta <- mean(thursday$global_rate_positive_words)
media_taxa_positiva_sexta <- mean(friday$global_rate_positive_words)
media_taxa_positiva_sabado <- mean(saturday$global_rate_positive_words)
media_taxa_positiva_domingo <- mean(sunday$global_rate_positive_words)

taxa_positiva <- c(media_taxa_positiva_domingo, media_taxa_positiva_segunda, media_taxa_positiva_terca, media_taxa_positiva_quarta, media_taxa_positiva_quinta, media_taxa_positiva_sexta, media_taxa_positiva_sabado)

media_taxa_negativa_segunda <- mean(monday$global_rate_negative_words)
media_taxa_negativa_terca <- mean(tuesday$global_rate_negative_words)
media_taxa_negativa_quarta <- mean(wednesday$global_rate_negative_words)
media_taxa_negativa_quinta <- mean(thursday$global_rate_negative_words)
media_taxa_negativa_sexta <- mean(friday$global_rate_negative_words)
media_taxa_negativa_sabado <- mean(saturday$global_rate_negative_words)
media_taxa_negativa_domingo <- mean(sunday$global_rate_negative_words)

taxa_negativa <- c(media_taxa_negativa_domingo, media_taxa_negativa_segunda, media_taxa_negativa_terca, media_taxa_negativa_quarta, media_taxa_negativa_quinta, media_taxa_negativa_sexta, media_taxa_negativa_sabado)

par(mfrow=c(1,2))

#Plotar Grafico 1
plot(taxa_negativa~week, type="o", col="red", lwd=1, lty=8, xaxt="n", ylim=c(0.016, 0.042 ), xlab="Dias da Semana", ylab = "Taxa de Palavras", main="Compartilhamento de Noticias pela Internet",sub="Visualização dos Dados com R", cex.sub=0.9, cex.main=0.8)

lines(taxa_positiva~week, type="o", col="blue", lwd=2)
axis(1, at = seq_along(dias), labels = dias)

#adicionando uma legenda
legend("center", legend=c("Taxa Negativa", "Taxa Positiva"), col=c("red", "blue"), lty=1, cex=0.6, title="Legenda")

#Tokens Nao Neutros

media_token_positivo_segunda <- mean(monday$rate_positive_words)
media_token_positivo_terca <- mean(tuesday$rate_positive_words)
media_token_positivo_quarta <- mean(wednesday$rate_positive_words)
media_token_positivo_quinta <- mean(thursday$rate_positive_words)
media_token_positivo_sexta <- mean(friday$rate_positive_words)
media_token_positivo_sabado <- mean(saturday$rate_positive_words)
media_token_positivo_domingo <- mean(sunday$rate_positive_words)

token_positivo <- c(media_token_positivo_domingo, media_token_positivo_segunda, media_token_positivo_terca, media_token_positivo_quarta, media_token_positivo_quinta, media_token_positivo_sexta, media_token_positivo_sabado)

media_token_negativo_segunda <- mean(monday$rate_negative_words)
media_token_negativo_terca <- mean(tuesday$rate_negative_words)
media_token_negativo_quarta <- mean(wednesday$rate_negative_words)
media_token_negativo_quinta <- mean(thursday$rate_negative_words)
media_token_negativo_sexta <- mean(friday$rate_negative_words)
media_token_negativo_sabado <- mean(saturday$rate_negative_words)
media_token_negativo_domingo <- mean(sunday$rate_negative_words)

token_negativo <- c(media_token_negativo_domingo, media_token_negativo_segunda, media_token_negativo_terca, media_token_negativo_quarta, media_token_negativo_quinta, media_token_negativo_sexta, media_token_negativo_sabado)

#Plotar Grafico 2
plot(token_negativo~week, type="o", col="red", lwd=1, lty=8, xaxt="n", ylim=c(0.27, 0.69 ), xlab="Dias da Semana", ylab = "Taxa de Tokens Não Neutros",main="Compartilhamento de Noticias pela Internet" ,sub="Visualização dos Dados com R", cex.sub=0.9, cex.main=0.8)

lines(token_positivo~week, type="o", col="blue", lwd=2)
axis(1, at = seq_along(dias), labels = dias)

#adicionando uma legenda
legend("center", legend=c("Tokens Não Neutros Negativa", "Tokens Não Neutros Positiva"), col=c("red", "blue"), lty=1, cex=0.6, title="Legenda")

dev.off()

#Questao Extra
png(filename="extra.png", width = 899, height = 445)

media_imagem_segunda <- mean(monday$num_imgs)
media_imagem_terca <- mean(tuesday$num_imgs)
media_imagem_quarta <- mean(wednesday$num_imgs)
media_imagem_quinta <- mean(thursday$num_imgs)
media_imagem_sexta <- mean(friday$num_imgs)
media_imagem_sabado <- mean(saturday$num_imgs)
media_imagem_domingo <- mean(sunday$num_imgs)

medias_imagem <- c(media_imagem_domingo, media_imagem_segunda, media_imagem_terca, media_imagem_quarta, media_imagem_quinta, media_imagem_sexta, media_imagem_sabado)

barplot(medias_imagem, ylim=c(0,6), ylab = "Média de Imagens Compartilhadas", xlab = "Dias da Semana", names.arg = dias, main="Compartilhamento de Imagens na Semana", col="black", las=1)

dev.off()