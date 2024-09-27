setwd("C:/Users/Entrar/Desktop/Data_Labs_R")
pacientes<-read.table("pacientes.txt",sep = "\t", header=T)
ingresos<-read.table("ingresos.txt",sep = "\t", header = T)

dim(pacientes)
dim(ingresos)

names(pacientes)
names(ingresos)

str(pacientes)
str(ingresos)

head(pacientes)
head(ingresos)
tail(pacientes)
tail(ingresos)

pacientes[c(3,7) , c("nombre", "sexo", "peso", "altura")]

min(pacientes$peso)
max(pacientes$peso)
which.min(pacientes$peso)
which.max(pacientes$peso)

IMC<-pacientes$peso/((pacientes$altura)/100)**2


library(lubridate)
duracion <- interval ( dmy(pacientes$fechnac), as.Date(now()) )
Periodo_tiempo <- as.period (duracion)
edad <- year (Periodo_tiempo)
edad

subset(pacientes, "edad">40)

T_ingreso

format()

merge()

rbind()


