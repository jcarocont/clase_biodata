# Cargamos el dataset iris en un nuevo data frame llamado df
df <- iris

# Mostramos las primeras 6 filas del dataset
head(df)

# Mostramos un resumen estadístico de todas las variables del dataset
summary(df)

# Imprimimos todas las especies registradas en el dataset
print(df$Species)

# Imprimimos las especies únicas (distintas)
print(unique(df$Species))

# Guardamos los nombres únicos de especies en una variable
species_name <- unique(df$Species)

# Creamos una lista vacía donde guardaremos los primeros registros por especie
newlist <- list()

# Recorremos cada especie
for (i in species_name){
  # Filtramos el dataset solo con las filas de esa especie
  iterdf <- df[df$Species == i, ]
  
  # Guardamos las primeras 6 filas de esa especie en la lista
  newlist[[(i)]] <- head(iterdf)
}

# Creamos un nuevo data frame vacío para guardar resultados
# Tendrá columnas: especie, máximo y promedio del ancho del pétalo
bypop <- data.frame(
  species = character(),          # Columna para el nombre de la especie
  max_petalwidth = double(),     # Columna para el valor máximo del ancho del pétalo
  mean_petalwidth = double(),    # Columna para el valor promedio del ancho del pétalo
  stringsAsFactors = FALSE       # Evitamos que R convierta texto en factores automáticamente
)

# Recorremos nuevamente cada especie
for (i in species_name){
  # Accedemos a las primeras 6 filas guardadas para esa especie
  datadf <- newlist[[(i)]]
  
  # Calculamos el valor máximo del ancho del pétalo para esas filas
  max_val <- max(datadf$Petal.Width)
  
  # Calculamos el promedio del ancho del pétalo para esas filas
  mean_val <- mean(datadf$Petal.Width)
  
  # Añadimos una nueva fila al data frame 'bypop' con los resultados
  bypop <- rbind(
    bypop,
    data.frame(
      species = (i),
      max_petalwidth = max_val,
      mean_petalwidth = mean_val
    )
  )
}

# Imprimimos el resumen final por especie (máximo y promedio de Petal.Width)
print(bypop)



