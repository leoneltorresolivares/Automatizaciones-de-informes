library(rmarkdown)
library(readxl)
# Cambiar directorio en caso de ser necesario, esta lleno de eso en la Ficha.rmd, ir cambiando
setwd("C:/Users/DELL/Desktop/Fichas")

# NO TOCA EL RESTO, SOLO LO QUE ESTA ABAJO

# Cambira el codigo ACA para elegir el programa que se necesite, debe ser con codigo demre

nuevo_codigo_demre <- 35011 #CODIGO DEMRE DEL PROGRAMA
periodo_false <- 2021 #CAMBIAR PERIODO ACA!!! SE PONE EL AÑO BASEEEEE

# NO TOCA EL RESTO, SOLO LO QUE ESTA ARRIBA

periodo <- periodo_false - 4 #Se le resta 4 por la cantidad de años, 2022 - 4 deja hasta 2018 (por la ficha)

# Primer ciclo
# Asegurarse que los periodos coincidan para los calculos, no asumir que estan ordenados (Cita de Gonzalo, si se pasa uno deja la cagá)
# Cuando se toman periodos inferiores a los de las bases no los reconoce pero no coloca bien los años
rmarkdown::render("Ficha.rmd", output_format = "pdf_document", output_file = paste0("Primer_Ciclo_", nuevo_codigo_demre, ".pdf"), params = list(codigo_demre = nuevo_codigo_demre, periodo = periodo))

# Segundo ciclo
# Hay problemas con el periodo de 2020, hay programas que no calzan con el IPA, poca diferencia pero hay
# Hay problemas con el periodo 2016, sin embargo, cuando hay problemas en un periodo no hay en el otro, la diferencia sigue siendo poca, decimas
# Si se toma un periodo que no este en la base de datos sale toda la tabla con 0
#rmarkdown::render("retencion.rmd", output_format = "pdf_document", output_file = paste0("Segundo_Ciclo_", nuevo_codigo_demre, ".pdf"), params = list(codigo_demre = nuevo_codigo_demre, periodo = periodo))

# Tercer ciclo
# Faltan los datos
#rmarkdown::render("Titulacion.rmd", output_format = "pdf_document", output_file = paste0("Tercer_Ciclo_", nuevo_codigo_demre, ".pdf"), params = list(codigo_demre = nuevo_codigo_demre, periodo = periodo)))










