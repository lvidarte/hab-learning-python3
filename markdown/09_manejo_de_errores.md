# Clase 9: Manejo de Errores y Excepciones

## Módulo 1: Manejo de errores y excepciones

### 1. Introducción a los errores y excepciones

Los errores en Python pueden ocurrir debido a diversas razones, como problemas de sintaxis, referencias a variables no definidas o errores de tipo. Para manejar estos errores, se utilizan excepciones.

#### 2. Uso de bloques try y except

El manejo de excepciones se realiza mediante los bloques `try` y `except`. El código que puede generar un error se coloca en el bloque `try`, y las acciones que se deben tomar en caso de un error se definen en el bloque `except`.

##### Ejemplo básico de manejo de excepciones:


```python
try:
    numero = int(input('Ingresa un número'))
    print("El número es:", numero)
except ValueError:
    print("¡Error! no es un número válido.")
```

    El número es: 5


#### 3. Manejo de múltiples excepciones

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


#### Ejercicio práctico:

Escribe un programa que solicite al usuario ingresar un número. Maneja la excepción `ValueError` y `ZeroDivisionError` al intentar dividir 10 entre el número ingresado.


```python

```

### 4. Bloque finally

El bloque `finally` se ejecuta siempre, ya sea que se haya producido una excepción o no. Es útil para liberar recursos o realizar limpiezas.


```python
try:
    archivo = open("archivo.txt", "r")
    contenido = archivo.read()
except FileNotFoundError:
    print("¡Error! El archivo no se encontró.")
finally:
    archivo.close()  # Asegura que el archivo se cierre
```

    ¡Error! El archivo no se encontró.



    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    Cell In[2], line 7
          5     print("¡Error! El archivo no se encontró.")
          6 finally:
    ----> 7     archivo.close()  # Asegura que el archivo se cierre


    NameError: name 'archivo' is not defined


#### Ejercicio práctico:

Crea un programa que intente abrir un archivo y lea su contenido, asegurando que el archivo se cierre en el bloque `finally`.


```python

```

---

## Módulo 2: Creación de excepciones personalizadas

### 1. Introducción a las excepciones personalizadas

Además de las excepciones incorporadas, puedes crear tus propias excepciones personalizadas para manejar errores específicos en tu aplicación.

#### 2. Definición de una excepción personalizada

Para crear una excepción personalizada, debes definir una nueva clase que herede de la clase `Exception`.

##### Ejemplo de excepción personalizada:


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


#### 3. Añadir información a la excepción

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

#### Ejercicio práctico:

Crea una excepción personalizada llamada `ErrorSaldo` que se lance si un usuario intenta retirar una cantidad de dinero mayor a su saldo. Implementa una función `retirar_dinero()` que use esta excepción.


```python

```
