library(readxl)
library(rio)
setwd("C:/Users/DELL/Desktop/Boletines")

Lenguaje <- read_excel("libro virtual de clases 1° BASICO.xlsx", 
                       sheet = "LENGUAJE")
Ingles <- read_excel("libro virtual de clases 1° BASICO.xlsx", 
                     sheet = "INGLES")
Matematicas <- read_excel("libro virtual de clases 1° BASICO.xlsx", 
                          sheet = "MATEMATICA")
Historia <- read_excel("libro virtual de clases 1° BASICO.xlsx", 
                       sheet = "HISTORIA")
CS <- read_excel("libro virtual de clases 1° BASICO.xlsx", 
                 sheet = "CIENCIAS NATURALES")
AV <- read_excel("libro virtual de clases 1° BASICO.xlsx", 
                 sheet = "ARTES VISUALES")
Musica <- read_excel("libro virtual de clases 1° BASICO.xlsx", 
                     sheet = "MUSICA")
Tec <- read_excel("libro virtual de clases 1° BASICO.xlsx", 
                  sheet = "ED. TECNOLOGICA")
EFI <- read_excel("libro virtual de clases 1° BASICO.xlsx", 
                  sheet = "EDUCACIÓN FISICA")
orientacion <- read_excel("libro virtual de clases 1° BASICO.xlsx", 
                          sheet = "ORIENTACION")
limpieza <- function(BD){
  BD <- as.data.frame(BD)
  BD <- BD[3:23,2:15]
  #Pusieron otra nota, ni idea porque pero vacio igual
  BD <- BD[2:nrow(BD),]
  #prom <- BD[,14]
  for(i in 1:nrow(BD)){
    BD[i,14] <- round(as.numeric(BD[i,14]),1)
  }
  return(BD)
}
Lenguaje <- limpieza(Lenguaje)
Ingles <- limpieza(Ingles)
Matematicas <- limpieza(Matematicas)
Historia <- limpieza(Historia)
CS <- limpieza(CS)
AV <- limpieza(AV)
Musica <- limpieza(Musica)
Tec <- limpieza(Tec)
EFI <- limpieza(EFI)
orientacion <- orientacion[4:23,2:15]

BD <- rbind(Lenguaje,Ingles,Matematicas,Historia,CS,AV,Musica,Tec,EFI,orientacion)
colnames(BD) <- c("Rut", "Nombre","Nota1", "Nota2","Nota3","Nota4","Nota5","Nota6","Nota7","Nota8",
                  "Nota9","Nota10","Espacio","Promedio")
prom_f <- c()
n_alumnos <- nrow(BD)/10
for(i in 1:n_alumnos){
  prom <- c()
  prom <- c(as.numeric(Lenguaje[i,14]),as.numeric(Matematicas[i,14]),as.numeric(Historia[i,14]),
            as.numeric(CS[i,14]),as.numeric(AV[i,14]),as.numeric(Musica[i,14]),as.numeric(Tec[i,14]),
            as.numeric(EFI[i,14]))
  va <- round(mean(prom),1)
  prom_f <- c(prom_f, va)
}

BD <- cbind(BD,prom_f)


write.csv(BD,"data.csv")

