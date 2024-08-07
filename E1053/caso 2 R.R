library(readr)
library(tidyverse)


caso2 <- "C:/Users/FIEECS UNI/Downloads/E1053/base_env�os.csv"
data_csv <- read_csv(caso2)


summary(data_csv)
str(data_csv)


data_csv <- data_csv %>%
  mutate(
    fecha_env�o = ymd(fecha_env�o),
    fecha_entrega = as.Date(fecha_entrega, origin = "1970-01-01"),
    duraci�n_env�o = as.numeric(difftime(fecha_entrega, fecha_env�o, units = "days"))
  )


summary(data_csv)
str(data_csv)


duraci�n_promedio_por_regi�n <- data_csv %>%
  group_by(destino) %>%
  summarize(
    duraci�n_promedio = mean(duraci�n_env�o, na.rm = TRUE),
    monto_promedio = mean(monto_env�o, na.rm = TRUE),
    total_envios = n()
  )

print(duraci�n_promedio_por_regi�n)
