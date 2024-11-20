# Clase 7: Material complementario

### 1. Funciones en Python

Las **funciones en Python** son bloques de código diseñados para realizar una tarea específica. La principal ventaja de usar funciones es que permiten una **abstracción** del código y fomentan su **reutilización**. En lugar de escribir el mismo bloque de código varias veces, podemos definir una función una vez y luego llamarla cada vez que necesitemos realizar esa tarea. Esto no solo hace que el código sea más claro y modular, sino que también facilita su mantenimiento.

#### a. ¿Por qué son importantes las funciones?
1. **Abstracción**: Las funciones permiten dividir un problema complejo en partes más manejables. Al encapsular una operación dentro de una función, no necesitamos preocuparnos por los detalles cada vez que la usamos, solo invocarla con los datos correctos.

2. **Reutilización de código**: Una función puede definirse una vez y luego usarse en cualquier parte del programa o incluso en otros programas. Esto reduce la duplicación de código y, por lo tanto, disminuye la probabilidad de errores.

3. **Organización y legibilidad**: Un programa que utiliza funciones es más fácil de leer y de entender, ya que cada función cumple un propósito específico, lo que facilita a otros programadores (o a uno mismo) entender el flujo del código.

4. **Mantenibilidad**: Si se necesita modificar el comportamiento de una función, basta con actualizar el código de la función en su lugar, y automáticamente se verán reflejados los cambios en todas las partes del programa donde se llama a esa función.

#### b. Las funciones como objetos
En Python, las funciones son **objetos de primera clase**. Esto significa que:
- Podemos asignar una función a una variable.
- Podemos pasar funciones como argumentos a otras funciones.
- Podemos retornar funciones desde otras funciones.
- Podemos almacenarlas en estructuras de datos como listas o diccionarios.

Esta capacidad de tratar funciones como objetos permite patrones de programación más avanzados, como las funciones de orden superior (que reciben o devuelven otras funciones) y las funciones lambda, que son funciones anónimas de una sola línea.

---

### 2. Objetos de primera clase

El hecho de que las funciones en Python sean objetos de primera clase, permite usarlas de maneras avanzadas y flexibles.

#### a. Asignar una función a una variable
Puedes almacenar una función en una variable, lo cual permite llamarla de manera indirecta o intercambiar funciones en tu programa.


```python
def saludo():
    return "¡Hola, Mundo!"

# Asignando la función a una variable
mensaje = saludo
print(mensaje())
```

    ¡Hola, Mundo!


#### b. Pasar una función como argumento

Puedes pasar funciones como argumentos a otras funciones. Esto es útil para crear **funciones de orden superior** que operan sobre otras funciones.


```python
def aplicar_operacion(a, b, operacion):
    return operacion(a, b)

def suma(x, y):
    return x + y

def multiplicacion(x, y):
    return x * y

# Usando aplicar_operacion con diferentes funciones
print(aplicar_operacion(3, 4, suma))
print(aplicar_operacion(3, 4, multiplicacion))
```

    7
    12


Aquí, `aplicar_operacion` es una función de orden superior que recibe otra función (`operacion`) como argumento, y aplica esa función a los valores `a` y `b`.

#### c. Retornar una función desde otra función

Una función puede devolver otra función, lo cual es una característica clave para implementar **clausuras** y **factories** (funciones que generan otras funciones).


```python
def crear_saludo_personalizado(saludo_base):
    def saludo(nombre):
        return f"{saludo_base}, {nombre}!"
    return saludo

# Crear saludos personalizados
saludo_amistoso = crear_saludo_personalizado("¡Hola")
saludo_formal = crear_saludo_personalizado("Estimado")

print(saludo_amistoso("Carlos"))
print(saludo_formal("Carlos"))
```

    ¡Hola, Carlos!
    Estimado, Carlos!


Aquí, `crear_saludo_personalizado` retorna una nueva función (`saludo`) que mantiene el contexto de `saludo_base` en su definición, lo que se conoce como **clausura**.

#### d. Usar funciones en estructuras de datos
Al ser objetos, las funciones se pueden almacenar en listas, diccionarios, y otras estructuras de datos. Esto facilita el uso de **tablas de despacho** para organizar y acceder a funciones en lugar de usar múltiples estructuras de control (`if`, `elif`, `else`).


```python
def suma(a, b):
    return a + b

def resta(a, b):
    return a - b

def multiplicacion(a, b):
    return a * b

# Tabla de operaciones
operaciones = {
    'suma': suma,
    'resta': resta,
    'multiplicacion': multiplicacion
}

# Usar una operación desde el diccionario
resultado = operaciones['suma'](5, 3)
print(resultado)
```

    8


La estructura `operaciones` permite seleccionar y ejecutar la función deseada dinámicamente, facilitando el código y evitando muchos condicionales.

#### e. Funciones anónimas (Lambda)

Las funciones lambda en Python son funciones de una sola línea que permiten crear funciones rápidamente sin definirlas explícitamente.


```python
# Función de orden superior con lambda
numeros = [1, 2, 3, 4, 5]
cuadrados = list(map(lambda x: x ** 2, numeros))

print(cuadrados)
```

    [1, 4, 9, 16, 25]


En este ejemplo, usamos una función `lambda` (anónima) dentro de `map` para aplicar la operación de elevar al cuadrado a cada elemento de la lista.

#### f. Decoradores

Los decoradores son funciones que toman otra función y la envuelven para modificar su comportamiento. Esto es posible porque las funciones pueden ser pasadas y devueltas como objetos.


```python
def decorador_mensaje(funcion):
    def funcion_decorada():
        print("Inicio del mensaje")
        funcion()
        print("Fin del mensaje")
    return funcion_decorada

@decorador_mensaje
def saludo():
    print("¡Hola a todos!")

# Llamando a la función decorada
saludo()
```

    Inicio del mensaje
    ¡Hola a todos!
    Fin del mensaje


Aquí, `@decorador_mensaje` envuelve a la función `saludo` con una función decorada que añade mensajes antes y después de la ejecución. Los decoradores son útiles para agregar comportamientos adicionales sin modificar el código original de una función.

---

### 3. Decorador completo

Los decoradores pueden aceptar parámetros y necesitan un nivel adicional de anidación para recibirlos. Al mismo tiempo, `functools.wraps` es útil para que el decorador mantenga el nombre y la documentación de la función original, sin que se sobrescriban por la envoltura.


```python
from functools import wraps

def repetir(repeticiones):
    def decorador(func):
        @wraps(func)
        def funcion_decorada(*args, **kwargs):
            for _ in range(repeticiones):
                resultado = func(*args, **kwargs)
            return resultado
        return funcion_decorada
    return decorador

@repetir(3)
def saludo(nombre):
    """Imprime un saludo personalizado."""
    print(f"¡Hola, {nombre}!")

# Llamando a la función decorada
saludo("Juan")

# Verificando si conserva el nombre y la documentación
print(saludo.__name__)
print(saludo.__doc__)
```

    ¡Hola, Juan!
    ¡Hola, Juan!
    ¡Hola, Juan!
    saludo
    Imprime un saludo personalizado.


#### a. Explicación

1. **Decorador con parámetros**: El decorador `repetir` recibe un parámetro `repeticiones`, que controla cuántas veces se ejecutará la función original.
2. **`wraps`**: Al aplicar `@wraps(func)` en `funcion_decorada`, logramos que el nombre, la documentación (`__doc__`), y otros metadatos de la función original (`saludo`) se mantengan en `funcion_decorada`.
3. **Uso del decorador**: Al decorar `saludo` con `@repetir(3)`, especificamos que queremos que `saludo` se ejecute 3 veces cuando se llame.

---

### 4. Docstrings

Los **docstrings** en Python son una herramienta fundamental para documentar el propósito y uso de las funciones, clases y módulos, facilitando la comprensión del código tanto para otros programadores como para uno mismo en el futuro. Python recomienda seguir ciertos estándares para los docstrings, y uno de los más utilizados es el de **PEP 257**, que establece buenas prácticas para estructurarlos.

#### a. ¿Qué es un docstring?

Un docstring es una cadena de texto colocada al inicio de una función, clase o módulo, que explica brevemente qué hace y cómo se usa. En Python, se coloca dentro de tres comillas dobles (`""" ... """`) y se puede acceder mediante el atributo `__doc__` del objeto o la función `help()`.

#### b. Estructura básica de un docstring en una función


```python
def nombre_funcion(param1, param2):
    """
    Descripción breve de la función en una sola línea.

    Descripción detallada de lo que hace la función, si es necesario. Explica
    el propósito, el contexto de uso, y cualquier otro detalle relevante.

    Args:
        param1 (tipo): Descripción de param1.
        param2 (tipo): Descripción de param2.

    Returns:
        tipo: Descripción de lo que retorna la función.

    Raises:
        TipoDeExcepcion: Descripción de cuándo y por qué se lanza una excepción.
    """
    # Código de la función
    pass
```

#### c. Estructura básica de un docstring con anotaciones de tipo

Cuando usamos `typing`, podemos reemplazar el bloque `Args` en el docstring, ya que los tipos de los parámetros se anotan directamente en la definición de la función. Esto simplifica la documentación y hace el código más claro.


```python
from typing import Any

def nombre_funcion(param1: int, param2: str) -> Any:
    """
    Descripción breve de la función en una sola línea.

    Descripción detallada de lo que hace la función, si es necesario. Explica
    el propósito, el contexto de uso, y cualquier otro detalle relevante.

    Parameters:
        param1 (int): Descripción de param1.
        param2 (str): Descripción de param2.

    Returns:
        Any: Descripción de lo que retorna la función.

    Raises:
        TipoDeExcepcion: Descripción de cuándo y por qué se lanza una excepción.
    """
    pass
```

#### d. Ejemplo de docstring con typing en una función

Aquí tienes el ejemplo de una función que calcula el área de un rectángulo, usando anotaciones de tipo:


```python
def calcular_area_rectangulo(base: float, altura: float) -> float:
    """
    Calcula el área de un rectángulo dado su base y altura.

    Esta función toma la base y la altura de un rectángulo y retorna
    el área. Es útil para aplicaciones de geometría o cálculo de superficies.

    Parameters:
        base (float): La longitud de la base del rectángulo en unidades.
        altura (float): La longitud de la altura del rectángulo en unidades.

    Returns:
        float: El área del rectángulo en unidades cuadradas.

    Raises:
        ValueError: Si la base o la altura son valores negativos.
    """
    if base < 0 or altura < 0:
        raise ValueError("La base y la altura deben ser valores no negativos.")
    return base * altura
```

---

### 5. Ejercicios con funciones


#### a. Escribe una función `es_anagrama` que verifique si dos cadenas son anagramas (tienen las mismas letras en diferente orden). La función debe recibir los parámetros `cadena1` y `cadena2` y devolver `True` si ambas tienen los mismos caracteres.


```python
anagramas = [
    ('Amor', 'Roma'),
    ('Nacionalista', 'Altisonancia'),
    ('Cobra', 'Barco'),
    ('Flamenco', 'Come flan'),
    ('Un legado', 'De alguno'),
]

def es_anagrama(cadena1, cadena2):
    return ''.join(sorted(cadena1.lower())).strip() == ''.join(sorted(cadena2.lower())).strip()

for cadena1, cadena2 in anagramas:
    print(cadena1, cadena2, es_anagrama(cadena1, cadena2))
```

    Amor Roma True
    Nacionalista Altisonancia True
    Cobra Barco True
    Flamenco Come flan True
    Un legado De alguno True


#### b. Escribe una función `obtener_maximo_absoluto` que reciba una lista de números y devuelva el valor absoluto más alto.


```python
def obtener_maximo_absoluto(numeros):
    return max(abs(num) for num in numeros)

obtener_maximo_absoluto([1, 3, -6, 40, -100])
```




    100



#### c. Escribe una función `calcular_fibonacci` que devuelva una lista con los primeros `n` valores de la secuencia de Fibonacci.


```python
def calcular_fibonacci(n):
    a, b = fibo = [0, 1]
    for _ in range(n - 2):
        a, b  = b, a + b
        fibo.append(b)
    return fibo


print(calcular_fibonacci(10))
```

    [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]


#### d. Escribe una función `es_capicua` que reciba un número entero usando el parámetro `numero` y devuelva `True` si el número es capicúa (se lee igual de izquierda a derecha que de derecha a izquierda) y `False` si no lo es.


```python
def es_capicua(numero):
    return str(numero) == str(numero)[::-1]

for numero in [121, 1357531, 444, 899, 900009]:
    print(numero, es_capicua(numero))
```

    121 True
    1357531 True
    444 True
    899 False
    900009 True


#### e. Escribe una función `generar_acronimo` que reciba una frase y devuelva el acrónimo formado por la primera letra de cada palabra, en mayúsculas.


```python
def generar_acronimo(frase):
    return ''.join([palabra[0].upper() for palabra in frase.split() if len(palabra) > 3])

frases = [
    'precio de venta al público',
    'producto interior bruto',
    'Diario Oficial de la Comunidad Europea',
    'Diario Oficial de la Generalitat de Cataluña',
    'compact disk read only memory',
]

for frase in frases:
    print(frase, '-->', generar_acronimo(frase))
```

    precio de venta al público --> PVP
    producto interior bruto --> PIB
    Diario Oficial de la Comunidad Europea --> DOCE
    Diario Oficial de la Generalitat de Cataluña --> DOGC
    compact disk read only memory --> CDROM


#### f. Escribe una función `es_bisiesto` que reciba un año y retorne `True` si es bisiesto y `False` si no lo es.


```python
def es_bisiesto(año):
    return (año % 4 == 0 and año % 100 != 0) or (año % 400 == 0)

años = [
    {"año": 1900, "bisiesto": False},  # No bisiesto, divisible por 100 pero no por 400
    {"año": 2000, "bisiesto": True},   # Bisiesto, divisible por 100 y también por 400
    {"año": 2004, "bisiesto": True},   # Bisiesto, divisible por 4 y no por 100
    {"año": 2100, "bisiesto": False},  # No bisiesto, divisible por 100 pero no por 400
    {"año": 2024, "bisiesto": True},   # Bisiesto, divisible por 4 y no por 100
    {"año": 2028, "bisiesto": True},   # Bisiesto, divisible por 4 y no por 100
    {"año": 2200, "bisiesto": False},  # No bisiesto, divisible por 100 pero no por 400
    {"año": 2400, "bisiesto": True},   # Bisiesto, divisible por 100 y también por 400
]

for año in años:
    print(año, '-->', es_bisiesto(año['año']))
```

    {'año': 1900, 'bisiesto': False} --> False
    {'año': 2000, 'bisiesto': True} --> True
    {'año': 2004, 'bisiesto': True} --> True
    {'año': 2100, 'bisiesto': False} --> False
    {'año': 2024, 'bisiesto': True} --> True
    {'año': 2028, 'bisiesto': True} --> True
    {'año': 2200, 'bisiesto': False} --> False
    {'año': 2400, 'bisiesto': True} --> True


#### g. Escribe una función `contar_vocales` que reciba una cadena de texto y retorne el total de vocales en la misma, sin importar mayúsculas o minúsculas.


```python
def contar_vocales(texto):
    return sum(1 for char in texto.lower() if char in 'aeiouáéíóú')

texto = 'Python es un lenguaje de programación versátil, popular tanto en el ámbito profesional como en el educativo.'

print(f"vocales: {contar_vocales(texto)}")
```

    vocales: 40


#### h. Escribe una función `factorial` que calcule el factorial de un número no negativo.


```python
# Ejemplo de recursividad (función que se llama a sí misma)
def factorial(numero):
    if numero == 0:
        return 1
    return numero * factorial(numero - 1)

print(factorial(10))
```

    3628800


---

### 6. Parámetros

En Python, los **parámetros** son valores que una función recibe para poder realizar su tarea. Definir parámetros en una función permite que esta trabaje de manera flexible, adaptándose a los datos específicos que le pasemos cada vez que la llamemos.

Los **parámetros** se definen entre paréntesis en la declaración de una función. Cuando llamamos a la función, le pasamos **argumentos** (los valores concretos) que tomarán el lugar de esos parámetros y así ejecutarán la función con datos específicos.

#### a. Parámetros

Python ofrece varias formas de pasar parámetros a las funciones, lo que permite ajustar la forma en que enviamos y recibimos datos. Los más comunes son:

1. **Parámetros posicionales:** El valor de cada argumento se asocia a los parámetros de acuerdo con el orden en que aparecen. Este es el tipo de parámetro más común y es muy directo de usar.

2. **Parámetros con nombre o `keyword arguments`:** En este caso, al llamar a la función, indicamos explícitamente el nombre del parámetro junto con su valor, lo cual facilita el entendimiento y la legibilidad del código.

3. **Parámetros con valores por defecto:** Podemos definir valores predeterminados para ciertos parámetros en la declaración de la función. De este modo, si el argumento no se pasa al llamar a la función, Python utilizará el valor predeterminado.

4. **Parámetros arbitrarios (`*args` y `**kwargs`):** En algunos casos, no sabemos de antemano cuántos argumentos se pasarán. Para esos casos, se pueden utilizar `*args` para recibir cualquier cantidad de argumentos posicionales y `**kwargs` para recibir cualquier cantidad de argumentos con nombre.

#### b. Ejemplo de parámetros posicionales

Los parámetros posicionales se asignan en el orden en que aparecen. Si cambiamos el orden de los argumentos, afectamos los valores con los que trabajará la función.


```python
def presentar_persona(nombre, edad):
    print(f"Nombre: {nombre}")
    print(f"Edad: {edad}")

# Llamada con parámetros posicionales
presentar_persona("Ana", 30)
```

    Nombre: Ana
    Edad: 30



```python
def presentar_persona(nombre: str, edad: int) -> None:
    print(f"Nombre: {nombre}")
    print(f"Edad: {edad}")

presentar_persona("Ana", 30)
```

    Nombre: Ana
    Edad: 30


#### b. Parámetros con nombre (keyword arguments)

Podemos especificar explícitamente el nombre del parámetro en la llamada, sin importar el orden en que los coloquemos.


```python
# Llamada con parámetros con nombre
presentar_persona(edad=25, nombre="Carlos")
```

    Nombre: Carlos
    Edad: 25



Esto hace que el código sea más claro y flexible, especialmente en funciones con muchos parámetros.

#### c. Parámetros con valores por defecto

Los valores por defecto permiten que algunos argumentos sean opcionales. Si no se proporciona un argumento al llamar a la función, se usará el valor por defecto.


```python
def saludar(nombre, saludo="Hola"):
    print(f"{saludo}, {nombre}!")
```


```python
# Usando typing
def saludar(nombre, saludo: str = "Hola") -> None:
    print(f"{saludo}, {nombre}!")
```


```python
saludar("Marta")
```

    Hola, Marta!



```python
saludar("Marta", "Buenos días")
```

    Buenos días, Marta!



En este ejemplo, `saludo` tiene un valor por defecto de `"Hola"`, por lo que no es necesario pasarlo si queremos usar ese valor.


#### d. Parámetros arbitrarios (`*args` y `**kwargs`)

A veces queremos que una función acepte un número variable de argumentos. `*args` nos permite recibir múltiples argumentos posicionales en forma de tupla, mientras que `**kwargs` recibe múltiples argumentos con nombre en forma de diccionario.


```python
def lista_amigos(*args):
    print("Lista de amigos:")
    for amigo in args:
        print(amigo)

lista_amigos("Juan", "Ana", "Luis")
```

    Lista de amigos:
    Juan
    Ana
    Luis


Y con `**kwargs`:


```python
def informacion_persona(**kwargs):
    for clave, valor in kwargs.items():
        print(f"{clave}: {valor}")

informacion_persona(nombre="Laura", edad=28, ciudad="Madrid")
```

    nombre: Laura
    edad: 28
    ciudad: Madrid


Con estos parámetros, la función puede adaptarse a la cantidad de información que queremos pasarle, sin necesidad de definir cada parámetro por adelantado.

---

### 7. Clean Code

Aquí tienes una serie de máximas inspiradas en el libro *Clean Code* de Robert C. Martin, específicamente para definir funciones en Python. Siguiendo estas recomendaciones, lograrás que tus funciones sean claras, concisas y mantengan una alta calidad en el código:

#### a. Mantén las funciones pequeñas
   - Una función debe hacer solo una cosa y hacerlo bien. Martin sugiere que las funciones pequeñas son más fáciles de leer, comprender y mantener. Idealmente, una función debería ser de 20 líneas o menos.

#### b. Realiza una sola tarea
   - Siguiendo el principio de responsabilidad única, una función debe tener un propósito claro y único. Esto ayuda a reducir la complejidad y facilita el mantenimiento. Si sientes que estás haciendo más de una cosa en una función, divídela en varias.

#### c. Nombrado descriptivo
   - Usa nombres que describan exactamente lo que la función hace. Debe ser clara sin necesidad de comentarios adicionales. Los nombres como `calcular_total_con_impuestos` o `obtener_datos_usuario` son preferibles a nombres genéricos como `procesar_datos`.

#### d. Usa pocos parámetros
   - Idealmente, una función debería tener entre 0 y 2 parámetros. Más de tres parámetros hacen que la función sea difícil de entender y propensa a errores. Cuando necesitas más parámetros, considera agruparlos en una estructura de datos, como un diccionario o un objeto.

#### e. Evita los efectos secundarios
   - Las funciones deben evitar modificar variables fuera de su propio ámbito (sin efectos secundarios). Esto facilita la comprensión y reduce el riesgo de errores inesperados. 

#### f. Evita la duplicación
   - La duplicación de código es una señal de que deberías extraer una función. Evitar la duplicación simplifica el mantenimiento y facilita la actualización del código en un solo lugar si algo cambia.

#### g. Usa `return` para la salida de la función y mantén solo un punto de retorno
   - Mantener un único punto de salida (un solo `return`) ayuda a leer y depurar el código con mayor facilidad. Esto no es una regla estricta, pero es una buena práctica para evitar confusiones en funciones largas o complejas.

#### h. Evita los valores booleanos como parámetros
   - Los parámetros booleanos suelen ser un indicio de que una función está haciendo más de una cosa. En lugar de `procesar_datos(con_validacion=True)`, considera crear dos funciones: `procesar_datos` y `procesar_datos_con_validacion`.

#### i. Prefiere las excepciones en lugar de los códigos de error
   - Las funciones deben manejar los errores mediante excepciones en lugar de devolver códigos de error. Esto facilita el manejo de errores y mejora la legibilidad del código.

#### j. Escribe funciones con propósito claro
   - Cada función debe tener un propósito claro que se pueda expresar en una frase corta. Si es difícil explicar en pocas palabras lo que hace la función, probablemente esté haciendo demasiado.

#### k. Documenta la intención con docstrings
   - Los *docstrings* deben indicar qué hace la función, no cómo lo hace. Un buen *docstring* describe claramente el propósito de la función, los parámetros y el valor de retorno sin profundizar en los detalles de la implementación.

---

### 8. Ejercicios con funciones - II

#### a. Adivina el número

Crear una función que permita comparar un número secreto con el intento de un jugador. La función debe devolver un valor que indique si el intento del jugador es mayor, menor o igual al número secreto.

1. Crea una función llamada `comparar_numeros` que reciba dos parámetros: el `numero_secreto` (un número entero) y el `intento` (un número entero que representa el intento del jugador).
2. La función debe devolver:
   - `-1` si el `intento` es menor que el `numero_secreto`.
   - `1` si el `intento` es mayor que el `numero_secreto`.
   - `0` si el `intento` es igual al `numero_secreto`.
3. Una vez creada la función, implementa un juego dentro de un bucle `while True`, donde el jugador deberá seguir intentando adivinar el número secreto hasta que lo logre. En cada intento, la función debe ser llamada y el juego debe indicarle al jugador si debe intentar con un número mayor o menor.
4. Utiliza `input()` para que el jugador ingrese su intento. El juego debe seguir pidiendo intentos hasta que el jugador adivine el número.


```python
import random

MENSAJES = {
    0: "Ganaste!",
    1: "El número debe ser menor",
   -1: "El número debe ser mayor",
}

def comparar_numeros(numero_secreto: int, intento: int) -> int:
    if intento > numero_secreto:
        return 1
    elif intento < numero_secreto:
        return -1
    else:
        return 0 # son iguales

def jugar():
    numero_secreto = random.randint(1, 100)
    while True:
        intento = int(input("Ingresa el intento: "))
        resultado = comparar_numeros(numero_secreto, intento)
        print(MENSAJES[resultado])
        if resultado == 0:
            break

jugar()
```

    El número debe ser mayor
    El número debe ser menor
    El número debe ser menor
    El número debe ser mayor
    El número debe ser menor
    El número debe ser mayor
    Ganaste!


#### b. Juego de dados

1. Simulación de lanzamiento de dado:
   - Crea una función llamada `lanzar_dado()` que no reciba parámetros y devuelva un número aleatorio entre 1 y 6, simulando el lanzamiento de un dado.
   - Utiliza la función `random.randint()` para obtener el número aleatorio.

2. Juego de competencia:
   - Crea una función llamada `jugar()` donde el jugador y la computadora lanzan un dado.
   - El jugador debe ingresar el número de veces que desea lanzar el dado. En cada intento, el jugador lanzará el dado y la computadora también lo hará de forma aleatoria.
   - La función `jugar()` debe imprimir los resultados de cada lanzamiento, indicando quién ganó cada ronda (jugador o computadora) y mostrar el puntaje total después de todas las rondas.
   - Al final del juego, la función debe imprimir quién ganó (si el jugador tiene más puntos que la computadora, el jugador gana; si es al revés, gana la computadora).
   - El juego se detendrá cuando el jugador decida no continuar.

3. Requerimientos:
   - Utiliza la función `lanzar_dado()` para simular el lanzamiento del dado tanto para el jugador como para la computadora.
   - Usa un bucle para que el jugador decida cuántas rondas jugar.
   - Debes manejar correctamente el puntaje y la impresión de los resultados de cada ronda.

4. Ejemplo de salida:
```
Ronda 1
Humano: 1
Computadora: 1
Empate.

Ronda 2
Humano: 4
Computadora: 4
Empate.

Ronda 3
Humano: 5
Computadora: 4
El humano ganó esta ronda.

Ronda 4
Humano: 2
Computadora: 6
La computadora ganó esta ronda.

Puntaje final
Humano: 1
Computadora: 1
El juego terminó en empate.
```


```python
import random

def lanzar_dado() -> int:
    return random.randint(1, 6)

def jugar() -> None:
    rondas = int(input("¿Cuántas rondas quieres jugar? "))
    puntaje_humano: int = 0
    puntaje_computadora: int = 0

    for ronda in range(1, rondas + 1):
        humano: int = lanzar_dado()
        computadora: int = lanzar_dado()
        mostrar_ronda(ronda, humano, computadora)
        if humano > computadora:
            puntaje_humano += 1
        elif computadora > humano:
            puntaje_computadora += 1
    
    mostrar_final_juego(puntaje_humano, puntaje_computadora)

def mostrar_ronda(ronda: int, humano: int, computadora: int) -> None:
    print(f"\nRonda {ronda}")
    print(f"Humano: {humano}")
    print(f"Computadora: {computadora}")
    mostrar_ganador_ronda(humano, computadora)

def mostrar_final_juego(puntaje_humano: int, puntaje_computadora: int) -> None:
    print("\nPuntaje final")
    print(f"Humano: {puntaje_humano}")
    print(f"Computadora: {puntaje_computadora}")
    mostrar_ganador_juego(puntaje_humano, puntaje_computadora)

def mostrar_ganador_ronda(humano: int, computadora: int) -> None:
    if humano > computadora:
        print("El humano ganó esta ronda.")
    elif computadora > humano:
        print("La computadora ganó esta ronda.")
    else:
        print("Empate.")

def mostrar_ganador_juego(puntaje_humano: int, puntaje_computadora: int) -> None:
    if puntaje_humano > puntaje_computadora:
        print("El humano ganó el juego.")
    elif puntaje_computadora > puntaje_humano:
        print("La computadora ganó el juego.")
    else:
        print("El juego terminó en empate.")

jugar()
```

    
    Ronda 1
    Humano: 4
    Computadora: 4
    Empate.
    
    Ronda 2
    Humano: 3
    Computadora: 4
    La computadora ganó esta ronda.
    
    Ronda 3
    Humano: 5
    Computadora: 4
    El humano ganó esta ronda.
    
    Ronda 4
    Humano: 3
    Computadora: 2
    El humano ganó esta ronda.
    
    Puntaje final
    Humano: 2
    Computadora: 1
    El humano ganó el juego.


#### c. Juego de "Piedra, Papel o Tijera"

Crear un juego sencillo de "Piedra, Papel o Tijera" donde el jugador compita contra la computadora. El juego debe estar organizado en funciones para separar las distintas tareas.

1. Función `opcion_humano()`:
   - Crea una función llamada `opcion_humano()` que permita al jugador elegir entre "piedra", "papel" o "tijera". La función debe validar que la opción ingresada sea válida (debe ser una de estas tres opciones). Si el jugador ingresa algo incorrecto, la función debe pedirle que ingrese de nuevo.

2. Función `opcion_computadora()`:
   - Crea una función llamada `opcion_computadora()` que simule la elección de la computadora. La computadora debe elegir aleatoriamente entre "piedra", "papel" o "tijera".

3. Función `detectar_ganador()`:
   - Crea una función llamada `detectar_ganador()` que reciba como parámetros la opción del humano y la opción de la computadora. La función debe comparar ambas opciones y devolver un mensaje indicando quién ha ganado ("Humano", "Computadora" o "Empate").

4. Función `jugar()`:
   - Crea una función llamada `jugar()` que se encargue de coordinar el flujo del juego. Esta función debe:
     - Llamar a `opcion_humano()` para obtener la elección del humano.
     - Llamar a `opcion_computadora()` para obtener la elección de la computadora.
     - Llamar a `detectar_ganador()` para determinar el ganador y mostrar el resultado.
     - Preguntar al jugador si quiere jugar otra ronda.

5. Requerimientos:
    - Utiliza la función `random.choice()` para que la computadora haga su elección de manera aleatoria.
    - Utiliza un bucle para permitir al jugador jugar varias rondas si lo desea.
    - El juego debe seguir pidiendo opciones hasta que el jugador decida no jugar más.

6. Ejemplo de salida:

```
Humano: piedra
Computadora: piedra
Empate.

Humano: papel
Computadora: piedra
El humano ganó esta ronda.

Humano: tijera
Computadora: piedra
La computadora ganó esta ronda.

Gracias por jugar.
```


```python
import random

OPCIONES = ['piedra', 'papel', 'tijera']

def opcion_humano() -> str:
    while True:
        opcion = input(f"Elige entre {', '.join(OPCIONES)}: ").lower()
        if opcion in OPCIONES:
            return opcion
        else:
            print("Opción no válida.")

def opcion_computadora() -> str:
    return random.choice(OPCIONES)

def detectar_ganador(humano: str, computadora: str) -> str:
    if humano == computadora:
        return "Empate."
    elif (humano == 'piedra' and computadora == 'tijera') or \
         (humano == 'papel' and computadora == 'piedra') or \
         (humano == 'tijera' and computadora == 'papel'):
        return "El humano ganó esta ronda."
    else:
        return "La computadora ganó esta ronda."

def mostrar_ganador_ronda(humano: str, computadora: str) -> None:
    print(f"\nHumano: {humano}")
    print(f"Computadora: {computadora}")
    print(detectar_ganador(humano, computadora))
    
def jugar() -> None:
    while True:
        humano = opcion_humano()
        computadora = opcion_computadora()
        mostrar_ganador_ronda(humano, computadora)
        if input("Jugar otra vez? (s/n)").strip().lower() == 'n':
            print("\nGracias por jugar.")
            break

jugar()
```

    
    Humano: piedra
    Computadora: tijera
    El humano ganó esta ronda.
    
    Humano: papel
    Computadora: piedra
    El humano ganó esta ronda.
    
    Humano: tijera
    Computadora: tijera
    Empate.
    
    Gracias por jugar.

