da = read.csv('/home/douglas/HandsOnSistemasInteligentes/Prática 02/OnlineNewsPopularity/OnlineNewsPopularity.csv')
print(da[[1]])
da[[49]]

domingo<-subset(da[[49]], da[[32]]==1)
segunda<-subset(da[[49]], da[[33]]==1)
terca<-subset(da[[49]], da[[34]]==1)
quarta<-subset(da[[49]], da[[35]]==1)
quinta<-subset(da[[49]], da[[36]]==1)
sexta<-subset(da[[49]], da[[37]]==1)
sabado<-subset(da[[49]], da[[38]]==1)

domingo2<-subset(da[[50]], da[[32]]==1)
segunda2<-subset(da[[50]], da[[33]]==1)
terca2<-subset(da[[50]], da[[34]]==1)
quarta2<-subset(da[[50]], da[[35]]==1)
quinta2<-subset(da[[50]], da[[36]]==1)
sexta2<-subset(da[[50]], da[[37]]==1)
sabado2<-subset(da[[50]], da[[38]]==1)

profit <- c(mean(domingo),mean(segunda),mean(terca),mean(quarta),mean(quinta),mean(sexta),mean(sabado))
profit2 <- c(mean(domingo2),mean(segunda2),mean(terca2),mean(quarta2),mean(quinta2),mean(sexta2),mean(sabado2))

plot(profit~profit2, type="b",
     main = "Média de Compartilhamento por Dias na Semana",
     xlab="Dias da Semana(Domingo=1...Sábado=7)", ylab = "Média de Compartilhamento",
     col=3, lty=2,tyx=1)

legend("topright", legend="média dos dias", lty=2, col=3)

