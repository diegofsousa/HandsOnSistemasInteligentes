DataSet <- read.csv("~/R/Atividades em R(SI)/OnlineNewsPopularity.csv")

                #MEDIA DE COMPARTILHAMENTO DE NOTICIAS
#DOMINGOS
todosDomingos<-DataSet[DataSet$week_day_is_monday==1,]   #Domingo
View(todosDomingos)
mediasDomingos <-mean(todosDomingos$shares)

#SEGUNDA-FEIRA
todasSegundas<-DataSet[DataSet$week_day_is_monday==1,]   #Segunda
mediasSegundas <-mean(todasSegundas$shares)

#TERCA-FEIRA
todasTercas<-DataSet[DataSet$week_day_is_monday==1,]    #Terca
mediasTercas <-mean(todasTercas$shares)

#QUARTA-FEIRA
todasQuartas<-DataSet[DataSet$week_day_is_monday==1,] #Quarta
mediasQuartas <-mean(todasQuartas$shares)

#QUINTA-FEIRA
todasQuintas<-DataSet[DataSet$week_day_is_monday==1,] #Quinta
mediasQuintas <-mean(todasQuintas$shares)

#SEXTA-FEIRA
todasSextas<-DataSet[DataSet$week_day_is_monday==1,]    #Sexta
mediasSextas <-mean(todasSextas$shares)

#SABADO
todosSabados<-DataSet[DataSet$week_day_is_monday==1,] #Sabado
mediasSabados <-mean(todosSabados$shares)

mediasDiasSemanas <-c(mediasDomingos,mediasSegundas,mediasTercas,mediasQuartas,mediasQuintas,mediasSextas,mediasSabados)
View(mediasDiasSemanas)
diasSemana <-c("Domingo","Segunda","Terca","Quarta","Quinta","Sexta","Sabado")

plot(mediasDiasSemanas,diasSemana)

plot(mediasDiasSemanas,type="o",col="blue",xaxt = "n",xlab=diasSemana,ylab="Quantidade de Compartilhamento")
axis(1, at=1:7,labels=letters[1:7])
















                        #MEDIA DE TAXAS DE PALAVRAS POSITIVAS E NEGATIVAS
#DOMINGOS
todosDomingos <-DataSet$weekday_is_sunday==1   #Domingo
View(todosDomingos)
taxasDomingos <-mean(todosDomingos)

#SEGUNDA-FEIRA
todasSegundas <-DataSet$weekday_is_monday==1   #Segunda
mediasSegundas <-mean(todasSegundas)

#TERCA-FEIRA
todasTercas <-DataSet$weekday_is_tuesday==1    #Terca
mediasTercas <-mean(todasTercas)

#QUARTA-FEIRA
todasQuartas <-DataSet$weekday_is_wednesday==1 #Quarta
mediasQuartas <-mean(todasQuartas)

#QUINTA-FEIRA
todasQuintas <-DataSet$weekday_is_thursday==1 #Quinta
mediasQuintas <-mean(todasQuintas)

#SEXTA-FEIRA
todasSextas <-DataSet$weekday_is_friday==1    #Sexta
mediasSextas <-mean(todasQuintas)

#SABADO
todosSabados <-DataSet$weekday_is_saturday==1 #Sabado
mediasSabados <-mean(todosSabados)