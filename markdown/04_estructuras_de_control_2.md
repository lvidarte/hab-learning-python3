# Estructuras de Control en Python - Material complementario

### 1. Introducción a las estructuras de control en programación

Las **estructuras de control** son componentes fundamentales en la programación que permiten tomar decisiones, repetir tareas y dirigir el flujo de ejecución de un programa. Gracias a estas estructuras, un programa puede responder de manera dinámica a diferentes condiciones y situaciones, permitiendo que el código se adapte a diversas entradas y circunstancias.

Existen principalmente dos tipos de estructuras de control:

1. **Estructuras de control de selección (o condicionales)**: Permiten ejecutar diferentes bloques de código según condiciones específicas. Las más comunes son `if`, `else` y `elif`.

2. **Estructuras de control de repetición (o bucles)**: Permiten ejecutar un bloque de código varias veces. Los bucles más utilizados son `for` y `while`.

---

### 2. Introducción a los bloques en Python

En programación, un **bloque** es un grupo de declaraciones que se ejecutan juntas como una unidad. Los bloques son fundamentales para estructurar el código y controlar el flujo de ejecución. En muchos lenguajes de programación, los bloques se delimitan con llaves (`{}`), pero en Python, se utiliza la indentación para definir bloques de código.

#### a. Definición de bloques en Python

En Python, la indentación es crucial y es la forma en que el lenguaje determina qué líneas de código pertenecen a un bloque determinado. La **[convención estándar definida en pep8 es usar 4 espacios](https://peps.python.org/pep-0008/#indentation)** para cada nivel de indentación. Esto significa que cuando se escribe un bloque de código, todas las líneas dentro del bloque deben estar alineadas con 4 espacios adicionales respecto a la línea anterior que inicia el bloque.

#### b. Ejemplo de uso de bloques

A continuación, se muestra un ejemplo simple utilizando una estructura de control `if` para ilustrar cómo se definen los bloques en Python:

```python
x = 10

if x > 5:
    print("x es mayor que 5")
    print("Este es otro mensaje dentro del bloque if")
print("Este mensaje está fuera del bloque if")
```

#### c. Comparación con otros lenguajes

En muchos otros lenguajes de programación, como C, C++, y Java, los bloques de código se definen utilizando llaves. Por ejemplo:

```c
if (x > 5) {
    printf("x es mayor que 5");
    printf("Este es otro mensaje dentro del bloque if");
}
printf("Este mensaje está fuera del bloque if");
```

#### d. Características clave en Python

1. **Terminación de líneas**: En Python, cada línea dentro de un bloque termina con un salto de línea (`\n`) y no con un punto y coma (`;`) como en muchos otros lenguajes. Esto no solo mejora la legibilidad, sino que también obliga a los programadores a organizar su código de manera más clara. En lenguajes que utilizan `;`, es posible escribir múltiples instrucciones en la misma línea, lo que puede llevar a un código menos legible y más difícil de mantener.

2. **Legibilidad**: La indentación forzada hace que el código sea más legible y más fácil de entender. Un bloque bien indentado permite a los programadores identificar rápidamente la estructura lógica del código.

3. **Reducción de errores**: Al eliminar la necesidad de llaves, se minimizan los errores que pueden surgir de no cerrar adecuadamente los bloques. La correcta indentación se convierte en un requisito del lenguaje, lo que evita omisiones.

4. **Simplicidad**: La simplicidad de la sintaxis de Python, que utiliza espacios en lugar de caracteres adicionales, contribuye a un código más limpio y menos cargado.

#### c. IndentationError

Un `IndentationError` en Python ocurre cuando la indentación del código no es coherente o correcta. A continuación, se presenta un ejemplo simple que ilustra cómo se produce este error:


```python
x = 10

if x > 5:
    print("x es mayor que 5")
 print("Esto causará un IndentationError")
```


      File <string>:5
        print("Esto causará un IndentationError")
                                                 ^
    IndentationError: unindent does not match any outer indentation level



---

### 3. Ejercicios con `if` `else`

#### a. Calcular el precio de un producto con descuento

Pide al usuario el precio de un producto y aplica un descuento según este criterio:
   - Si el precio es mayor a 1000, aplica un 15% de descuento.
   - Si está entre 500 y 1000, aplica un 10% de descuento.
   - Si es menor a 500, aplica un 5% de descuento.
Muestra el precio final con el descuento aplicado.

```python
# Ejemplo de salida esperada:
# Precio del producto: 750
# Resultado: El precio final con descuento es de 675.0
```


```python

```

#### b. Descuento por cantidad comprada

Escribe un programa que pida al usuario el precio de un producto y la cantidad de unidades que quiere comprar. Aplica un descuento basado en la cantidad:
   - Si compra entre 1 y 5 unidades, aplica un 5% de descuento.
   - Si compra entre 6 y 10 unidades, aplica un 10% de descuento.
   - Si compra más de 10 unidades, aplica un 15% de descuento.

Muestra el precio final con el descuento aplicado.

```python
# Ejemplo de salida esperada:
# Ingresa el precio del producto: 200
# Ingresa la cantidad de unidades: 8
# Resultado: El precio final con descuento es 1440.0
```


```python

```

#### c. Cálculo de aumento de precio según la categoría del producto

Pide al usuario ingresar el precio de un producto y la categoría a la que pertenece:
   - "A": aplica un aumento del 20%
   - "B": aplica un aumento del 10%
   - "C": aplica un aumento del 5%

Si la categoría ingresada no es válida, muestra un mensaje de error. Calcula el precio final con el aumento y muestra el resultado.

```python
# Ejemplo de salida esperada:
# Ingresa el precio del producto: 150
# Ingresa la categoría (A/B/C): B
# Resultado: El precio final con aumento es 165.0
```


```python

```

#### d. Calificación de un estudiante

Escribe un programa que le pida al usuario una calificación entre 0 y 100 y que determine la letra correspondiente:
   - 90 a 100: "A"
   - 80 a 89: "B"
   - 70 a 79: "C"
   - 60 a 69: "D"
   - Menor a 60: "F"

Muestra la letra correspondiente.

```python
# Ejemplo de salida esperada:
# Ingresa la calificación: 85
# Resultado: La calificación es B
```


```python

```

#### e. Clasificación de temperaturas

Escribe un programa que pida al usuario una temperatura en grados Celsius entre -100 y 100, y la clasifique en:
   - Menor a 0: "Frío extremo"
   - Entre 0 y 15: "Frío"
   - Entre 16 y 25: "Templado"
   - Mayor a 25: "Calor"

```python
# Ejemplo de salida esperada:
# Ingresa la temperatura en Celsius: 18
# Resultado: La temperatura es templada.
```


```python

```

#### f. Verificar acceso según el rol de usuario

Solicita al usuario que ingrese su rol en una plataforma (administrador, editor o visitante) y muestra un mensaje con los permisos correspondientes:
   - Administrador: “Tienes acceso total.”
   - Editor: “Tienes acceso limitado para editar.”
   - Visitante: “Tienes acceso de solo lectura.”

```python
# Ejemplo de salida esperada:
# Ingresa tu rol (administrador/editor/visitante): editor
# Resultado: Tienes acceso limitado para editar.
```


```python

```

#### g. Determinar si un número es divisible entre 2 y entre 3

Solicita al usuario un número y verifica si es divisible entre 2, entre 3 o entre ambos.

```python
# Ejemplo de salida esperada:
# Ingresa un número: 12
# Resultado: El número es divisible entre 2 y entre 3.
```


```python

```

#### h. Verificar la longitud de una palabra

Escribe un programa que pida al usuario una palabra y verifique su longitud:
   - Menos de 4 caracteres: “Palabra corta.”
   - Entre 4 y 8 caracteres: “Palabra de longitud media.”
   - Más de 8 caracteres: “Palabra larga.”

```python
# Ejemplo de salida esperada:
# Ingresa una palabra: programación
# Resultado: Palabra larga.
```


```python

```

#### i. Tipo de triángulo según los lados

Escribe un programa que pida al usuario tres números enteros que representan los lados de un triángulo: 
   - Equilátero: todos los lados iguales
   - Isósceles: dos lados iguales
   - Escaleno: todos los lados diferentes

Si los valores no cumplen con la propiedad de un triángulo válido (la suma de dos lados debe ser mayor al tercer lado), muestra un mensaje indicando que no forman un triángulo.

```python
# Ejemplo de salida esperada:
# Ingresa el primer lado: 5
# Ingresa el segundo lado: 5
# Ingresa el tercer lado: 8
# Resultado: Es un triángulo isósceles.
```


```python

```

#### j. Verificar condiciones meteorológicas complejas

Pide al usuario la temperatura y el nivel de humedad. Luego, determina el tipo de clima:
   - Si la temperatura es menor a 10°C y la humedad es mayor al 80%, indica "Frío y húmedo".
   - Si la temperatura es menor a 10°C y la humedad es menor o igual a 80%, indica "Frío y seco".
   - Si la temperatura está entre 10°C y 25°C y la humedad es mayor al 60%, indica "Templado y húmedo".
   - Si la temperatura está entre 10°C y 25°C y la humedad es menor o igual a 60%, indica "Templado y seco".
   - Si la temperatura es mayor a 25°C, verifica si la humedad es mayor a 50% para indicar "Caluroso y húmedo" o "Caluroso y seco" en caso contrario.

```python
# Ejemplo de salida esperada:
# Ingresa la temperatura en °C: 27
# Ingresa el nivel de humedad (%): 40
# Resultado: Caluroso y seco.
```


```python

```

#### k. Verificar contraseña segura

Escribe un programa que pida una contraseña al usuario y la verifique según los siguientes criterios:
   - Si tiene menos de 8 caracteres: "Contraseña débil"
   - Si tiene 8 caracteres o más, pero no contiene ni números ni caracteres especiales, muestra "Contraseña moderada"
   - Si cumple con tener 8 caracteres o más, y además contiene números y al menos un carácter especial (!, @, #, $, %, &, *), muestra "Contraseña segura".

```python
# Ejemplo de salida esperada:
# Ingresa tu contraseña: clave123!
# Resultado: Contraseña segura.
```


```python

```

---

### 3. Diferencias entre el bucle `for` tradicional y el `for` en Python

El bucle `for` es una estructura de control fundamental que se utiliza para iterar sobre una secuencia de elementos, como listas, tuplas o cadenas. Sin embargo, la forma en que se implementa varía entre los lenguajes de programación. A continuación, se analizan las diferencias entre un bucle `for` tradicional, como el que se encuentra en C o Java, y el bucle `for` en Python.

#### a. Sintaxis

- **Bucle `for` tradicional (C/C++/Java)**

  En lenguajes como C o Java, el bucle `for` tiene una sintaxis más estructurada y requiere inicialización, condición y actualización dentro de la declaración:

  ```c
  for (int i = 0; i < 10; i++) {
      printf("%d\n", i);
  }
  ```

  - Inicialización: `int i = 0;` - Se inicializa una variable de control.
  - Condición: `i < 10;` - Se evalúa antes de cada iteración.
  - Actualización: `i++` - Se incrementa después de cada iteración.

- **Bucle `for` en Python**

  En Python, el bucle `for` tiene una sintaxis más simple y se basa en la iteración sobre elementos de una colección:

  ```python
  for i in range(10):
      print(i)
  ```

#### b. Tipo de iteración

- **Bucle `for` tradicional**

  Los bucles `for` tradicionales a menudo se utilizan con un contador que se incrementa en cada iteración. Esto puede dar lugar a errores si la condición no se maneja correctamente.

- **Bucle `for` en Python**

  El bucle `for` en Python es inherentemente más flexible. Permite iterar directamente sobre cualquier objeto iterable, como listas, diccionarios, o cadenas, **sin necesidad de un contador**:

  ```python
  frutas = ["manzana", "banana", "cereza"]
  for fruta in frutas:
      print(fruta)
  ```

#### c. Manejo de la indentación

- **Bucle `for` tradicional**

  En lenguajes como C o Java, los bloques de código dentro del bucle `for` se delimitan con llaves (`{}`):

  ```c
  for (int i = 0; i < 10; i++) {
      printf("%d\n", i);
  }
  ```

- **Bucle `for` en Python**

  Python utiliza la indentación para definir el bloque de código, lo que contribuye a la legibilidad:

  ```python
  for i in range(10):
      print(i)  # Este código pertenece al bloque del for
  ```

#### d. Control de flujo

- **Bucle `for` tradicional**

  En muchos lenguajes, puedes usar `break` y `continue` para controlar el flujo de la iteración:

  ```c
  for (int i = 0; i < 10; i++) {
      if (i == 5) break; // Sale del bucle cuando i es 5
      printf("%d\n", i);
  }
  ```

- **Bucle `for` en Python**

  Python también permite el uso de `break` y `continue`, pero de una manera más legible gracias a la indentación:

  ```python
  for i in range(10):
      if i == 5:
          break  # Sale del bucle cuando i es 5
      print(i)
  ```

---

### 4. ¿Qué es un Iterable en Python?

Un **iterable** en Python es cualquier objeto que se puede recorrer en un bucle. Esto significa que puedes usar un `for` para acceder a sus elementos uno por uno. Los iterables son fundamentales en Python, ya que permiten trabajar con colecciones de datos de manera eficiente.

#### a. Características de los iterables

1. **Recorrido**: Los iterables pueden ser recorridos usando bucles, lo que permite acceder a cada elemento secuencialmente.
   
2. **Método `__iter__()`**: Un objeto se considera iterable si implementa el método especial `__iter__()`, que devuelve un iterador. Este iterador, a su vez, debe implementar el método `__next__()` para acceder a los elementos de forma secuencial.

3. **Tipos comunes de iterables**: Los tipos de datos comunes que son iterables incluyen:
   - Listas (`list`)
   - Tuplas (`tuple`)
   - Cadenas (`str`)
   - Conjuntos (`set`)
   - Diccionarios (`dict`)
   - Rangos (`range`)

#### b. Ejemplo de cadenas (`str`) como iterables

Las cadenas de texto (`str`) también son iterables en Python. Puedes recorrer cada carácter de una cadena utilizando un bucle. Por ejemplo:


```python
texto = "Hola"
for caracter in texto:
    print(caracter)
```

    H
    o
    l
    a


#### c. ¿`range` devuelve un iterable?

Sí, la función `range()` en Python devuelve un objeto de tipo `range`, que es un iterable. Aunque no es una secuencia tradicional (como una lista o una tupla), el objeto `range` puede ser recorrido en un bucle y genera los números en la secuencia especificada **sin crear una lista en memoria**. Esto lo hace eficiente en términos de uso de memoria, especialmente cuando se trabaja con grandes rangos de números.


```python
for i in range(5):  # Itera desde 0 hasta 4
    print(i)
```

    0
    1
    2
    3
    4


---

### 5. Ejercicios con estructuras de control

Aquí tienes diez ejercicios para practicar las estructuras de control `for` y `while` en Python:

#### a. Sumar números
Escribe un programa que pida al usuario un número entero positivo `n` y calcule la suma de todos los números desde 1 hasta `n` utilizando un bucle `for`.

**Pistas:**
- Puedes inicializar una variable `suma` en 0 y usarla para acumular los resultados dentro del bucle.


```python

```

#### b. Contar vocales

Crea un programa que pida al usuario una frase y cuente cuántas vocales (a, e, i, o, u) hay en la frase utilizando un bucle `for`.

**Pistas:**
- Usa una lista o cadena que contenga las vocales y verifica cada carácter de la frase para ver si está en esa lista.


```python

```

#### c. Números pares con `while`

Crea un programa que imprima todos los números pares del 1 al 100 utilizando un bucle `while`.

**Pistas:**
- Comienza desde 2 y usa un contador que aumente de 2 en 2 para imprimir solo los números pares.


```python

```

#### d. Adivina el número

Desarrolla un juego donde el programa elige un número aleatorio entre 1 y 100, y el usuario debe adivinarlo. El programa debe usar un bucle `while` para permitir múltiples intentos.

**Pistas:**
- Usa la biblioteca `random` y la función `randint()` para generar un número aleatorio.
- Proporciona retroalimentación al usuario si su intento es menor o mayor.


```python

```

#### e. Contar espacios

Pide al usuario que ingrese un texto y cuenta cuántos espacios hay utilizando un bucle `while`.

**Pistas:**
- Recuerda que el objeto str es un iterable.


```python

```

#### f. Imprimir un triángulo

Escribe un programa que imprima un triángulo de asteriscos (`*`). Pide al usuario el número de filas y usa un bucle `for`.

**Pistas:**
- En cada iteración, imprime el número correspondiente de asteriscos, que puede ser igual al número de la fila actual.


```python

```

#### g. Factorial

Crea un programa que calcule el factorial de un número entero positivo ingresado por el usuario usando un bucle `for`.

**Pistas:**
- El factorial de un número `n` es el producto de todos los números enteros desde 1 hasta `n`.
- Puedes inicializar un acumulador en 1 y multiplicar en cada iteración.


```python

```

#### h. Números Fibonacci

Escribe un programa que imprima los primeros `n` números de la secuencia de Fibonacci, donde `n` es ingresado por el usuario.

**Pistas:**
- Recuerda que los primeros dos números de Fibonacci son 0 y 1, y cada número siguiente es la suma de los dos anteriores.
- La secuencia de Fibonacci para los primeros 10 números es: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34.


```python

```
