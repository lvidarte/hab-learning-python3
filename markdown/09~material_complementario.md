# Clase 9: Material complementario

### 1. Excepciones comunes en Python

#### a.`NameError`

Se lanza al intentar usar una variable que no está definida.


```python
print(esta_variable_no_existe)
```


    ---------------------------------------------------------------------------

    NameError                                 Traceback (most recent call last)

    Cell In[19], line 1
    ----> 1 print(esta_variable_no_existe)


    NameError: name 'esta_variable_no_existe' is not defined


Capturando la excepción podemos manejar el error a nuestro gusto.


```python
try:
    print(variable_inexistente)
except NameError as e:
    print("Variable no definida.", e, sep='\n')
```

    Variable no definida.
    name 'variable_inexistente' is not defined


#### b. `ValueError`

Se genera al intentar convertir un dato a un tipo incompatible.


```python
try:
    numero = int("abc")
except ValueError as e:
    print("No se puede convertir 'abc' a entero.", e, sep='\n')
```

    No se puede convertir 'abc' a entero.
    invalid literal for int() with base 10: 'abc'


#### c. `TypeError`

Sucede al realizar una operación entre tipos incompatibles.


```python
try:
    resultado = "texto" + 5
except TypeError as e:
    print("No se puede sumar un texto y un número.", e, sep='\n')
```

    No se puede sumar un texto y un número.
    can only concatenate str (not "int") to str


#### d. `ZeroDivisionError`  

Ocurre al intentar dividir un número entre cero.


```python
try:
    resultado = 10 / 0
except ZeroDivisionError as e:
    print("Error: División por cero.", e, sep='\n')
```

    Error: División por cero.
    division by zero


#### e. `IndexError`

Surge al intentar acceder a un índice fuera del rango en una lista.


```python
lista = [1, 2, 3]

try:
    print(lista[5])
except IndexError as e:
    print("El índice está fuera de rango.", e, sep='\n')
```

    El índice está fuera de rango.
    list index out of range


#### f. `KeyError`

Aparece al intentar acceder a una clave inexistente en un diccionario.


```python
diccionario = {"a": 1, "b": 2}

try:
   print(diccionario["c"])
except KeyError as error:
   print("La clave no existe en el diccionario.", error, sep='\n')
```

    La clave no existe en el diccionario.
    'c'


Otro ejemplo.


```python
{}['a']
```


    ---------------------------------------------------------------------------

    KeyError                                  Traceback (most recent call last)

    Cell In[28], line 1
    ----> 1 {}['a']


    KeyError: 'a'


#### g. `AttributeError`

Se genera al intentar acceder a un atributo inexistente de un objeto.


```python
try:
    numero = 10
    numero.append(5)  # Los enteros no tienen el método append.
except AttributeError:
    print("Atributo inexistente.")
```

    Atributo inexistente.


#### h. `FileNotFoundError`

Se lanza cuando no se encuentra el archivo especificado.


```python
try:
    archivo = open("archivo_inexistente.txt", "r")
    contenido = archivo.read()
except FileNotFoundError as e:
    print("El archivo no fue encontrado:", e, sep='\n')
```

    El archivo no fue encontrado:
    [Errno 2] No such file or directory: 'archivo_inexistente.txt'


#### i. `ImportError` / `ModuleNotFoundError`

Ocurre cuando no se puede importar un módulo.


```python
try:
    import modulo_inexistente
except ModuleNotFoundError as e:
    print("El módulo no existe:", e, sep='\n')
```

    El módulo no existe:
    No module named 'modulo_inexistente'


#### j. `IndentationError`

Se genera debido a una mala indentación en el código (puede ser detectada antes de la ejecución).


```python
def funcion():
print("Error de indentación")
```


      Cell In[17], line 2
        print("Error de indentación")
        ^
    IndentationError: expected an indented block after function definition on line 1



#### k. `SyntaxError`

Se lanza al escribir código que no sigue las reglas sintácticas de Python.


```python
if True print("Falta ':' al final del if")
```


      Cell In[18], line 1
        if True print("Falta ':' al final del if")
                ^
    SyntaxError: invalid syntax



---

### 2. Jerarquía de excepciones

```text
BaseException
├── Exception
│   ├── ArithmeticError
│   │   ├── FloatingPointError
│   │   ├── OverflowError
│   │   └── ZeroDivisionError
│   ├── AssertionError
│   ├── AttributeError
│   ├── BufferError
│   ├── EOFError
│   ├── ImportError
│   │   └── ModuleNotFoundError
│   ├── LookupError
│   │   ├── IndexError
│   │   └── KeyError
│   ├── MemoryError
│   ├── NameError
│   │   └── UnboundLocalError
│   ├── OSError
│   │   ├── BlockingIOError
│   │   ├── ChildProcessError
│   │   ├── ConnectionError
│   │   │   ├── BrokenPipeError
│   │   │   ├── ConnectionAbortedError
│   │   │   ├── ConnectionRefusedError
│   │   │   └── ConnectionResetError
│   │   ├── FileExistsError
│   │   ├── FileNotFoundError
│   │   ├── InterruptedError
│   │   ├── IsADirectoryError
│   │   ├── NotADirectoryError
│   │   ├── PermissionError
│   │   ├── ProcessLookupError
│   │   └── TimeoutError
│   ├── RuntimeError
│   │   ├── NotImplementedError
│   │   └── RecursionError
│   ├── StopIteration
│   ├── StopAsyncIteration
│   ├── SyntaxError
│   │   └── IndentationError
│   │       └── TabError
│   ├── SystemError
│   ├── TypeError
│   ├── ValueError
│   │   └── UnicodeError
│   │       ├── UnicodeDecodeError
│   │       ├── UnicodeEncodeError
│   │       └── UnicodeTranslateError
│   └── Warning
│       ├── DeprecationWarning
│       ├── PendingDeprecationWarning
│       ├── RuntimeWarning
│       ├── SyntaxWarning
│       ├── UserWarning
│       ├── FutureWarning
│       ├── ImportWarning
│       ├── UnicodeWarning
│       └── BytesWarning
├── KeyboardInterrupt
├── SystemExit
└── GeneratorExit
```

---

### 3. Captura de múltiples excepciones

En Python, es posible capturar múltiples excepciones en un solo bloque `except` utilizando una tupla, o manejar cada tipo de excepción en bloques `except` separados. Aquí tienes ejemplos de ambas formas:

#### a. Capturar múltiples excepciones en un solo bloque


```python
try:
    # Código que puede generar errores
    x = int(input("Ingresa un número: "))
    y = 10 / x
    print(f"Resultado: {y}")
except (ValueError, ZeroDivisionError) as e:
    # Manejar cualquiera de las excepciones especificadas
    print(f"Error: {e}")
    print(type(e))
```

    Error: invalid literal for int() with base 10: 'uno'
    <class 'ValueError'>


En este caso, el programa captura tanto un `ValueError` (por ingresar un valor no convertible a entero) como un `ZeroDivisionError` (si el usuario ingresa 0).

#### b. Capturar cada excepción en bloques separados


```python
try:
    # Código que puede generar errores
    x = int(input("Ingresa un número: "))
    y = 10 / x
    print(f"Resultado: {y}")
except ValueError:
    print("Error: Debes ingresar un número válido.")
except ZeroDivisionError:
    print("Error: No se puede dividir por cero.")
```

    Error: No se puede dividir por cero.


Aquí, cada excepción tiene su propio bloque `except`, permitiendo respuestas personalizadas para cada error.

#### c. Capturar múltiples excepciones y ejecutar código común


```python
try:
    # Código que puede generar errores
    x = int(input("Ingresa un número: "))
    y = 10 / x
    print(f"Resultado: {y}")
except (ValueError, ZeroDivisionError):
    print("Error: Hubo un problema con la entrada.")
else:
    print("El cálculo se realizó con éxito.")
```

    Resultado: 5.0
    El cálculo se realizó con éxito.


Este ejemplo muestra cómo capturar múltiples excepciones en un bloque único y cómo usar `else` para manejar el caso en el que no ocurrieron errores.

#### d. Excepciones específicas con un mensaje común y captura general


```python
try:
    # Código que puede generar errores
    x = int(input("Ingresa un número: "))
    y = 10 / x
    mensaje = 'resultado:' + y
    print(mensaje)
except ValueError:
    print("Error: Ingresaste un valor no numérico.")
except ZeroDivisionError:
    print("Error: Intentaste dividir por cero.")
except Exception as e:
    # Manejar cualquier otra excepción no específica
    print(f"Ocurrió un error inesperado: {e}")
```

    Ocurrió un error inesperado: can only concatenate str (not "float") to str


Este enfoque es útil cuando quieres capturar errores específicos primero y luego manejar cualquier otra excepción genérica con un bloque general `except Exception`.

---

### 4. Lanzar excepciones con `raise`

Cuando se usa `raise`, se interrumpe la ejecución del programa en el punto donde se encuentra y se lanza la excepción especificada. Si no se maneja con un bloque `try-except`, el programa terminará con un mensaje de error.

#### a. Sintaxis básica

```python
raise ExceptionType("Mensaje de error")
```

- **`ExceptionType`**: Es el tipo de excepción que deseas lanzar, como `ValueError`, `TypeError`, o `ZeroDivisionError`.
- **`"Mensaje de error"`**: Es un mensaje opcional que describe la causa de la excepción.


#### b. Lanzar una excepción genérica


```python
raise Exception("Ocurrió un error inesperado.")
```


    ---------------------------------------------------------------------------

    Exception                                 Traceback (most recent call last)

    Cell In[1], line 1
    ----> 1 raise Exception("Ocurrió un error inesperado.")


    Exception: Ocurrió un error inesperado.


Esto lanza una excepción genérica `Exception` con el mensaje `"Ocurrió un error inesperado."`.

#### c. Lanzar una excepción específica


```python
def dividir(a, b):
    if b == 0:
        raise ZeroDivisionError("El denominador no puede ser cero.")
    return a / b

try:
    resultado = dividir(10, 0)
except ZeroDivisionError as e:
    print(f"Error capturado: {e}")
```

    Error capturado: El denominador no puede ser cero.


Aquí se usa `ZeroDivisionError` para indicar que una división por cero no está permitida.

#### d. Lanzar una excepción basada en una condición


```python
edad = int(input("Ingresa tu edad: "))

if edad < 0:
    raise ValueError("La edad no puede ser negativa.")

print(f"Tu edad es: {edad}")
```


    ---------------------------------------------------------------------------

    ValueError                                Traceback (most recent call last)

    Cell In[3], line 1
    ----> 1 edad = int(input("Ingresa tu edad: "))
          3 if edad < 0:
          4     raise ValueError("La edad no puede ser negativa.")


    ValueError: invalid literal for int() with base 10: ''


Si el usuario ingresa un valor negativo, se lanza un `ValueError`.

#### e. Reutilizar una excepción capturada

A veces quieres propagar una excepción que ya fue capturada:


```python
try:
    x = int("texto")
except ValueError as e:
    print(f"Error capturado: {e}")
    raise  # Relanza la excepción original
```

    Error capturado: invalid literal for int() with base 10: 'texto'



    ---------------------------------------------------------------------------

    ValueError                                Traceback (most recent call last)

    Cell In[4], line 2
          1 try:
    ----> 2     x = int("texto")
          3 except ValueError as e:
          4     print(f"Error capturado: {e}")


    ValueError: invalid literal for int() with base 10: 'texto'


`raise` sin argumentos dentro de un bloque `except` relanza la misma excepción que fue capturada.

#### f. Buenas prácticas
1. Usa excepciones específicas como `ValueError`, `TypeError`, o `KeyError` en lugar de la genérica `Exception`.
2. Acompaña las excepciones con mensajes descriptivos que expliquen claramente la causa del error.
3. No abuses de `raise`; solo lánzalo si es necesario para mejorar la claridad o la robustez del programa.

---

### 5. Introducción a `assert` en Python

La palabra clave `assert` en Python se utiliza para **realizar verificaciones durante la ejecución del programa**. Es una herramienta de depuración que permite verificar si una condición es verdadera, y si no lo es, **lanza una excepción del tipo `AssertionError`** con un mensaje opcional.

#### a. Sintaxis de `assert`

```python
assert condition, message
```

- **`condition`**: Es una expresión booleana que se espera que sea `True`. Si es `False`, se lanza un `AssertionError`.
- **`message`** (opcional): Un mensaje que describe el error, útil para entender qué salió mal.

#### b. Ejemplo básico


```python
x = 10
assert x > 0, "El valor de x debe ser positivo."
print("x es válido.")
```

En este caso:
- Si `x > 0`, la ejecución continúa normalmente.
- Si `x <= 0`, el programa lanza un `AssertionError` con el mensaje `"El valor de x debe ser positivo."`.

#### c. ¿Cómo se relaciona `assert` con las excepciones?

1. **Excepción lanzada**: Cuando la condición de `assert` es falsa, Python lanza automáticamente un **`AssertionError`**, que es una excepción estándar.


```python
assert False, "Este es un error."
```


    ---------------------------------------------------------------------------

    AssertionError                            Traceback (most recent call last)

    Cell In[5], line 1
    ----> 1 assert False, "Este es un error."


    AssertionError: Este es un error.


2. **Es capturable**: Como cualquier excepción, puedes manejar `AssertionError` usando bloques `try-except`:


```python
try:
    assert 2 + 2 == 5, "La suma es incorrecta."
except AssertionError as e:
    print(f"Error capturado: {e}")
```

    Error capturado: La suma es incorrecta.


3. **Ayuda a detectar errores**: Se usa para asegurar que ciertas condiciones se cumplan durante el desarrollo. Si una condición no se cumple, el error alerta al desarrollador.

#### d. Usos comunes de `assert`

1. Verificar entradas y precondiciones


```python
def dividir(a, b):
    assert b != 0, "El divisor no puede ser cero."
    return a / b
```

2. Verificar salidas y postcondiciones


```python
def cuadrado(x):
    resultado = x * x
    assert resultado >= 0, "El resultado debe ser positivo."
    return resultado
```

3. Verificar invariantes en bucles


```python
suma = 0
for i in range(10):
    suma += i
    assert suma >= 0, "La suma nunca debe ser negativa."
```

#### e. Diferencias entre `assert` y `raise`

| **`assert`**                              | **`raise`**                              |
|-------------------------------------------|------------------------------------------|
| Se utiliza para **depuración** y pruebas rápidas. | Se utiliza para **lanzar excepciones explícitas**. |
| Lanza un **`AssertionError`** si la condición es falsa. | Puede lanzar cualquier tipo de excepción. |
| Su comportamiento depende del entorno de ejecución (puede deshabilitarse en producción). | Siempre está habilitado y se ejecuta en cualquier entorno. |

#### f. ¿Se puede desactivar `assert`?

Sí, puedes desactivar todas las verificaciones con `assert` ejecutando Python en **modo optimizado**:

```bash
python -O script.py
```

En este caso:
- Las declaraciones `assert` serán ignoradas.
- Es útil para entornos de producción, pero ten cuidado, ya que no debes confiar en `assert` para manejar errores críticos.

---

### 6. ¿Qué es un stack trace en Python?

Un **stack trace** (o rastreo de pila) es un informe generado cuando ocurre una excepción en Python. Muestra una lista detallada de las funciones o métodos que estaban en ejecución en el momento en que se produjo el error, lo que ayuda a identificar el origen del problema.

#### a. Estructura de un stack trace

El stack trace incluye:
1. **La excepción levantada**: Especifica el tipo de error y un mensaje descriptivo.
2. **La pila de llamadas**: Lista las funciones o métodos que estaban en ejecución, con información sobre el archivo, las líneas de código y el contexto de cada llamada.
3. **El lugar exacto donde ocurrió el error**: Indica la línea específica del código que desencadenó la excepción.

#### b. Ejemplo de stack trace

Considera el siguiente código, al ejecutarlo, Python genera el siguiente stack trace:


```python
def dividir(a, b):
    return a / b

def calcular():
    resultado = dividir(10, 0)
    print(resultado)

calcular()
```


    ---------------------------------------------------------------------------

    ZeroDivisionError                         Traceback (most recent call last)

    Cell In[11], line 8
          5     resultado = dividir(10, 0)
          6     print(resultado)
    ----> 8 calcular()


    Cell In[11], line 5, in calcular()
          4 def calcular():
    ----> 5     resultado = dividir(10, 0)
          6     print(resultado)


    Cell In[11], line 2, in dividir(a, b)
          1 def dividir(a, b):
    ----> 2     return a / b


    ZeroDivisionError: division by zero


#### c. Análisis del stack trace: Traceback

1. Traceback:
   - Inicia con la palabra clave `Traceback (most recent call last):`.
   - Significa que está mostrando las llamadas más recientes primero (orden inverso).

2. Pila de llamadas:
   - Cada línea muestra una función que estaba en ejecución, desde el nivel más bajo (donde ocurrió el error) hasta el nivel superior (donde se llamó la función).
   - Ejemplo:
     - `line 8`: El error ocurrió mientras se ejecutaba la función `calcular`.
     - `line 5`: Dentro de `calcular`, se llamó a `dividir`.
     - `line 2`: En `dividir`, ocurrió la división por cero.

3. Excepción levantada:
   - `ZeroDivisionError: division by zero`: Es el tipo de excepción y una descripción del problema.

#### d. ¿Para qué sirve un Traceback?

- **Depuración**: Identificar rápidamente qué parte del código causó el error.
- **Seguimiento del flujo**: Comprender la secuencia de llamadas que llevaron al problema.
- **Registro de errores**: Los tracebacks se pueden registrar en archivos para análisis posterior.

---

### 7. Ejercicios con excepciones


#### a. División segura

Escribe una función `dividir(a, b)` que maneje divisiones por cero lanzando una excepción `ZeroDivisionError`.


```python
def dividir(a: float, b: float) -> float:
    """
    Calcula la división entre a y b.

    Parameters:
        a (float): El numerador.
        b (float): El denominador.

    Returns:
        float: El resultado de la división.

    Raises:
        ZeroDivisionError: Si el denominador es cero.
    """
    if b == 0:
        raise ZeroDivisionError("El denominador no puede ser cero.")
    return a / b

try:
    print(dividir(10, 0))
except ZeroDivisionError as e:
    print(f"Error: {e}")
```

    Error: El denominador no puede ser cero.


#### b. Validación de edad

Crea una función `verificar_edad(edad)` que lance una excepción si la edad es negativa.


```python
def verificar_edad(edad):
    if edad < 0:
        raise ValueError("La edad no puede ser negativa.")
    return edad

try:
    verificar_edad(-5)
except ValueError as e:
    print(e)
```

    La edad no puede ser negativa.


#### c. Comprobación de lista vacía

Escribe una función `obtener_primero(lista)` que devuelva el primer elemento de una lista o lance una excepción si la lista está vacía.


```python
def obtener_primero(lista):
    if len(lista) == 0:
        raise ValueError("La lista está vacía.")
    return lista[0]

try:
    print(obtener_primero([]))
except ValueError as e:
    print(e)
```

    La lista está vacía.


#### d. Conversión segura a entero

Crea una función `convertir_a_entero(valor)` que maneje excepciones al convertir cadenas a enteros.


```python
def convertir_a_entero(valor):
    try:
        return int(valor)
    except ValueError:
        raise Exception(f"No se puede convertir '{valor}' a entero.")

try:
    num: int = convertir_a_entero('hola')
except Exception as e:
    print(e)
else:
    print(num)
```

    No se puede convertir 'hola' a entero.


#### e. Validación de rango numérico

Escribe una función `verificar_rango(n, min, max)` que lance una excepción si un número no está dentro de un rango dado.


```python
def verificar_rango(n, min, max):
    if n < min or n > max:
        raise ZeroDivisionError(f"El número debe estar entre {min} y {max}.")
    return n

try:
    verificar_rango(0, 1, 10)
except Exception as e:
    print(e)
else:
    print("No hubo excepciones")
finally:
    print("Terminó el bloque try")
```

    El número debe estar entre 1 y 10.
    Terminó el bloque try


#### f. Búsqueda en diccionario

Crea una función `buscar_clave(diccionario, clave)` que maneje la ausencia de una clave en un diccionario.


```python
def buscar_clave(diccionario, clave):
    if clave not in diccionario:
        raise KeyError(f"La clave '{clave}' no existe en el diccionario.")
    return diccionario[clave]

diccionario = {'a': 1, 'b': 2}

try:
    dato = buscar_clave(diccionario, 'c')
except KeyError as e:
    print(e)
else:
    print(dato)
```

    "La clave 'c' no existe en el diccionario."


#### g. Operación matemática personalizada

Escribe una función `calcular_raiz_cuadrada(n)` que maneje valores negativos lanzando una excepción.


```python
import math

def calcular_raiz_cuadrada(n):
    if n < 0:
        raise ValueError("El número no puede ser negativo.")
    return math.sqrt(n)

try:
    resultado = calcular_raiz_cuadrada(-9)
except ValueError as e:
    print(e)
else:
    print(resultado)
```

    El número no puede ser negativo.



#### h. Validación de cadenas

Crea una función `validar_cadena(cadena)` que lance una excepción si la cadena está vacía.


```python
def validar_cadena(cadena):
    if not cadena:
        raise ValueError("La cadena no puede estar vacía.")
    return f"La cadena es válida: {cadena}"

try:
    print(validar_cadena(""))
except ValueError as e:
    print(f"Error: {e}")
```

    Error: La cadena no puede estar vacía.



#### i. Operación en archivo

Escribe una función `leer_archivo(nombre_archivo)` que maneje errores al intentar abrir un archivo inexistente.


```python
def leer_archivo(filepath):
    archivo = None
    try:
        archivo = open(filepath, 'r')
        contenido = archivo.read()
        return contenido
    except FileNotFoundError:
        raise FileNotFoundError(f"El archivo '{filepath}' no existe.")
    finally:
        if archivo is not None:
            print("Cerrando archivo")
            archivo.close()

try:
    contenido = leer_archivo('archivo_no_existe.txt')
except FileNotFoundError as e:
    print(e)
else:
    print(contenido)
```

    El archivo 'archivo_no_existe.txt' no existe.



#### j. Validación de divisor múltiple

Crea una función `verificar_multiplo(n, divisor)` que lance una excepción si el divisor no es múltiplo de `n`.


```python
def verificar_multiplo(n, divisor):
    if n % divisor != 0:
        raise ValueError(f"{n} no es múltiplo de {divisor}.")

try:
    verificar_multiplo(9, 3)
except ValueError as e:
    print(e)
```

#### k. Excepción personalizada para rango de edades

Crea una excepción personalizada llamada `EdadInvalidaError`. Escribe una función `verificar_edad(edad)` que utilice esta excepción para indicar si una edad es inválida (negativa o mayor a 120).


```python
class EdadInvalidaError(Exception):
    pass

def verificar_edad(edad):
    if edad < 0 or edad > 120:
        raise EdadInvalidaError(f"La edad {edad} es inválida.")
    return edad

try:
    verificar_edad(-5)
except EdadInvalidaError as e:
    print(e)
else:
    print("No hubo excepciones")
finally:
    print("Terminó el bloque try")
```

    La edad -5 es inválida.
    Terminó el bloque try


#### l. Excepción personalizada para formato de nombre

Define una excepción personalizada llamada `FormatoNombreError`. Crea una función `verificar_nombre(nombre)` que lance esta excepción si el nombre no comienza con una letra mayúscula o contiene números.


```python
class FormatoNombreError(Exception):
    pass

def verificar_nombre(nombre):
    if not nombre[0].isupper() or any(char.isdigit() for char in nombre):
        raise FormatoNombreError(f"El nombre '{nombre}' no tiene el formato correcto.")

try:
    verificar_nombre('Juan_')
except FormatoNombreError as e:
    print(e)
else:
    print("No hubo excepciones")
finally:
    print("Terminó el bloque try")
```

    No hubo excepciones
    Terminó el bloque try


#### m. Validación de entrada de número

Define una excepción personalizada llamada `NumeroInvalidoError`. Escribe una función `validar_numero(numero)` que valide lo siguiente:  
1. El número debe ser positivo.  
2. El número debe ser menor que 100.  

Utiliza múltiples bloques `except` para manejar errores como `ValueError` (si el tipo no es un número válido) y `NumeroInvalidoError` para las validaciones específicas.


```python
class NumeroInvalidoError(Exception):
    pass

def validar_numero(numero):
    if not isinstance(numero, (int, float)):
        raise ValueError("El número debe ser un número válido.")

try:
    validar_numero(101)
except ValueError as e:
    print(e)
except NumeroInvalidoError as e:
    print(e)
else:
    print("No hubo excepciones")
finally:
    print("Terminó el bloque try")
```

    No hubo excepciones
    Terminó el bloque try

