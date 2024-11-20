# Clase 5 - Material complementario

### 1. Concepto de mutabilidad

En Python, la **mutabilidad** o **inmutabilidad** de un objeto se refiere a su capacidad para cambiar después de su creación. Este concepto es fundamental para entender cómo funcionan las estructuras de datos y cómo manejar los datos de manera eficiente.

#### a. ¿Por qué importa la mutabilidad?

La mutabilidad afecta cómo se manejan y pasan los datos en Python:
- **Objetos Mutables**: Si una función recibe un objeto mutable como argumento y lo modifica, los cambios se reflejarán fuera de la función porque el objeto es el mismo en memoria.
- **Objetos Inmutables**: Si una función recibe un objeto inmutable y realiza cambios, se creará un nuevo objeto en la memoria, y el objeto original permanecerá sin cambios.

#### b. Ejemplo comparativo


```python
def modificar_lista(lista):
    lista.append(4)

mi_lista = [1, 2, 3]
modificar_lista(mi_lista)
print(mi_lista)  # Salida: [1, 2, 3, 4] (la lista original cambió)
```

    [1, 2, 3, 4]



```python
def modificar_entero(valor):
    valor += 1

mi_entero = 10
modificar_entero(mi_entero)
print(mi_entero)  # Salida: 10 (el entero original no cambió)
```

    10


- En el primer caso, `mi_lista` se modifica porque es mutable.
- En el segundo caso, `mi_entero` no cambia porque los enteros son inmutables y el incremento crea un nuevo valor en la memoria.

#### c. Resumen
| Tipo de Objeto | Ejemplos             | ¿Mutable? |
|----------------|----------------------|-----------|
| Listas         | `[1, 2, 3]`          | Sí        |
| Diccionarios   | `{'clave': 'valor'}` | Sí        |
| Conjuntos      | `{1, 2, 3}`          | Sí        |
| Enteros        | `5`, `42`, `-3`      | No        |
| Cadenas        | `"Hola"`             | No        |
| Tuplas         | `(1, 2, 3)`          | No        |

La elección entre usar objetos mutables o inmutables depende del contexto y de la necesidad de cambiar o no el valor de los datos almacenados.

---

### 2. Objetos mutables

Un objeto **mutable** es aquel que se puede modificar después de su creación, es decir, podemos cambiar su contenido sin crear un nuevo objeto. Entre los tipos mutables más comunes en Python están las **listas**, **diccionarios** y **conjuntos**.

#### a. Ejemplo de lista (objeto mutable)


```python
mi_lista = [1, 2, 3]
mi_lista.append(4)   # Modifica la lista original
print(mi_lista)
```

    [1, 2, 3, 4]


En este caso, se ha modificado la lista `mi_lista` agregando un nuevo elemento sin necesidad de crear una nueva lista. 

#### b. Ejemplo de diccionario (objeto mutable)


```python
mi_diccionario = {'nombre': 'Juan', 'edad': 25}
mi_diccionario['edad'] = 26  # Cambia el valor asociado a la clave 'edad'
print(mi_diccionario)
```

    {'nombre': 'Juan', 'edad': 26}



Acá, el diccionario `mi_diccionario` se modifica actualizando el valor de la clave `edad` sin necesidad de crear un nuevo diccionario.

---

### 3. Objetos inmutables

Un objeto **inmutable** no se puede modificar una vez que ha sido creado. Esto significa que cualquier "modificación" en un objeto inmutable en realidad crea un nuevo objeto en la memoria. Los tipos inmutables en Python incluyen **enteros**, **flotantes**, **cadenas de texto** (`str`), y **tuplas**.

#### a. Ejemplo de string (objeto inmutable)


```python
mi_cadena = "Hola"
mi_cadena += " Mundo"  # Crea una nueva cadena en lugar de modificar la original
print(mi_cadena)
```

    Hola Mundo


En este ejemplo, cuando hacemos `mi_cadena += " Mundo"`, Python crea una nueva cadena en lugar de modificar la original. La variable `mi_cadena` ahora apunta a esta nueva cadena, pero la cadena original `"Hola"` sigue existiendo por separado en la memoria.

#### b. Ejemplo de tupla (objeto inmutable)


```python
mi_tupla = (1, 2, 3)
mi_tupla[0] = 10   # Esto genera un error porque las tuplas son inmutables
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    Cell In[18], line 2
          1 mi_tupla = (1, 2, 3)
    ----> 2 mi_tupla[0] = 10   # Esto genera un error porque las tuplas son inmutables


    TypeError: 'tuple' object does not support item assignment



Las tuplas son inmutables, así que cualquier intento de cambiar uno de sus elementos provocará un error. 


---

### 4. Funciones incorporadas (built-in) que trabajan con listas

Python ofrece varias funciones incorporadas que hacen que trabajar con listas sea más flexible y permiten realizar muchas operaciones de manera rápida y efectiva en Python.

#### a. `len()`
La función `len()` devuelve la cantidad de elementos de una lista.


```python
mi_lista = [1, 2, 3, 4, 5]
print(len(mi_lista))
```

    5


#### b. `max()`
`max()` devuelve el valor máximo de una lista (siempre que todos los elementos sean comparables).


```python
mi_lista = [3, 7, 2, 8, 4]
print(max(mi_lista))
```

    8


#### c. `min()`
`min()` devuelve el valor mínimo de una lista.




```python
mi_lista = [3, 7, 2, 8, 4]
print(min(mi_lista))
```

    2


#### d. `sum()`
`sum()` devuelve la suma de todos los elementos de la lista (deben ser numéricos).


```python
mi_lista = [1, 2, 3, 4]
print(sum(mi_lista))
```

    10


#### e. `sorted()`
`sorted()` devuelve una nueva lista con los elementos ordenados. No modifica la lista original.


```python
mi_lista = [3, 1, 4, 1, 5]
lista_ordenada = sorted(mi_lista)
print(lista_ordenada)  # Salida: [1, 1, 3, 4, 5]
print(mi_lista)        # Salida: [3, 1, 4, 1, 5] (sin cambios)
```

    [1, 1, 3, 4, 5]
    [3, 1, 4, 1, 5]


#### f. `reversed()`
`reversed()` devuelve un iterador que recorre la lista en orden inverso. Para convertirlo en una lista, usamos `list()`.


```python
mi_lista = [1, 2, 3, 4, 5]
lista_invertida = list(reversed(mi_lista))
print(lista_invertida)
```

    [5, 4, 3, 2, 1]


#### g. `any()`
`any()` devuelve `True` si al menos uno de los elementos de la lista es `True` (o un valor no nulo).


```python
mi_lista = [0, False, "", None, 1]
print(any(mi_lista))  # Salida: True (porque el `1` es True)
```

    True


#### h. `all()`
`all()` devuelve `True` solo si **todos** los elementos de la lista son `True`.


```python
mi_lista = [1, True, "Texto"]
print(all(mi_lista))  # Salida: True (todos son verdaderos)
```

    True


#### i. `enumerate()`
`enumerate()` devuelve un iterador que da un índice y el valor correspondiente de cada elemento de la lista.


```python
mi_lista = ["a", "b", "c"]
for indice, valor in enumerate(mi_lista):
    print(indice, valor)
```

    0 a
    1 b
    2 c


#### j. `zip()`
`zip()` combina dos o más listas en una sola, creando pares de elementos de las listas originales.


```python
nombres = ["Ana", "Luis", "Sofía"]
edades = [22, 35, 29]
combinado = list(zip(nombres, edades))
print(combinado)
```

    [('Ana', 22), ('Luis', 35), ('Sofía', 29)]


#### k. `map()`
`map()` aplica una función a cada elemento de una lista y devuelve un iterador con los resultados.


```python
mi_lista = [1, 2, 3, 4]
cuadrados = list(map(lambda x: x ** 2, mi_lista))
print(cuadrados)
```

    [1, 4, 9, 16]


#### l. `filter()`
`filter()` devuelve un iterador con los elementos que cumplen una condición específica.


```python
mi_lista = [1, 2, 3, 4, 5]
pares = list(filter(lambda x: x % 2 == 0, mi_lista))
print(pares)
```

    [2, 4]


#### m. `list()`
`list()` convierte un iterable (como una cadena o un rango) en una lista.


```python
cadena = "hola"
lista = list(cadena)
print(lista)
```

    ['h', 'o', 'l', 'a']


___

### 5. Ejercicios con listas

Estos ejercicios son básicos pero muy útiles para empezar a familiarizarse con la manipulación de listas en Python. Prueba modificando los valores y las listas, y experimenta con los métodos que Python ofrece para listas, como `append`, `remove`, y `pop`.

#### a. Sumar todos los elementos

Dada una lista de números, calcula la suma de todos sus elementos e imprime el resultado.


```python
numeros = [2, 4, 6, 8, 10]
# Debería imprimir: 30

# sum(numeros)

suma = 0
for numero in numeros:
    suma += numero

print(suma)
```

    30


#### b. Encontrar el mayor elemento

Dada una lista de números, encuentra el mayor elemento y muéstralo.


```python
numeros = [1, 5, 3, 9, 7]
# Debería imprimir: 9

# max(numeros)

mayor = 0
for numero in numeros:
    if numero > mayor:
        mayor = numero

print(mayor)
```

    9



#### c. Invertir una lista

Dada una lista, invierte el orden de sus elementos e imprime la lista resultante.


```python
nombres = ["Ana", "Juan", "Luis", "Sofía"]
# Debería imprimir: ["Sofía", "Luis", "Juan", "Ana"]

# nombres[::-1]

nombres_ordenados = []
for i in range(3, -1, -1):
    nombres_ordenados.append(nombres[i])

print(nombres_ordenados)
```

    ['Sofía', 'Luis', 'Juan', 'Ana']


#### d. Contar ocurrencias de un elemento

Dada una lista de palabras, cuenta cuántas veces aparece una palabra específica en la lista e imprime el resultado.


```python
palabras = ["hola", "mundo", "hola", "python", "hola"]
palabra_a_contar = "hola"
# Debería imprimir: 3

# palabras.count('hola')

contador = 0
for palabra in palabras:
    if palabra == palabra_a_contar:
        contador += 1

print(contador)
```

    3



#### e. Eliminar duplicados

Dada una lista con elementos repetidos, crea una nueva lista solo con los elementos únicos (sin duplicados) e imprímela.


```python
numeros = [1, 2, 2, 3, 4, 4, 5]
# Debería imprimir: [1, 2, 3, 4, 5]

# list(set(numeros))

numeros_unicos = []
for numero in numeros:
    if numero not in numeros_unicos:
        numeros_unicos.append(numero)

print(numeros_unicos)
```

    [1, 2, 3, 4, 5]



#### f. Ordenar una lista de menor a mayor

Dada una lista de números desordenados, ordénala de menor a mayor e imprime la lista ordenada.


```python
numeros = [7, 3, 9, 1, 4]
# Debería imprimir: [1, 3, 4, 7, 9]

# sorted(numeros)

for i in range(len(numeros)):
    for j in range(0, len(numeros) - i - 1):
       if numeros[j] > numeros[j + 1]:
           numeros[j], numeros[j + 1] = numeros[j + 1], numeros[j]

print(numeros)
```

    [1, 3, 4, 7, 9]



#### g. Filtrar números pares

Dada una lista de números, crea una nueva lista solo con los números pares e imprémela.


```python
numeros = [1, 2, 3, 4, 5, 6, 7, 8]
# Debería imprimir: [2, 4, 6, 8]

# pares = [n for n in numeros if n % 2 == 0]

pares = []
for n in numeros:
    if n % 2 == 0:
        pares.append(n)

print(pares)
```

    [2, 4, 6, 8]



#### h. Concatenar listas

Dadas dos listas, combina sus elementos en una sola lista e imprime el resultado.


```python
lista1 = ["a", "b", "c"]
lista2 = [1, 2, 3]
# Debería imprimir: ["a", "b", "c", 1, 2, 3]

lista = lista1 + lista2
print(lista)
```

    ['a', 'b', 'c', 1, 2, 3]



####  i. Eliminar el primer y último elemento

Dada una lista, elimine el primer y último elemento e imprime la lista resultante.


```python
nombres = ["Pedro", "Ana", "Juan", "Luis", "Sofía"]
# Debería imprimir: ["Ana", "Juan", "Luis"]

nombres.pop(0)
nombres.pop()
print(', '.join(nombres))
```

    Ana, Juan, Luis


---

### 6. Listas vs. Tuplas

En Python, tanto las listas como las tuplas son estructuras de datos que almacenan una secuencia de elementos. Sin embargo, existen diferencias clave entre ellas que influyen en su uso, en particular en relación con la **mutabilidad**, la **eficiencia** y las **funciones** aplicables.

El uso de listas o tuplas depende del contexto y de la naturaleza de los datos. Si necesitas flexibilidad y capacidad de modificación, las listas son adecuadas. Por el contrario, si estás trabajando con datos constantes que no requieren cambios, una tupla es la opción más eficiente y segura.

#### a. Diferencias principales entre listas y tuplas

1. **Mutabilidad**: La diferencia más importante es que las listas son **mutables**, mientras que las tuplas son **inmutables**. Esto significa que una vez que creas una lista, puedes modificarla (agregar, eliminar o cambiar elementos). Por otro lado, una vez que se crea una tupla, sus elementos no pueden cambiar. Esta inmutabilidad hace que las tuplas sean más seguras para datos que no necesitan modificarse y pueden proteger la integridad de los datos en ciertos contextos.

2. **Rendimiento**: Debido a su inmutabilidad, las tuplas son generalmente **más eficientes en términos de memoria y velocidad**. Las operaciones que involucran tuplas, como su creación o el acceso a elementos, suelen ser más rápidas que en listas. Esto hace que las tuplas sean preferibles cuando se trabaja con una gran cantidad de datos fijos, ya que el procesamiento será más rápido.

3. **Funciones disponibles**: Aunque listas y tuplas comparten varias funciones, como `len()`, `max()` y `min()`, las listas ofrecen métodos adicionales que permiten modificar sus elementos, tales como `append()`, `remove()`, y `sort()`. Estos métodos no están disponibles para las tuplas, ya que su inmutabilidad impide cualquier alteración en su contenido.

4. **Uso en claves de diccionarios**: Otra ventaja de las tuplas es que pueden usarse como **claves en diccionarios** o en conjuntos (`sets`), mientras que las listas no pueden debido a su mutabilidad. Esto es útil cuando necesitas asociar datos fijos a una clave, como en los casos de coordenadas o pares de datos.

#### b. Casos en los que es conveniente usar una lista

- **Datos modificables**: Si necesitas almacenar datos que pueden cambiar, como un carrito de compras, una lista de tareas o registros que pueden actualizarse, una lista es la mejor opción.
- **Operaciones de modificación frecuentes**: Si se requiere agregar, eliminar o modificar elementos constantemente, las listas son ideales por su flexibilidad.
- **Ordenación de datos**: Si los datos necesitan ordenarse o si se realizan operaciones de ordenamiento, una lista es más adecuada, ya que puedes usar el método `sort()` o `reverse()` sin tener que crear una nueva estructura.

#### c. Casos en los que es conveniente usar una tupla

- **Datos fijos**: Cuando tienes una secuencia de datos que no cambiarán, como las coordenadas de un punto (x, y), una fecha (día, mes, año) o configuraciones que deben ser constantes, las tuplas son la mejor opción.
- **Optimización de memoria**: En casos de procesamiento intensivo, donde se necesita una estructura ligera y rápida, las tuplas ofrecen ventajas en cuanto a rendimiento. Esto es útil en estructuras de datos complejas o cuando se manejan grandes volúmenes de datos fijos.
- **Claves de diccionario**: Si necesitas asociar datos con una clave en un diccionario, las tuplas son ideales para definir pares de datos constantes y únicos, como identificadores o combinaciones de valores.

#### d. Ejemplos

1. **Lista**: Un menú de opciones en una interfaz que puede actualizarse.


```python
opciones_menu = ["Inicio", "Perfil", "Ajustes"]
opciones_menu.append("Ayuda")  # Modificación posible
print(opciones_menu)
```

    ['Inicio', 'Perfil', 'Ajustes', 'Ayuda']


2. **Tupla**: Coordenadas de un punto en un sistema de gráficos.


```python
punto = (10, 20)
punto[0] = 15  # Esto lanza un error, ya que las tuplas son inmutables
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    Cell In[49], line 2
          1 punto = (10, 20)
    ----> 2 punto[0] = 15  # Esto lanza un error, ya que las tuplas son inmutables


    TypeError: 'tuple' object does not support item assignment


---

### 7. Listas vs. Sets

La elección entre listas y conjuntos depende de tus necesidades específicas en cuanto al manejo de datos, el orden y la unicidad. Las listas son ideales para colecciones ordenadas y con duplicados, mientras que los conjuntos son mejores para operaciones que requieren rapidez y exclusividad.

#### a. Ventajas de usar listas

1. **Orden de los elementos**: Las listas mantienen el orden de inserción de los elementos. Esto significa que puedes acceder a los elementos en el mismo orden en que fueron añadidos. Esto es especialmente útil cuando necesitas procesar datos en un orden específico.


```python
lista = [3, 1, 4, 2]
print(lista)
```

    [3, 1, 4, 2]


2. **Permiten duplicados**: Las listas pueden contener elementos duplicados. Esto es útil cuando deseas representar una colección de elementos en la que el mismo valor puede tener significados diferentes o simplemente aparece varias veces.


```python
lista_con_duplicados = [1, 2, 2, 3, 4]
print(lista_con_duplicados)
```

    [1, 2, 2, 3, 4]


3. **Acceso por índice**: Puedes acceder a los elementos de una lista usando índices, lo que te permite acceder a elementos específicos de manera rápida y eficiente.


```python
lista = ['a', 'b', 'c']
print(lista[1])
```

    b


4. **Métodos adicionales**: Las listas ofrecen una variedad de métodos útiles (como `append()`, `insert()`, `remove()`, y `sort()`) que no están disponibles en conjuntos. Esto las hace más versátiles para manipular y organizar datos.


```python
lista = [3, 1, 4]
lista.append(2)  # Agrega 2 al final
print(lista)
```

    [3, 1, 4, 2]


5. **Iteración y comprensión de listas**: Las listas son fáciles de iterar y permiten la comprensión de listas, lo que facilita la creación de nuevas listas a partir de las existentes con un solo comando.


```python
lista = [1, 2, 3, 4]
cuadrados = [x**2 for x in lista]
print(cuadrados)
```

    [1, 4, 9, 16]


#### b. Desventajas en comparación con `set`

- **Búsqueda y operación de pertenencia**: Los conjuntos son más eficientes para comprobar la pertenencia de un elemento, ya que utilizan tablas hash. Por lo tanto, las operaciones como `in` son más rápidas en conjuntos que en listas.
  
- **Duplicados**: Si no necesitas duplicados, usar un conjunto es más apropiado, ya que automáticamente eliminará cualquier elemento repetido.

- **Uso de memoria**: Los conjuntos suelen ser más eficientes en términos de uso de memoria cuando se trabaja con grandes volúmenes de datos únicos.

---

### 8. Ejercicios con listas y conjuntos

Aquí tienes cinco ejercicios que combinan el uso de conjuntos (`sets`) y listas en Python. Estos ejercicios te ayudarán a practicar cómo trabajar con ambos tipos de datos de manera efectiva.

#### a. Eliminar duplicados de una lista

Dada una lista con elementos duplicados, utiliza un conjunto para crear una nueva lista que contenga solo los elementos únicos.


```python
nombres = ["Ana", "Luis", "Juan", "Ana", "Sofía", "Luis"]
# Salida esperada: ['Ana', 'Luis', 'Juan', 'Sofía']

nombres_unicos = list(set(nombres))
print(nombres_unicos)
```

    ['Juan', 'Ana', 'Sofía', 'Luis']



#### b. Encontrar elementos comunes entre dos listas

Dadas dos listas, encuentra los elementos que están presentes en ambas y devuelve una lista con esos elementos únicos utilizando conjuntos.


```python
lista1 = [1, 2, 3, 4, 5]
lista2 = [4, 5, 6, 7, 8]
# Salida esperada: [4, 5]

elementos_comunes = list(set(lista1) & set(lista2))
print(elementos_comunes)
```

    [4, 5]


#### c. Unir elementos de dos listas sin duplicados

Crea una lista que contenga todos los elementos de dos listas diferentes, eliminando cualquier duplicado en el proceso.


```python
lista1 = ['a', 'b', 'c']
lista2 = ['c', 'd', 'e']
# Salida esperada: ['a', 'b', 'c', 'd', 'e']

union = list(set(lista1) | set(lista2))
print(union)
```

    ['d', 'b', 'c', 'e', 'a']


#### d. Contar elementos únicos en una lista

Dada una lista, utiliza un conjunto para contar cuántos elementos únicos hay en ella.


```python
numeros = [1, 2, 2, 3, 4, 4, 5, 1]
# Salida esperada: 5

numeros_unicos = set(numeros)
cantidad_unicos = len(numeros_unicos)

print(f"Número de elementos únicos: {cantidad_unicos}")
```

    Número de elementos únicos: 5


#### e. Verificar si una lista es un subconjunto de otra

Dadas dos listas, verifica si todos los elementos de la primera lista están presentes en la segunda. Utiliza conjuntos para facilitar la verificación.


```python
lista1 = [1, 2, 3]
lista2 = [1, 2, 3, 4, 5]
# Salida esperada: Lista1 es un subconjunto de Lista2.

es_subconjunto = set(lista1).issubset(set(lista2))

if es_subconjunto:
    print("Lista1 es un subconjunto de Lista2.")
else:
    print("Lista1 no es un subconjunto de Lista2.")
```

    Lista1 es un subconjunto de Lista2.

