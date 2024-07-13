library(readr)
library(dplyr)
library(tidyverse)

caso8 <- "C:/Users/FIEECS UNI/Downloads/E1053/base_transacciones.csv"
transacciones <- read_csv(caso8)

transacciones <- transacciones %>%
  mutate(fecha_transaccion = as.Date(fecha_transaccion, format = "%Y-%m-%d"))

transacciones <- transacciones %>%
  arrange(id_cliente, fecha_transaccion) %>%
  group_by(id_cliente) %>%
  mutate(dias_desde_ultima_transaccion = as.numeric(difftime(max(fecha_transaccion), fecha_transaccion, units = "days")))

transacciones_completadas <- transacciones %>%
  filter(estado_transaccion == 'Completada')


promedio_monto <- transacciones %>%
  summarise(promedio_monto = mean(monto, na.rm = TRUE)) %>%
  pull(promedio_monto)

desviacion_estandar_monto <- transacciones %>%
  summarise(desviacion_estandar_monto = sd(monto, na.rm = TRUE)) %>%
  pull(desviacion_estandar_monto)

u_anormalidad <- promedio_monto + 3 * desviacion_estandar_monto

transacciones_anormales <- transacciones %>%
  filter(monto > umbral_anormalidad)


print(transacciones_completadas)
#no compila :v
print(transacciones_anormales)


