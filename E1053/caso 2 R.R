library(readr)
library(tidyverse)


caso2 <- "C:/Users/FIEECS UNI/Downloads/E1053/base_envíos.csv"
data_csv <- read_csv(caso2)


summary(data_csv)
str(data_csv)


data_csv <- data_csv %>%
  mutate(
    fecha_envío = ymd(fecha_envío),
    fecha_entrega = as.Date(fecha_entrega, origin = "1970-01-01"),
    duración_envío = as.numeric(difftime(fecha_entrega, fecha_envío, units = "days"))
  )


summary(data_csv)
str(data_csv)


duración_promedio_por_región <- data_csv %>%
  group_by(destino) %>%
  summarize(
    duración_promedio = mean(duración_envío, na.rm = TRUE),
    monto_promedio = mean(monto_envío, na.rm = TRUE),
    total_envios = n()
  )

print(duración_promedio_por_región)
