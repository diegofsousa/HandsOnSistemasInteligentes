
da = read.csv('/home/douglas/HandsOnSistemasInteligentes/Prática 02/OnlineNewsPopularity/OnlineNewsPopularity.csv')

domingo<-subset(da[[61]], da[[32]]==1)


segunda<-subset(da[[61]], da[[33]]==1)
terca<-subset(da[[61]], da[[34]]==1)
quarta<-subset(da[[61]], da[[35]]==1)
quinta<-subset(da[[61]], da[[36]]==1)
sexta<-subset(da[[61]], da[[37]]==1)
sabado<-subset(da[[61]], da[[38]]==1)

days <- c("domingo","segunda","terca","quarta","quinta","sexta","sabado")

profit <- c(mean(domingo),mean(segunda),mean(terca),mean(quarta),mean(quinta),mean(sexta),mean(sabado))

plot(profit, type="b",
     main = "Média de Compartilhamento por Dias na Semana",
     xlab="Dias da Semana(Domingo=1...Sábado=7)", ylab = "Média de Compartilhamento",
     col="green", lty=2)

legend("topleft", legend="média dos dias", lty=2, col=3)
axis(days, xaxp = c(2, 9, 7))
