
# LIIMPIEZA O PREPROCESADO DE DATOS - PARTE 2
#===============================================================================

#Dentro del paquete tidyverse se encuentra la libreria dplyr
#la cual es util para para manipular datos

#Ejercicio: Intalar la libreria dplyr

library(dplyr)

#===============================================================================
#===============================================================================
# DPLYR
#===============================================================================

#dplyr es un paquete que permite manipular datos de forma intuitiva. 
#Tiene 7 funciones principales. Cada uno de ellos hace "una sola cosa"
#as? que para realizar transformaciones complejas hay que ir 
#concatenando instrucciones sencillas. 
#Esto se hace con el operador pipe (%>%)

#Todas las funciones tienen una estructura o comportamiento similar:

#el primer argumento siempre es un data.frame (df)
#los siguientes argumentos describen que hacer con los datos
#el resultado es siempre un nuevo df

#Funciones

#filter() : permite seleccionar filas (que cumplen una o varias condiciones)
#arrange(): reordena las filas.
#rename() : cambia los nombres de las columnas (variables)
#select() : selecciona columnas (variables)
#mutate() : crea nuevas variables
#summarise() : resume (colapsa) unos cuantos valores a uno s?lo. Por ejemplo, calcula la media, moda, etc. de un conjunto de valores
#group_by() : permite agrupar filas en funci?n de una o varias condiciones


#---------------------------------------------------------------------
#---------------------------------------------------------------------
# --------------- La funcion filter()

#Ejercicio:
#Cargar los datos del paquete gapminder. 
#Llame los nuevos datos Data1
#?Que tipo de informacion contiene el data.frame?
#?Cuales son los nombres de las variables?

library(gapminder)
statsData = gapminder
gapminder
?gapminder
View(statsData)



#Ejercicio: Seleccionar filas que cumplen con determinados criterios.

#Observaciones correpondientes a Colombia (country == "Colombia")
dataFilter %>% filter(country == "Colombia")

#Paises con esperanza de vida menor a 30 años.
dataFilter %>% filter(lifeExp < 30)

#Paises con esperanza de vida entre 30 y 50 años


#Paises de Europa con esperanza de vida superior o igual a 70 a?os

  
#Observaciones de paises de Africa o Asia con esperanza de vida mayor a 75 años 
 

#Ejercicio:
#slice() y top_n() tambien pueden ser muy utiles para seleccionar filas
#slice(): filtra filas por su posicion.
#top_n(): filtra filas por su ranking (segun el valor de alguna columna)


#Seleccionar las observaciones del 30 al 42.


#Seleccionar las 3 filas con MAYOR valor de esperanza de vida.
 

#Selecciona las 4 filas con MENOR valor de poblacion



#---------------------------------------------------------------------
#---------------------------------------------------------------------
# --------------- La funcion arrange()

#Ejercicio:  Reordenar las filas de un dataframe (df).

#Ordenar las filas de MENOR a MAYOR segun la esperanza de vida.


#Ordenar las filas de MAYOR a MENOR segun la esperanza de vida.
 

#Ordenar las filas de la A a la Z segun el continente.


#Ordenar las filas de la Z a la A segun el continente.


#---------------------------------------------------------------------
#---------------------------------------------------------------------
# --------------- La funci?n rename()

#Ejercicio: Cambiar los nombres de las columna "lifeExp" y "gdpPercap"
#por "EV" y "PBI"



#---------------------------------------------------------------------
#---------------------------------------------------------------------
# --------------- La funcion select()

#Seleccionar columnas (o variables si el fichero es tidy)

#Ejercicio: Seleccionar las variables "year" y "lifeExp" y 
#visualizamos las 4 primeras filas.



#¿Porque no utilizar la funcion top_n()?
#¿Cual es la diferencia entre select() y filter()?


#Ejercicio: Seleccionar todas las variables excepto "year"


#Ejercicio: Seleccionar y renombrar y ordenar la columna "pop"


#Ejercicio: Reordenar columnas, se uiere que la primera columna sea "continent"
#Utilicemos una nueva funcion everything() que es una funcion auxiliar de select




#---------------------------------------------------------------------
#---------------------------------------------------------------------
# --------------- La funcion mutate()

#Esta funcion me sirve para crear variables nuevas

#Ejercicio: Crear la variable: GDP = pop*gdpperCap




#---------------------------------------------------------------------
#---------------------------------------------------------------------
# --------------- La funcion summarise()


#Ejercicio: Calcular la media global de la esperanza de vida


#Ejercicio: Calcular la media de todas las variables del data frame
#¿Son correctos los calculos que realiza?




#---------------------------------------------------------------------
#---------------------------------------------------------------------
# --------------- La funci0n group_by()

#Permite agrupar informaci?n
#Hacer calculos por grupos.

#Ejercicio: Agrupar por continente y hacer el conteo de observaciones.



#Ejercicio:Agrupar por continente, hacer el conteo de observaciones por continente
#y contar el numero de paises por continente 



#---------------------------------------------------------------------
#---------------------------------------------------------------------
# --------------- Apliquemos lo aprendido

#Ejercicio:

#Calcular el promedio de esperanza de vida por continente.


#Calcular el promedio por continente del PBI para el a?o 2002.



#Calcular el promedio de esperanza de vida y PBI por continente y año para el 2002 y 2007.


# Por continente, para años previos a 1962, cree una nueva variable 
#"lifeExp_gain = lifeExp - first(lifeExp". El datra frame debe mostrar el continente,
# año, esperanza de vida y el calculo de la nueva variable.




