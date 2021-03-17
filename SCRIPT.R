pacman:: p_load(tidyverse, data.table)
#FUNCIÓN
#nombre (nombre que se asigna a objeto), insumos que es function(argumentos){ cuerpo} y cuerpo de función (todo lo contenido en las {}, las acciones que quiere que ejecute la funcion)- está el de return para ver que devuelva que no es necesario 
#cada accion que ejecute deberia escribirlo en linea independiente a menos de usar %>% o ; 
f_caracter <- function(caracter){ 
  resultado = toupper(caracter) %>% 
    trimws()
  return(resultado)
}
#para crear cadena de caracteres en mayuscula toupper y despues eliminar espacios adicionales que queden trimws y ya retornar el resultado
#se crea objeto f caracter como funcion - temporal no es que sea de paquete de R porque si se borra el entorno con rm(list=ls()) se muere
f_caracter(caracter = " hola                 ")
f_caracter(caracter = " Buenos Dias ")
f_caracter(caracter = 2) #como no se definio que tenian que ser string entonces x

#es como loop- escribe numero y donde se escriba se reemplaza por el que se esciba o sea que sobre escriba el elemento numero como raiz cuadrada del mismo y lo pinte sobre consola- no se definio que lo retornara sino que print y como es la ultima linea de funcion es lo que va a retornar
funcion_rc <- function(numero){
  numero = sqrt(numero)  
  print(numero)
}
funcion_rc(25)
funcion_rc(-100) #porque no se ajusto numero y como la respuesta no es definida pues ni modo

#Depurar errores de funciones- cuando aparece warning es que algo se esta haciendo mal pero continuan ejecutando funcion - en el caso de error en la funcion ya no lo ejecuta/ se detiene
#misma funcion que antes pero cuerpo diferente- usar if de clase 7: si es mayor a cero para en el primer if
funcion_rc <- function(numero){
  # Si es mayor o igual a cero aplicar la raiz cuadrada
  if (numero >= 0){
    resultado <- sqrt(numero)  
    return(resultado)
  }  
  # Si es menor a cero - primero convertirlo en valor absoluto y luego si retornar la raiz - paste0 es para concatenar dos cadenas de caracteres
  if (numero < 0){
    warning(paste0("Advertencia! se reporta raíz(|",numero,"|)"))
    numero <- abs(numero) %>% sqrt(.)  
    return(numero)
  }
}
funcion_rc(-100)

#argumento palabra y mira si palabra es caracter si si entonces lo pasa a mayuscula y sin espacios y retorna, si no entonces envia mensaje de error escrita y lo pare 
funcion_palabra <- function(palabra){
  # Si es un carácter
  if (is.character(palabra) == TRUE){
    resultado = toupper(palabra) %>% 
      trimws()
    return(resultado)
  }  
  # Si no es un caracter
  if (is.character(palabra) == FALSE){
    stop(paste(palabra," no es una cadena de caracteres")) #no se ejecuto la funcion
  }
}
funcion_palabra("hola")
funcion_palabra(palabra=NA)

#traceback muestra funciones que se ejecutaron antes de que salga error 
traceback()
#debug sirve para ver que parte del cuerpo de la funcion es la que hace que hace que salga error 
debug(funcion_palabra(palabra=100))
#recover es para parar funcion justo cuando salga error