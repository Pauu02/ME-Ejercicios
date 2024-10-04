generarNumerosAleatorios <- function() {
  suma <- 0
  contador <- 0
  
  while (suma <= 3) {
    numeroAleatorio <- runif(1)  
    suma <- suma + numeroAleatorio
    contador <- contador + 1
  }
  
  return(contador)
}

resultado <- generarNumerosAleatorios()
print(resultado)

if (!require(tidyverse)) install.packages("tidyverse")

url <- "https://data.un.org/_Docs/SYB/CSV/SYB65_1_202209_Population,%20Surface%20Area%20and%20Density.csv"

UN1 <- read.table(url, header=TRUE, sep ="", dec =".", na.string="NA", quote = "\"")

UN2 <- read.csv(url, header=TRUE, sep ="", dec =".", na.string="NA")

UN3 <- read_csv(url, header=TRUE, sep ="", dec =".", na.string="NA")












as.numeric(gsub("[$|,]","", nombre))
