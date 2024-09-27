setwd("C:/Users/Entrar/Desktop/Data_Labs_R")
pacientes<-read.table("pacientes.txt",sep = "\t", header=T)
ingresos<-read.table("ingresos.txt",sep = "\t", header = T)

dim(pacientes)
dim(ingresos)

names(pacientes)
names(ingresos)

str(pacientes)
str(ingresos)

if (!is.factor(pacientes$sexo)) {
  pacientes$sexo <- as.factor(pacientes$sexo)
}

head(pacientes)
head(ingresos)
tail(pacientes)
tail(ingresos)

pacientes[c(3,7) , c("nombre", "sexo", "peso", "altura")]

peso_max <- max(pacientes$peso, na.rm = TRUE)
peso_min <- min(pacientes$peso, na.rm = TRUE)
pacientes[pacientes$peso == peso_max, "NHC"]
pacientes[pacientes$peso == peso_min, "NHC"]

pacientes$IMC/((pacientes$altura)/100)**2

library(lubridate)
duracion <- interval ( dmy(pacientes$fechnac), as.Date(now()) )
Periodo_tiempo <- as.period (duracion)
edad <- year (Periodo_tiempo)
edad

pacientes_menores_40 <- subset(pacientes, "edad"<40)
pacientes_menores_40$nombre

ingresos$T_ingreso <- as.numeric(difftime(ymd(ingresos$fecha_alta), ymd(ingresos$fecha_ingreso), units = "days"))

format(ymd(ingresos$fecha_ingreso[5]), "%A")  # Día de la semana para el 5º ingreso
format(ymd(ingresos$fecha_ingreso[8]), "%A")

union_df <- merge(pacientes, ingresos, by = "NHC")
head(union_df)

servicio_peso_max <- union_df[union_df$peso == peso_max, "servicio"]
servicio_peso_min <- union_df[union_df$peso == peso_min, "servicio"]
servicio_peso_max
servicio_peso_min

nuevo_registro <- data.frame(NHC = 9999, nombre = "Nuevo Paciente", sexo = "F", peso = 70, altura = 165, 
                             fecha_nacimiento = "1985-06-15", IMC = 25.7, Edad = 39, 
                             fecha_ingreso = "2024-01-15", fecha_alta = "2024-01-25", 
                             servicio = "Cardiología", T_ingreso = 10)
union_df <- rbind(union_df, nuevo_registro)

tail(union_df)



