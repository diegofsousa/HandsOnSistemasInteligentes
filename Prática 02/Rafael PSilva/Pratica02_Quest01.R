newspopularity <- read.csv("C:/Users/PSILVA/Documents/Rafael PSilva/OnlineNewsPopularity.csv", sep=',')


segunda <- subset(newspopularity,  newspopularity$weekday_is_monday == 1)
terca <- subset(newspopularity,  newspopularity$weekday_is_tuesday == 1)
quarta <- subset(newspopularity,  newspopularity$weekday_is_wednesday == 1)
quinta <- subset(newspopularity,  newspopularity$weekday_is_thursday == 1)
sexta <- subset(newspopularity,  newspopularity$weekday_is_friday == 1)
sabado <- subset(newspopularity,  newspopularity$weekday_is_saturday == 1)
domingo <- subset(newspopularity,  newspopularity$weekday_is_sunday == 1)


frequencia <- c(mean(domingo$shares), mean(segunda$shares), mean(terca$shares), mean(quarta$shares), mean(quinta$shares), mean(sexta$shares), mean(sabado$shares))
dias <- c("Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sabado")


plot(frequencia, type="o",
     xaxt = "n",
     main="Compartilhamento por Dia da Semana",
     xlab = "Dias da Semana", ylab = "Compartilhamentos",
     col="blue",
     lty = 5,
     pch=5)

axis(1, labels = dias, seq(7))