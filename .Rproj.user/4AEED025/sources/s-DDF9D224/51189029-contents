library(data.table)
library("tidyr")
library("stringr")
require("sqldf")

cidade <- read.csv("data/cities.csv",encoding="UTF-8", header=FALSE, stringsAsFactors=FALSE)
names(cidade) <- c("id","nome","uf")

uf <- read.csv("data/states.csv",encoding="UTF-8", header=FALSE, stringsAsFactors=FALSE)
names(uf) <- c("Id","nome","uf")

cep <- read.csv("data/es.cepaberto_parte_1.csv", encoding="UTF-8", header=FALSE, stringsAsFactors=FALSE)
cep <- rbind(cep,read.csv("data/es.cepaberto_parte_2.csv", encoding="UTF-8", header=FALSE, stringsAsFactors=FALSE))
cep <- rbind(cep,read.csv("data/es.cepaberto_parte_3.csv", encoding="UTF-8", header=FALSE, stringsAsFactors=FALSE))
cep <- rbind(cep,read.csv("data/es.cepaberto_parte_4.csv", encoding="UTF-8", header=FALSE, stringsAsFactors=FALSE))
cep <- rbind(cep,read.csv("data/es.cepaberto_parte_5.csv", encoding="UTF-8", header=FALSE, stringsAsFactors=FALSE))
names(cep) <- c("cep","logradouro","bairro","cidade","uf")


sqldf("select * from cep where cidade LIKE 'serra'")
sqldf("select * from cep where cep LIKE 29180263")

