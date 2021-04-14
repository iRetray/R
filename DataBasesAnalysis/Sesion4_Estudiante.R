rm(list=ls()) 

getwd()

# Definir directorio de trabajo.
#===============================================================================



# LIIMPIEZA O PREPROCESADO DE DATOS - PARTE 1
#===============================================================================

#Es dificil que en una aplicacion real tengamos los datos tal y como 
#los necesitamos para hacer el analisis. Habitualmente tendremos que 
#trabajar los datos para arreglarlos.
#El procesado o limpieza de los datos suele ocupar entre 70-80% 
#del tiempo de un analisis de datos.


#===============================================================================
#===============================================================================
# TIDYVERSE
#===============================================================================

# Ejercicio: Consultar en R ¿Que es tidyverse?

??tidyverse

# Simplificar código y acelerar el procesamiento

# Con la palabra tidyverse se hace referencia a una nueva forma de 
# afrontar el analisis de datos en R. Se hace uso de un grupo de 
# paquetes que trabajan en armonia porque comparten ciertos principios, 
# como por ejemplo, la forma de estructurar los datos.

# Permite que los scripts deben ser "facilmente" legibles por las 
# personas.

# Sirve para resolver problemas complejos encadenando funciones simples con el 
# operador %>% (pipeline). Lo que hace este operador es pasar el elemento que 
# esta a su izquierda como un argumento de la funcion que tiene a 
# la derecha.

#Los principales packages del tidyverse son:
#readr: para importar datos
#tidyr: para convertir los datos a tidy data
#dplyr: para manipular datos
#ggplot2: para hacer graficos
#purrr: para functional programming
#Finalmente estos pkgs se han agrupado en un solo package, 
#el tidyverse package.

# Ejercicio: Cargar la libreria tidyverse


#---------------------------------------------------------------------
#---------------------------------------------------------------------

# --------------- Las funciones gather() y spread()

#Ejercicio: ¿Que son datos tidy?
#Una base de datos tidy es una base de datos en la cuál:
# Cada variable que se medida debe estar en una columna.
# Cada observación distinta de esa variable debe estar en una fila diferente.
# En general, la forma en que representaríamos una base de datos tidy en R es usando un data frame.

data_1 <- data.frame(Year = c(2014,2015,2016), 
                     Pedro = c(100,500,200),
                     Carla = c(400,600,250),
                     Maria = c(200,700,900))
data_1


data_2 <- data.frame(names = c("Pedro", "Carla", "Maria"), 
                     W_2014 = c(100, 400, 200), 
                     W_2015 = c(500, 600, 700),
                     W_2016 = c(200, 250, 900) )

data_2


data_3 <- data.frame(names = c("Pedro", "Carla", "Maria", "Pedro", "Carla", "Maria", "Pedro", "Carla", "Maria"),  
                     year = c("2014", "2014", "2014",  "2015", "2015", "2015",  "2016", "2016", "2016"), 
                     salario = c(100, 400, 200, 500, 600, 700, 200, 250,900) )

data_3
# Si son datos tidy y me permiten sacar mas provecho del tidyverse
# Datos en formato: long format. Es un formato es mas eficiente para 
# los computadores.


# Ejercicio: ¿Como puedo pasar de un formato a otro?
# Funciones gather() y spread()

# Pasar de wide a long format gather()




# Utilizaremos el operador para encadenar los pasos
# La indicacion es que tome los nombres de las columnas
# y los ubique en una sola columna y cada uno lo repita 
# tantas veces como individuos tenga, eso lo guardar en una
# en una columna que se llama periodo.
# Luego tomar las observaciones para cada individuo y la colocar en una columna 
# que se llama salario.



#¿Como quitar el W?
?mutate #adjunta nuevas variables y preserva existentes
?gsub #coincidencia de patrones y reemplazo.



# Pasar de long format a wide spread()
# La indicacion es que lo consignado en las columnas ahora sea 
# el nombre de las columnas y lo demas lo convierta en observaciones.



#Ejercicio:
# Cargue la base de datos "Indices"
# Descargue la imagen "Como quiero los datos"
# ¿Cual es la dimension de la base?
# ¿De que tipo son los datos que tiene la base? 
# Al comparar los datos de la base y la imagen ¿Los datos de la base son tidy?
# ¿Quienes son los individuos y quienes son las variables?
# Convierta los datos a "long format" de tal manera que el resultado sea
# como el de la imagen "Como quiero los datos"




#---------------------------------------------------------------------
#---------------------------------------------------------------------
# --------------- Las funciones separate() y unite()

#Ejercicio: Utilice la funcion separate() para dejar el nombre 
#y el apellido del estudiante en columnas separadas.

data_4 <- data.frame( Nombres = c("Carlos_Guzman", "Diana_Salazar", "Pedro_Vega"), 
                  Semestre  = c("I", "II", "I") )
data_4




#Ejercicio: Utilice la funcion unite() para dejar el nombre 
#y el apellido del estudiante en una misma columna pero utilizando
#el separador &.




#Ejercicio: 
#Cargue la base de datos "Estudiantes1"
#Descarge la imagen "Como quiero los estudiantes"
#Con las funciones que hemos estudiado transforme los datos de la base 
#para que se vean como los de la imagen y asegurese que el tipo de datos 
#que queden en las columnas de taller sean numericos.

E2 <- Estudiantes1  %>% separate("Taller1&Taller2", c("Taller1","Taller2"),sep="&")%>%
  separate("Estudiante", c("Nombre","Apellido"),sep=" ") %>%
  unite(Grupo_tema,7:8,sep = "_") %>%
  mutate(Taller1 = as.numeric(Taller1), 
         Taller2 = as.numeric(Taller2))
str(E2)



#Ejercicio: 
#Cargue la base de datos "Estudiantes1"
#Descarge la imagen "Como quiero la exportacion"
#Con las funciones que hemos estudiado transforme los datos de la base 
#para que se vean como los de la imagen y verifique la estructura
#de la base final.

