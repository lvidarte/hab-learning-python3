# Tipos y Variables en Python - Material complementario

### 1. ¿Qué es un programa?

La naturaleza de un programa de computadora es esencialmente la de un sistema diseñado para procesar datos y producir resultados útiles o significativos. Un programa sin datos carece de propósito, ya que su función principal es recibir, manipular, almacenar, y devolver información de alguna manera. Dicho de otro modo, **sin datos, un programa no tiene razón de ser** porque su existencia depende de la interacción con la información.

#### a. Flujo de un programa: Datos → Proceso → Resultado

1. **Entrada de Datos**  
   El programa necesita datos para comenzar su ejecución. Estos datos pueden provenir de diferentes fuentes: 
   - Un usuario (mediante un formulario, teclado, voz, etc.)
   - Un archivo (como una base de datos, un archivo de texto)
   - Sensores (en el caso de dispositivos IoT o robots)
   - Otros programas o sistemas (mediante APIs, servicios web, etc.)

   **Ejemplo**:  
   Un programa que calcula el promedio de una serie de números necesita recibir esa serie como entrada. Sin estos números, no tendría sentido que el programa existiera.

   ```python
   numeros = [5, 8, 3, 10]  # Datos de entrada
   ```

2. **Proceso**  
   El programa toma los datos ingresados y los procesa, aplicando reglas lógicas, cálculos matemáticos o transformaciones. Durante este paso, los algoritmos y la lógica del programa trabajan sobre los datos para transformarlos en algo útil. Este procesamiento puede incluir:
   - Operaciones matemáticas
   - Filtrado o clasificación de información
   - Comparación de datos
   - Transformación de formatos

   **Ejemplo**:  
   El programa que calcula el promedio sumará todos los números y los dividirá por la cantidad de elementos.

   ```python
   suma = sum(numeros)    # Proceso: suma de los números
   promedio = suma / len(numeros)  # Proceso: cálculo del promedio
   ```

3. **Resultado o Salida**  
   Después de procesar los datos, el programa produce un resultado. Este resultado es la razón por la cual el programa fue creado: resolver un problema, proporcionar información, o ejecutar una acción específica. La salida puede ser:
   - Un valor o resultado impreso en la pantalla
   - Datos almacenados en un archivo o base de datos
   - Un mensaje o notificación para el usuario
   - Una acción tomada por un dispositivo (como encender una luz)

   **Ejemplo**:  
   El programa finalmente muestra el promedio calculado.

   ```python
   print(f"El promedio es {promedio}")  # Resultado
   ```

#### b. Sin datos, el programa es inútil
Un programa sin datos es como una calculadora sin números. No tiene nada que procesar, analizar o resolver. El propósito de un programa radica en recibir y trabajar con datos para producir algo significativo. Si no hay datos de entrada, no puede haber procesamiento ni resultados, lo que hace que el programa pierda su razón de existir.


#### c. Un algoritmo que resuelve un problema
Un programa puede definirse, complementariamente, como la implementación de un [algoritmo](https://es.wikipedia.org/wiki/Algoritmo). Un algoritmo es una secuencia de pasos lógicos para resolver un problema específico. La clave está en cómo el programa transforma una situación inicial en una solución final a través de operaciones definidas. Esta definición es más abstracta y resalta la lógica y estructura interna del programa, más allá de la interacción con datos.

**Ejemplo:** Un algoritmo de ordenación que organiza una lista de números es un conjunto de instrucciones que resuelven el problema de organizar elementos de forma ordenada.

Ambas definiciones son válidas y se refuerzan entre sí:
- Un programa, como sistema de procesamiento de datos, necesita algoritmos para definir las reglas y pasos con los que manipula los datos.
- A su vez, un programa basado en un algoritmo necesita datos para resolver un problema específico y generar una salida significativa.

---

### 2. Introducción a las funciones incorporadas (built-in) en Python

*Ref.*: https://docs.python.org/es/3/library/functions.html

En Python, una **función** es un bloque de código reutilizable que realiza una tarea específica. Una función puede recibir **parámetros** (datos de entrada), realizar un procesamiento, y opcionalmente devolver un **resultado**. Las funciones son fundamentales porque permiten estructurar y organizar el código de manera modular, facilitando su reutilización y legibilidad.

Por ejemplo, la función `print()` toma un valor y lo muestra en la consola.

#### a. Sintaxis Básica de una Función
```python
def nombre_funcion(parametros):
    # Bloque de código que realiza un proceso
    return resultado
```

Podemos decir que una función es, en sí misma, un programa en miniatura, ya que cumple con los mismos principios básicos de procesamiento de datos y producción de resultados.

#### b. Funciones built-in

**Funciones built-in** (predefinidas o incorporadas) son aquellas que Python proporciona de manera predeterminada, sin necesidad de que el usuario las defina. Estas funciones están listas para usar y cubren una gran variedad de tareas comunes, desde operaciones matemáticas hasta manipulación de cadenas y manejo de estructuras de datos.

Algunas funciones built-in importantes son:

1. **`print()`**: Muestra valores en la consola.


```python
print("Hola, mundo!")
```

    Hola, mundo!


2. **`len()`**: Devuelve la cantidad de elementos de una lista, cadena u objeto iterable.


```python
print(len("Python"))
```

    6


3. **`type()`**: Devuelve el tipo de dato de un objeto.


```python
print(type(42))
```

    <class 'int'>


4. **`int()`, `float()`, `str()`**: Convierte datos de un tipo a otro.


```python
print(int("10"))  # Convierte una cadena a entero.
```

    10



```python
print(float("3.14"))  # Convierte una cadena a flotante.
```

    3.14



```python
print(str(42))  # Convierte un entero a cadena.
```

    42


5. **`sum()`**: Suma todos los elementos de un iterable (como una lista).


```python
print(sum([1, 2, 3]))
```

    6


6. **`max()` y `min()`**: Devuelven el valor máximo y mínimo de un iterable.


```python
print(max([1, 5, 3]))
```

    5



```python
print(min([1, 5, 3]))
```

    1


7. **`input()`**: Permite al usuario ingresar datos desde el teclado.


```python
nombre = input("¿Cuál es tu nombre? ")  # Pide al usuario que ingrese su nombre
print("Hola, " + nombre)
```

    Hola, Leo


8. **`range()`**: Genera una secuencia de números.


```python
for i in range(5):
    print(i)
```

    0
    1
    2
    3
    4


9. **`abs()`**: Devuelve el valor absoluto de un número.


```python
print(abs(-10))
```

    10


#### c. Importancia de las Funciones Built-in
Las funciones built-in son extremadamente útiles porque:
- **Ahorro de tiempo**: No necesitas reinventar la rueda, ya que Python te proporciona muchas funciones predefinidas.
- **Simplicidad**: Permiten realizar tareas comunes de forma directa y con menos código.
- **Eficiencia**: Están optimizadas para ser rápidas y eficientes, lo que mejora el rendimiento del programa.

---

### 3. La abstracción

La abstracción es un concepto fundamental en la programación y se refiere a la capacidad de simplificar la complejidad al ocultar los detalles innecesarios y resaltar lo esencial.

La abstracción en el contexto de las funciones permite a los programadores trabajar de manera más eficiente y efectiva, enfocándose en la solución de problemas y el desarrollo de aplicaciones sin la carga de tener que entender cada detalle de la implementación subyacente. Esto es crucial para la creación de software complejo, donde la gestión de la complejidad es fundamental para el éxito del proyecto.

En el contexto de las funciones en Python, la abstracción permite a los usuarios interactuar con funciones incorporadas sin tener que entender cómo están implementadas internamente. Los usuarios interactúan con estas funciones a través de la interfaz de Python, sin necesidad de conocer su implementación subyacente, sin preocuparse por los detalles de su implementación en C. Esto se logra mediante:

1. **Simplicidad de Uso**: Las funciones built-in tienen nombres descriptivos y parámetros intuitivos, lo que permite a los programadores utilizarlas sin tener que aprender su lógica interna. Por ejemplo, una función como `len()` es fácil de entender y usar para contar elementos en una lista o cadena.

2. **Encapsulamiento**: La implementación de la función está encapsulada, es decir, se encuentra oculta detrás de una interfaz que permite llamar a la función y obtener resultados sin conocer cómo se logra eso internamente. Esto permite a los desarrolladores centrarse en el problema que están resolviendo en lugar de en cómo se realizan los cálculos específicos.

3. **Reutilización**: La abstracción permite reutilizar funciones sin tener que recrearlas cada vez. Los programadores pueden confiar en que las funciones built-in funcionan correctamente y se comportan como se espera, lo que ahorra tiempo y esfuerzo.

4. **Facilitación del Aprendizaje**: Para los nuevos programadores, la abstracción hace que el lenguaje sea más accesible. Al interactuar con funciones sin necesidad de comprender los detalles de su implementación, pueden concentrarse en aprender conceptos de programación y lógica.

5. **Reducción de Errores**: Al utilizar funciones ya probadas y optimizadas, los programadores pueden minimizar la introducción de errores en su código. En lugar de tener que escribir sus propias implementaciones para tareas comunes, pueden aprovechar las funciones built-in, que han sido cuidadosamente desarrolladas y testeadas.

---

### 4. Manejo de variables en Python

En Python, una variable es un nombre que actúa como una etiqueta para referirse a un objeto almacenado en la memoria. Las variables no contienen directamente los valores, sino que apuntan a objetos que representan esos valores. Esto significa que cuando asignas un valor a una variable, lo que realmente haces es crear un objeto que contiene ese valor y luego vinculas el nombre de la variable a ese objeto.

Por ejemplo, si asignas `x = 10`, Python crea un objeto que representa el número entero `10` y la variable `x` apunta a ese objeto.

#### a. Funcionamiento de las variables como etiquetas

En Python, las variables son como etiquetas que pueden asociarse a cualquier objeto, sin estar limitadas por un tipo de dato específico. Esto permite una gran flexibilidad. Si reasignas una variable, simplemente cambias la etiqueta para que apunte a otro objeto.


```python
x = 10  # 'x' apunta al objeto 10
x = "Hola" # ahora 'x' apunta a un objeto str con valor "Hola"
```

Como resultado, las variables en Python no están "atadas" a un tipo de dato fijo, ya que **en Python el tipo está asociado al objeto y no a la variable**.

#### b. ¿Qué es un Objeto?

Un objeto en programación, y específicamente en Python, es una entidad que contiene datos (también conocidos como atributos o propiedades) y comportamientos (métodos o funciones asociadas). Los objetos son instancias de clases, que son como planos o moldes que definen qué propiedades y comportamientos deben tener los objetos.

#### c. En Python todo es un objeto

Un concepto clave en Python es que **todo es un objeto**. Los números, cadenas de texto, listas, funciones e incluso las propias clases son objetos. Cada objeto tiene un tipo asociado que define el comportamiento y las propiedades que tiene. Esto significa que incluso los tipos de datos primitivos (como enteros y cadenas) son objetos de la clase correspondiente (int, str, etc.).

#### d. Gestión automática de memoria 

Python se encarga de manejar la memoria automáticamente. Cuando un objeto ya no tiene referencias, Python lo elimina (recolección de basura).

La **gestión automática de memoria** en Python es manejada por un sistema conocido como **recolección de basura (garbage collection)**, a través del módulo [gc](https://docs.python.org/es/3/library/gc.html). Python utiliza un contador de referencias para rastrear cuántas variables o etiquetas hacen referencia a un objeto en la memoria. Cada vez que se crea una nueva referencia a un objeto, este contador se incrementa, y cuando una referencia deja de existir (por ejemplo, cuando una variable se reasigna a otro objeto), el contador disminuye. Cuando el contador de referencias de un objeto llega a cero, significa que no hay ninguna variable o etiqueta que lo esté utilizando, por lo que el intérprete de Python libera la memoria ocupada por ese objeto, eliminándolo de la memoria automáticamente.


```python
x = "hola"  # Se crear en memoria el objeto "hola". 'x' referencia a ese objeto.
x = 1  # Ahora 'x' referencia a 1. El objeto "Hola" ya no tiene referencias. Se elimina.
```

---

### 5. Tipado dinámico

El **tipado dinámico** es una característica clave en Python, donde el tipo de una variable se determina en tiempo de ejecución y no en tiempo de compilación. En lugar de declarar el tipo de una variable de antemano, el intérprete de Python asigna el tipo automáticamente según el valor que se le asigne. Por ejemplo, si asignas un número entero a una variable, Python entiende que es un entero, y si luego le asignas una cadena de texto, Python cambia el tipo de esa variable automáticamente.

#### a. Ventajas del tipado dinámico
1. **Flexibilidad**: El no tener que declarar los tipos de variables, hace que el código sea más simple y rápido de escribir.
2. **Facilidad de uso**: Facilita la escritura rápida de código y la experimentación con diferentes tipos de datos.

#### b. Desventajas del tipado dinámico
1. **Errores en tiempo de ejecución**: Los errores relacionados con tipos de datos incorrectos pueden ocurrir en tiempo de ejecución, lo que puede ser menos deseable en aplicaciones críticas.
2. **Rendimiento**: Los lenguajes con tipado dinámico suelen ser más lentos que aquellos con tipado estático, ya que los tipos se determinan en tiempo de ejecución.


#### c. Comparación entre tipado dinámico y tipado estático:

| Lenguaje      | Tipo de Tipado   | Declaración de Tipos                              |
|---------------|------------------|--------------------------------------------------|
| **Python**    | Dinámico          | No es necesario declarar el tipo de las variables.|
| **JavaScript**| Dinámico          | No requiere la declaración de tipos.             |
| **C**         | Estático          | Los tipos deben declararse explícitamente.        |
| **C++**       | Estático          | Los tipos deben declararse explícitamente.        |
| **Java**      | Estático          | Requiere la declaración explícita de tipos.       |
| **Go**        | Estático          | Los tipos deben declararse o inferirse en tiempo de compilación. |
| **PHP**       | Dinámico          | No es necesario declarar tipos de variables.      |
| **C#**        | Estático          | Tipado fuerte con verificación de tipos en tiempo de compilación. |

---

### 6. Tipado estático opcional

Python 3 introdujo la característica de **tipado estático opcional** mediante el módulo **[typing](https://docs.python.org/es/3/library/typing.html)**, que permite la **definición de tipos** en variables, parámetros de funciones, y valores de retorno. Esta funcionalidad es una herramienta de ayuda para los desarrolladores y editores de código, pero Python sigue siendo un lenguaje **dinámicamente tipado**, lo que significa que no fuerza el cumplimiento de estos tipos en tiempo de ejecución.

#### a. Cómo funciona la definición de tipos

Con esta característica, puedes especificar qué tipos de datos se esperan en las variables o funciones, lo que hace que el código sea más fácil de entender, mantener, y menos propenso a errores. Sin embargo, estas anotaciones de tipos no son verificadas por Python durante la ejecución, sino que sirven para análisis estáticos (por ejemplo, con herramientas como **[mypy](https://www.mypy-lang.org/)**).

#### b. Ejemplo básico de anotaciones de tipos


```python
def suma(a: int, b: int) -> int:
    return a + b

x: str = "Hola"
y: int = 10
```

En este ejemplo:
- En la función `suma`, se indica que los parámetros `a` y `b` deben ser enteros (`int`) y que la función devolverá también un entero.
- La variable `x` está anotada como una cadena (`str`), y `y` como un entero (`int`).

#### c. Ventajas

1. **Mejor legibilidad y documentación**: Anotar los tipos ayuda a los programadores a comprender rápidamente el propósito y los requisitos de las funciones y variables sin necesidad de leer todo el código.
2. **Detección temprana de errores**: Herramientas de análisis estático pueden detectar errores antes de que el código se ejecute, lo que facilita la depuración.
3. **Ayuda en editores y autocompletado**: Los editores de texto modernos, como **[VSCode](https://code.visualstudio.com/)** o **[PyCharm](https://www.jetbrains.com/pycharm/)**, pueden usar estas anotaciones de tipos para ofrecer autocompletado y verificación de errores.

---

### 7. Diferencia entre función y método

En Python, la **diferencia principal** entre una **función* y *un **método** radica en su contexto y uso:

- **Función**: Es un bloque de código independiente diseñado para realizar una tarea específica, y puede ser invocada desde cualquier parte del programa. Un ejemplo de esto son las funciones `built-in` mencionadas anteriormente. A diferencia de los métodos, las funciones no están vinculadas a ningún objeto o clase en particular.

- **Método**: Es similar a una función, pero está asociado a un objeto o clase. Los métodos son funciones que pertenecen a un objeto y se invocan sobre instancias de ese objeto, lo que significa que tienen acceso a los atributos y otros métodos del objeto.

#### b. Métodos de los objetos `str`

El objeto `str` en Python representa cadenas de texto y es uno de los tipos de datos más utilizados en la programación. Las cadenas en Python son **objetos inmutables**, lo que significa que una vez creadas, no pueden ser modificadas. Sin embargo, Python proporciona una amplia variedad de **métodos** que permiten realizar operaciones sobre las cadenas de texto.

A continuación, se describen algunos de los métodos más comunes del objeto `str`, junto con ejemplos de su uso:

1. **`str.upper()`**: Convierte todos los caracteres de la cadena a mayúsculas.


```python
texto = "hola mundo"
resultado = texto.upper()
print(resultado)
```

    HOLA MUNDO


2. **`str.lower()`**: Convierte todos los caracteres de la cadena a minúsculas.


```python
texto = "HOLA MUNDO"
print(texto.lower()) 
```

    hola mundo


3. **`str.replace(old, new)`**: Reemplaza todas las ocurrencias de una subcadena (`old`) con otra subcadena (`new`).


```python
texto = "hola mundo"
resultado = texto.replace("mundo", "Python")
print(resultado)
```

    hola Python


4. **`str.startswith(prefix)`**: Verifica si la cadena comienza con el prefijo especificado y devuelve `True` o `False`.


```python
texto = "hola mundo"
print(texto.startswith("hola"))
```

    True

