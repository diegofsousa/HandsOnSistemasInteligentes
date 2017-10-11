
#Calculando a média das taxas negativas globais de cada dia
taxaNegativaSegundaG <- mean(monday[["global_rate_negative_words"]]) 
taxaNegativaTerçaG <- mean(tuesday[["global_rate_negative_words"]]) 
taxaNegativaQuartaG <- mean(wednesday[["global_rate_negative_words"]]) 
taxaNegativaQuintaG <- mean(thursday[["global_rate_negative_words"]]) 
taxaNegativaSextaG <- mean(friday[["global_rate_negative_words"]]) 
taxaNegativaSabadoG <- mean(saturday[["global_rate_negative_words"]]) 
taxaNegativaDomingoG <- mean(sunday[["global_rate_negative_words"]]) 

#Calculando a média das taxas positivas globais de cada dia
taxaPositivaSegundaG <- mean(monday[["global_rate_positive_words"]]) 
taxaPositivaTerçaG <- mean(tuesday[["global_rate_positive_words"]]) 
taxaPositivaQuartaG <- mean(wednesday[["global_rate_positive_words"]]) 
taxaPositivaQuintaG <- mean(thursday[["global_rate_positive_words"]]) 
taxaPositivaSextaG <- mean(friday[["global_rate_positive_words"]]) 
taxaPositivaSabadoG <- mean(saturday[["global_rate_positive_words"]]) 
taxaPositivaDomingoG <- mean(sunday[["global_rate_positive_words"]]) 

#Calculando a média das taxas negativas  de cada dia
taxaNegativaSegunda <- mean(monday[["rate_negative_words"]]) 
taxaNegativaTerça <- mean(tuesday[["rate_negative_words"]]) 
taxaNegativaQuarta <- mean(wednesday[["rate_negative_words"]]) 
taxaNegativaQuinta <- mean(thursday[["rate_negative_words"]]) 
taxaNegativaSexta <- mean(friday[["rate_negative_words"]]) 
taxaNegativaSabado <- mean(saturday[["rate_negative_words"]]) 
taxaNegativaDomingo <- mean(sunday[["rate_negative_words"]])

#Calculando a média das taxas positivas de cada dia
taxaPositivaSegunda <- mean(monday[["rate_positive_words"]]) 
taxaPositivaTerça <- mean(tuesday[["rate_positive_words"]]) 
taxaPositivaQuarta <- mean(wednesday[["rate_positive_words"]]) 
taxaPositivaQuinta <- mean(thursday[["rate_positive_words"]]) 
taxaPositivaSexta <- mean(friday[["rate_positive_words"]]) 
taxaPositivaSabado <- mean(saturday[["rate_positive_words"]]) 
taxaPositivaDomingo <- mean(sunday[["rate_positive_words"]]) 


taxa_negativa <- c(taxaNegativaSegunda,taxaNegativaTerça,taxaNegativaQuarta,taxaNegativaQuinta,taxaNegativaSexta,taxaNegativaSabado,taxaNegativaDomingo )
taxa_positiva <- c(taxaPositivaSegunda,taxaPositivaTerça,taxaPositivaQuarta,taxaPositivaQuinta,taxaPositivaSexta,taxaPositivaSabado,taxaPositivaDomingo )

plot(medias,type='o',col='blue',axes="False",lty=2, main = "Compartilhamento de Dias da Semana",ylab="Quantidade de Compartilahmentos",xlab = "Dias da Semana",sub="Visualização de Dados com R")
axis(1, at=1:7, lab=c("Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado","Domingo"))
axis(2, las=1, at=shares)
box()
legend("topleft",cex =0.56, title="Legenda","Média de Compartilhamento", lty=2, col= "blue")

