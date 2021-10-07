
# Taller análisis de ítems y fiabilidad -----------------------------------


# 1. Cargar librerías -----------------------------------------------------

if (!require("pacman")) install.packages("pacman")

pacman::p_load(tidyverse,
               haven,
               dplyr,
               psych)

# 2. Cargar datos ---------------------------------------------------------

datos <- read_sav("input/Base_SPSS_371.sav")

# 3. Crear objetos para cada escala ---------------------------------------

#Conducta prosocial
prosoc <- datos %>% select(i20, i17, i9, i4, i1)

#Dificultades (total)
dificultades <- datos %>% select(-c(1, i20, i17, i9, i4, i1, 27:32))

# 4. Calcular alfa de Chronbach para prosocial y dificultades -------------

alpha(prosoc)

alpha(dificultades)

# 4.1. Eliminar ítem i11 --------------------------------------------------

dificultades_proc <- select(dificultades, -i11)
alpha(dificultades_proc)

# 5. Alfa ordinal ---------------------------------------------------------

jogRu::ordinal_alpha(dificultades)

jogRu::ordinal_alpha(prosoc)
