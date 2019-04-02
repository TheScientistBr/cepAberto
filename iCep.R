library(data.table)
library("dplyr")
library("stringr")
require("sqldf")

cidade <- read.csv("data/cities.csv",encoding="UTF-8", header=FALSE, stringsAsFactors=FALSE)
names(cidade) <- c("id_cidade","nome","uf")

uf <- read.csv("data/states.csv",encoding="UTF-8", header=FALSE, stringsAsFactors=FALSE)
names(uf) <- c("id_uf","nome","uf")

cep <- read.csv("data/es.cepaberto_parte_1.csv", encoding="UTF-8", header=FALSE, stringsAsFactors=FALSE)
cep <- rbind(cep,read.csv("data/es.cepaberto_parte_2.csv", encoding="UTF-8", header=FALSE, stringsAsFactors=FALSE))
cep <- rbind(cep,read.csv("data/es.cepaberto_parte_3.csv", encoding="UTF-8", header=FALSE, stringsAsFactors=FALSE))
cep <- rbind(cep,read.csv("data/es.cepaberto_parte_4.csv", encoding="UTF-8", header=FALSE, stringsAsFactors=FALSE))
cep <- rbind(cep,read.csv("data/es.cepaberto_parte_5.csv", encoding="UTF-8", header=FALSE, stringsAsFactors=FALSE))
names(cep) <- c("cep","logradouro","bairro","id_cidade","id_uf")

cep <- left_join(cep, cidade, by = "id_cidade")
cep <- cep[-4]
cep <- cep[-6]
cep <- left_join(cep, uf, by = "id_uf")
cep <- cep[-4]
names(cep) <- c("cep","logradouro","bairro","cidade","estado","uf")

head(cep)


sqldf("select * from cep where cep LIKE 29165827")
nome <- "'%marataízes%'"
texto <- "select * from cep where logradouro LIKE"
string <- paste(texto,tolower(nome))
sqldf(string)

sqldf("select * from cep where logradouro LIKE '%MÁRIO BATALHA%'")
