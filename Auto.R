library(rmarkdown)
library(readxl)

# Leer la base de datos
setwd("C:/Users/DELL/Desktop/Boletines")
Lenguaje <- read_excel("libro virtual de clases 1° BASICO.xlsx")
Lenguaje <- Lenguaje[4:23,]

# Crear un bucle for para generar el informe para cada observación
for (i in 1:20) {
  # Obtener la observación específica
  observacion <- Lenguaje[i, ]
  
  # Generar el informe para la observación
  output_file <- paste0("Informe_", observacion[1,3], ".pdf")
  rmarkdown::render("Pruerba.Rmd", output_file = output_file,
                    params = list(observacion = observacion))
}
