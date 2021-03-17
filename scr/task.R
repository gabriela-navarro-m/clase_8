#==============================================================================#
# Autor(es): Eduard Martinez
# Colaboradores: 
# Fecha creacion: 17/03/2019
# Fecha modificacion: 17/03/2021
# Version de R: 4.0.3.
#==============================================================================#

# intial configuration
rm(list = ls()) # limpia el entorno de R
pacman::p_load(tidyverse,data.table,readxl) # cargar y/o instalar paquetes a usar

#----------------------------------#
# Importar archivos usando un loop #
#----------------------------------#

# crear vector con ruta de objetos a cargar
list.files(path = "data/input/" , full.names = T)
files = list.files(path = "data/input/" , full.names = T) #vector de nombres y ruta a archivos
#list.files(".") # el punto es para indicar que es en directorio de trabajo en el que esta
#list.files("data/input/") #para tener vector que contenga nombres de archivos que quiero importar para iterarlo en el loop

# lista para almacenar bases de datos
lista_data = list() #crear lista que son vectores donde se puede almacenar muchos tipos de cosas- se va a almacenar la base de datos en cada espacio
lista_data

# Loop
conteo = 1 # Para contar numero iterraciones
for (i in files){
     lista_data[[conteo]] = read_excel(path = i) #en primera posicion que lea el elemento y sobreescriba conteo +1 para que pase a siguiente archivo y así los va guardando 
     conteo = conteo + 1
}

# exportar lista
saveRDS(lista_data,"data/output/lista siedco.rds")

#----------------------------------#
# Importar archivos usando un loop #
#----------------------------------#

# Importar archivo "lista siedco.rds" de data/output
ldata= readRDS("data/output/lista siedco.rds")

# Verificar visualmente los datos- desde la posicion 9 son los datos irrelevantes
ldata[[1]]
ldata[[10]]
df1=ldata[[1]]
df10=ldata[[10]]
# Limpiar una base de datos- filtrar las 8 lineas iniciales y las ultimas- cambiar nombre de variables
#crear funcion que aplique para una 
df_i=ldata[[4]] #cualquier posicion y aqui empiezan desde la 8 en vez de 9- si se hubiera eliminado con todas se pierden nombre de variables
df_i=subset(df_i, is.na(...2)==F) #dejar todas que no tengan NA
#cambiar nombres a las de primera fila
colnames(df_i)=df_i[1,]
df_i=df_i[-1,]

# Generalizar el paso anterior en una funcion
f_clean= function(i){
        df_i=ldata[[i]] #cualquier posicion y aqui empiezan desde la 8 en vez de 9- si se hubiera eliminado con todas se pierden nombre de variables
        df_i=subset(df_i, is.na(...2)==F) #dejar todas que no tengan NA
        #cambiar nombres a las de primera fila
        colnames(df_i)=df_i[1,]
        df_i=df_i[-1,]
  return(df_i)
}

#aplicar funcion
data= lapply(1:14, function(x) f_clean(i=x)) 
dataframe= rbindlist(l=data, use.names= ,fill=T) #apila los elementos de una lista en un solo dataframe




