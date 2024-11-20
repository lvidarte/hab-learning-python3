# Clase 9: Manejo de errores y excepciones

## Módulo 1: Manejo básico de excepciones

### 1. Introducción

Los errores en Python pueden ocurrir debido a diversas razones, como problemas de sintaxis, referencias a variables no definidas o errores de tipo. Para manejar estos errores, se utilizan excepciones.

#### a. Uso de bloques try y except

El manejo de excepciones se realiza mediante los bloques `try` y `except`. El código que puede generar un error se coloca en el bloque `try`, y las acciones que se deben tomar en caso de un error se definen en el bloque `except`.


```python
try:
    numero = int(input('Ingresa un número'))
    print("El número es:", numero)
except ValueError:
    print("¡Error! no es un número válido.")
```

    El número es: 5


#### b. Manejo de múltiples excepciones

Puedes manejar múltiples tipos de excepciones utilizando varios bloques `except`.


```python
try:
    resultado = 10 / int(input('Ingresa un número'))
    print("Resultado de la división:", resultado)
except ValueError:
    print("¡Error! Debes ingresar un número.")
except ZeroDivisionError:
    print("¡Error! No se puede dividir entre cero.")
```

    ¡Error! Debes ingresar un número.


#### c. Ejercicio práctico

Se tiene una lista con tres elementos: `[1, 2, 3]`. Solicita al usuario que ingrese un número entero. El programa debe intentar realizar dos operaciones con el número proporcionado:

1. Convertir el valor ingresado en un número entero.
2. Acceder a un índice de la lista usando el número proporcionado.

**Requisitos**:

- Si el usuario ingresa un valor que no pueda ser convertido a un número entero (por ejemplo, una cadena de texto), el programa debe capturar el error y mostrar el mensaje:  
  `"Error: Debes introducir un número entero."`

- Si el número ingresado es un índice fuera del rango de la lista (por ejemplo, si el número es 5), el programa debe capturar el error y mostrar el mensaje:  
  `"Error: El índice proporcionado está fuera del rango de la lista."`

- Si ocurre cualquier otro error inesperado, el programa debe capturar el error y mostrar un mensaje genérico indicando que ocurrió un error, sin especificar detalles del tipo de error. El mensaje debe ser:  
  `"Se ha producido un error inesperado: {mensaje del error}"`


```python

```

### 2. Bloque finally

El bloque `finally` se ejecuta siempre, ya sea que se haya producido una excepción o no. Es útil para liberar recursos o realizar limpiezas.

#### a. Ejemplo de función que procesa datos


```python
def procesar_datos(datos):
    try:
        # Intentar obtener el primer valor de la lista
        primero = datos[0]
        print(f"Procesando el primer dato: {primero}")
        
        # Intentar hacer una operación que podría fallar (por ejemplo, una conversión)
        resultado = int(primero)
        print(f"El primer dato convertido a entero es: {resultado}")
        
    except IndexError:
        print("Error: La lista está vacía.")
    except ValueError:
        print("Error: El primer dato no es un número válido.")
    finally:
        print("Proceso de procesamiento de datos finalizado, independientemente del resultado.")

```


```python
datos = ["10", "20", "30"]
procesar_datos(datos)
```

    Procesando el primer dato: 10
    El primer dato convertido a entero es: 10
    Proceso de procesamiento de datos finalizado, independientemente del resultado.



```python
datos_vacios = []
procesar_datos(datos_vacios)
```

    Error: La lista está vacía.
    Proceso de procesamiento de datos finalizado, independientemente del resultado.


#### b. Ejercicio práctico

Escribe una función que divida dos números e implemente manejo de excepciones. Si ocurre una división por cero, debe mostrar un mensaje de error, pero el bloque `finally` siempre debe ejecutarse para confirmar que el intento de división ha finalizado.


```python

```

---

## Módulo 2: Creación de excepciones personalizadas

### 1. Introducción a las excepciones personalizadas

Además de las excepciones incorporadas, puedes crear tus propias excepciones personalizadas para manejar errores específicos en tu aplicación.

#### a. Definición de una excepción personalizada

Para crear una excepción personalizada, debes definir una nueva clase que herede de la clase `Exception`.



```python
class MiExcepcion(Exception):
    pass

def verificar_numero(num):
    if num < 0:
        raise MiExcepcion("El número no puede ser negativo.")

try:
    verificar_numero(-5)
except MiExcepcion as e:
    print("Se ha producido una excepción:", e)
```

    Se ha producido una excepción: El número no puede ser negativo.


#### b. Añadir información a la excepción

Puedes agregar más información a la excepción personalizada utilizando el constructor de la clase.


```python
class ErrorValor(Exception):
    def __init__(self, mensaje, valor):
        super().__init__(mensaje)
        self.valor = valor

def verificar_edad(edad):
    if edad < 18:
        raise ErrorValor("La edad debe ser al menos 18.", edad)

try:
    verificar_edad(15)
except ErrorValor as e:
    print(f"Excepción: {e}, Valor no válido: {e.valor}")
```

#### c. Ejercicio práctico

Crea una excepción personalizada llamada `ErrorSaldo` que se lance si un usuario intenta retirar una cantidad de dinero mayor a su saldo. Implementa una función `retirar_dinero()` que use esta excepción.


```python

```
