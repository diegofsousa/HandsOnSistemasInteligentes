# SEGUNDA QUESTAO

# obtenção do dataset
setwd("/home/estevao/Arquivos UFPI/PERIODOS/6º PERIODO/SISTEMAS INTELIGENTES/Codigos R/Pratica 02")
dados <- read.csv("dados.csv", header = TRUE)


# selecionando variáveis de observação
domingo <- subset(dados,dados$weekday_is_sunday == 1)
segunda_feira <- subset(dados,dados$weekday_is_monday == 1)
terca_feira <- subset(dados,dados$weekday_is_tuesday == 1)
quarta_feira <- subset(dados,dados$weekday_is_wednesday == 1)
quinta_feira <- subset(dados,dados$weekday_is_thursday == 1)
sexta_feira <- subset(dados,dados$weekday_is_friday == 1)
sabado <- subset(dados,dados$weekday_is_saturday == 1)


# obtenção das  taxas de palavras positivas de cada dia
media_da_taxa_positiva_dos_domingos <- mean(x = domingo$global_rate_positive_words)
media_da_taxa_positiva_das_segundas <- mean(x = segunda_feira$global_rate_positive_words)
media_da_taxa_positiva_das_tercas <- mean(x = terca_feira$global_rate_positive_words)
media_da_taxa_positiva_das_quartas <- mean(x = quarta_feira$global_rate_positive_words)
media_da_taxa_positiva_das_quintas <- mean(x = quinta_feira$global_rate_positive_words)
media_da_taxa_positiva_das_sextas <- mean(x = sexta_feira$global_rate_positive_words)
media_da_taxa_positiva_dos_sabados <- mean(x = sabado$global_rate_positive_words)


# obtenção das taxas de palavras negativas de cada dia
media_da_taxa_negativa_dos_domingos <- mean(x = domingo$global_rate_negative_words)
media_da_taxa_negativa_das_segundas <- mean(x = segunda_feira$global_rate_negative_words)
media_da_taxa_negativa_das_tercas <- mean(x = terca_feira$global_rate_negative_words)
media_da_taxa_negativa_das_quartas <- mean(x = quarta_feira$global_rate_negative_words)
media_da_taxa_negativa_das_quintas <- mean(x = quinta_feira$global_rate_negative_words)
media_da_taxa_negativa_das_sextas <- mean(x = sexta_feira$global_rate_negative_words)
media_da_taxa_negativa_dos_sabados <- mean(x = sabado$global_rate_negative_words)



# obtenção das  taxas de palavras positivas entre tokens não neutros
media_da_taxa_positiva_entre_tokens_dos_domingos <- mean(x = domingo$rate_positive_words)
media_da_taxa_positiva_entre_tokens_das_segundas <- mean(x = segunda_feira$rate_positive_words)
media_da_taxa_positiva_entre_tokens_das_tercas <- mean(x = terca_feira$rate_positive_words)
media_da_taxa_positiva_entre_tokens_das_quartas <- mean(x = quarta_feira$rate_positive_words)
media_da_taxa_positiva_entre_tokens_das_quintas <- mean(x = quinta_feira$rate_positive_words)
media_da_taxa_positiva_entre_tokens_das_sextas <- mean(x = sexta_feira$rate_positive_words)
media_da_taxa_positiva_entre_tokens_dos_sabados <- mean(x = sabado$rate_positive_words)



# obtenção das taxas de palavras negativa entre tokens não neutros
media_da_taxa_negativa_entre_tokens_dos_domingos <- mean(x = domingo$rate_negative_words)
media_da_taxa_negativa_entre_tokens_das_segundas <- mean(x = segunda_feira$rate_negative_words)
media_da_taxa_negativa_entre_tokens_das_tercas <- mean(x = terca_feira$rate_negative_words)
media_da_taxa_negativa_entre_tokens_das_quartas <- mean(x = quarta_feira$rate_negative_words)
media_da_taxa_negativa_entre_tokens_das_quintas <- mean(x = quinta_feira$rate_negative_words)
media_da_taxa_negativa_entre_tokens_das_sextas <- mean(x = sexta_feira$rate_negative_words)
media_da_taxa_negativa_entre_tokens_dos_sabados <- mean(x = sabado$rate_negative_words)



taxa_positiva <- c(media_da_taxa_positiva_dos_domingos, 
                   media_da_taxa_positiva_das_segundas,
                   media_da_taxa_positiva_das_tercas,
                   media_da_taxa_positiva_das_quartas,
                   media_da_taxa_positiva_das_quintas,
                   media_da_taxa_positiva_das_sextas,
                   media_da_taxa_positiva_dos_sabados)

taxa_negativa <- c(media_da_taxa_negativa_dos_domingos, 
                   media_da_taxa_negativa_das_segundas, 
                   media_da_taxa_negativa_das_tercas, 
                   media_da_taxa_negativa_das_quartas, 
                   media_da_taxa_negativa_das_quintas, 
                   media_da_taxa_negativa_das_sextas, 
                   media_da_taxa_negativa_dos_sabados)


taxa_positiva_entre_tokens <- c(media_da_taxa_positiva_entre_tokens_dos_domingos, 
                                media_da_taxa_positiva_entre_tokens_das_segundas,
                                media_da_taxa_positiva_entre_tokens_das_tercas,
                                media_da_taxa_positiva_entre_tokens_das_quartas,
                                media_da_taxa_positiva_entre_tokens_das_quintas,
                                media_da_taxa_positiva_entre_tokens_das_sextas,
                                media_da_taxa_positiva_entre_tokens_dos_sabados)



taxa_negativa_entre_tokens<- c(media_da_taxa_negativa_entre_tokens_dos_domingos, 
                               media_da_taxa_negativa_entre_tokens_das_segundas, 
                               media_da_taxa_negativa_entre_tokens_das_tercas, 
                               media_da_taxa_negativa_entre_tokens_das_quartas, 
                               media_da_taxa_negativa_entre_tokens_das_quintas, 
                               media_da_taxa_negativa_entre_tokens_das_sextas, 
                               media_da_taxa_negativa_entre_tokens_dos_sabados)



# contrução das tabelas
par(mfrow=c(1,2))
par(mar=c(6,6,6,6))

l <- c(1, 2, 3, 4, 5, 6, 7)

#tabela 1

plot(taxa_positiva~l, 
     type="o", 
     main = "Palavras Positivas e Negativas", 
     xlab="Dias da Semana",
     sub = "Visualização de Dados com R",
     ylab="Taxa de Palavras",
     col="blue",
     xaxt = 'n',
     pch = 1,
     lty = 3,
     ylim = c(0.01, 0.05))

lines(taxa_negativa~l,
      type = "o",
      col = "green",
      xaxt = 'n',
      pch = 1, 
      lty = 3,
      ylim = c(0.2,0.6))


axis(1, at = l, labels = c(
  "Domingo", 
  "Segunda-Feira", 
  "Terça-Feira", 
  "Quarta-Feira", 
  "Quinta-Feira", 
  "Sexta-Feira", 
  "Sábado")
)

legend(title = "Legenda",
       legend = c("Taxas Positivas", "Taxas Negativas"),
       col = c("blue","green"),
       x=1,
       y=0.034,
       lty=2,
       cex=0.3
)

#tabela 2

plot(taxa_positiva_entre_tokens~l, 
     type="o", 
     main = "Taxas de Palavras Positivas Entre Tokens Não Neutros", 
     xlab="Dias da Semana",
     sub = "Visualização de Dados com R",
     ylab="Taxa de Palvras Entre Tokens",
     col="blue",
     xaxt = 'n',
     pch = 1,
     lty = 3,
     ylim = c(0.2, 0.7))

lines(taxa_negativa_entre_tokens~l,
      type = "o",
      col = "green",
      xaxt = 'n',
      pch = 1, 
      lty = 3,
      ylim = c(0.2,0.6))

#construção dos rotulos do eixo x
axis(1, at = l, labels = c(
  "Domingo", 
  "Segunda-Feira", 
  "Terça-Feira", 
  "Quarta-Feira", 
  "Quinta-Feira", 
  "Sexta-Feira", 
  "Sábado")
)

legend(title = "Legenda",
       legend = c("Taxas Positivas Entre Tokens", "Taxas Negativas Entre Tokens"),
       col = c("blue","green"),
       x=1,
       y=0.5,
       lty=2,
       cex=0.3)



