#Graficos boxpot dosdados comoartilhado somente na semana e os dados do fim de semana
setwd("/home/tomaz/Documentos/R\ Teste/Tomaz\ Bisneto\ /")

dados <- read.csv("OnlineNewsPopularity.csv",header = TRUE)
#str(dados)
summary(dados)
domingos <- subset(dados,dados["weekday_is_sunday"]==1.0)
segundas <- subset(dados,dados["weekday_is_monday"]==1.0)
terca <- subset(dados,dados["weekday_is_tuesday"]==1.0)
quarta <- subset(dados,dados["weekday_is_wednesday"]==1.0)
quinta <- subset(dados,dados["weekday_is_thursday"]==1.0)
sexta <- subset(dados,dados["weekday_is_friday"]==1.0)
sabado <- subset(dados,dados["weekday_is_saturday"]==1.0)
#Valores das Medias 
media_domingos = mean(domingos$shares,na.rm = TRUE)
media_segundas = mean(segundas$shares,na.rm = TRUE)
media_terca = mean(terca$shares,na.rm = TRUE)
media_quarta = mean(quarta$shares,na.rm = TRUE)
media_quinta = mean(quinta$shares,na.rm = TRUE)
media_sexta = mean(sexta$shares,na.rm = TRUE)
media_sabado = mean(sabado$shares,na.rm = TRUE)
dias_da_Semana <- c("Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sabado")
t = result
result <- c(media_domingos,media_segundas,media_terca,media_quarta,media_quinta,media_sexta,media_sabado)
a <- barplot(result,ylim = c(0,5000), main = "Valores Medios de Compartilhamentos Durante a  Semana",ylab = "Numero de Compartilhamentos",xlab = "Dias da Semana",col=c("orange","blue","red","gray","pink","yellow","black"))
axis(1, at = a, labels = dias_da_Semana )


