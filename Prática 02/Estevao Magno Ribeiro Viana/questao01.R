# PRIMEIRA QUESTAO

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


# obtenção dos valores das médias de cada dia
media_dos_domingos <- mean(x = domingo$shares)
media_das_segundas <- mean(x = segunda_feira$shares)
media_das_tercas <- mean(x = terca_feira$shares)
media_das_quartas <- mean(x = quarta_feira$shares)
media_das_quintas <- mean(x = quinta_feira$shares)
media_das_sextas <- mean(x = sexta_feira$shares)
media_dos_sabados <- mean(x = sabado$shares)


# adicionando valores para a construção do gráfico
medias <- c(media_dos_domingos, 
            media_das_segundas, 
            media_das_tercas, 
            media_das_quartas, 
            media_das_quintas, 
            media_das_sextas, 
            media_dos_sabados)

# contrução da tabela
plot(medias, 
     type="o", 
     main = "Compartilhamento por Dia da Semana", 
     xlab="Dias da Semana",
     sub = "Visualização de Dados com R",
     ylab="Quantidade de Compartilhamentos",
     col="darkblue",
     ylim = c(2950,4550),
     pch = 1,
     xaxt = 'n',
     lty = 3)



#construção dos rotulos do eixo x
axis(1, 
     at=1:7, 
     labels = c(
       "Domingo", 
       "Segunda-Feira", 
       "Terça-Feira", 
       "Quarta-Feira", 
       "Quinta-Feira", 
       "Sexta-Feira", 
       "Sábado")
)

# Adição da Legenda
legend(title = "Legenda",
       legend = c("Média de Compartilhamento"),
       col = c("blue"),
       x=4.3,
       y=4500,
       lty=2,
       cex=0.58
)
