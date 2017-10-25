# QUESTAO EXTRA

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
media_dos_domingos <- mean(x = domingo$num_imgs)
media_das_segundas <- mean(x = segunda_feira$num_imgs)
media_das_tercas <- mean(x = terca_feira$num_imgs)
media_das_quartas <- mean(x = quarta_feira$num_imgs)
media_das_quintas <- mean(x = quinta_feira$num_imgs)
media_das_sextas <- mean(x = sexta_feira$num_imgs)
media_dos_sabados <- mean(x = sabado$num_imgs)


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
     main = "Média de Imagens Utilizada por Dia da Semana", 
     xlab="Dias da Semana",
     sub = "Visualização de Dados com R",
     ylab="Quantidade de imagens",
     type="l", 
     col="green",
     pch = 2,
     xaxt = 'n',
     lty = 3,
     ylim = c(3,7))

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
       legend = c("Número de Imagens"),
       col = c("green"),
       x=4,
       y=7,
       lty=2,
       cex=0.58
)
