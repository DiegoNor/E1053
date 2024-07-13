library(readr)
library(tidyverse)

caso4 <- "C:/Users/FIEECS UNI/Downloads/E1053/base_polizas.csv"

polizas <- read_csv(caso4)


polizas <- polizas %>%
  mutate(fecha_inicio = as.Date(fecha_inicio, format = "%Y-%m-%d"),
         fecha_fin = as.Date(fecha_fin, format = "%Y-%m-%d"))


polizas <- polizas %>%
  mutate(antiguedad = as.numeric(difftime(Sys.Date(), fecha_inicio, units = "days")) / 365.25)


polizas_activas <- polizas %>%
  filter(is.na(fecha_fin) & estado == 'Activa')

print(polizas_activas)
