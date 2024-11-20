# Clase 6: Material complementario

### 1. Diccionarios

Los **diccionarios** en Python son estructuras de datos muy útiles que nos permiten almacenar pares clave-valor. Son similares a un índice, donde cada clave (como un nombre) tiene asociado un valor (como un número de teléfono o una dirección). A diferencia de las listas, donde los elementos se acceden por un índice numérico, en los diccionarios se accede a los elementos usando claves, lo cual resulta especialmente útil para representar colecciones de datos que se pueden identificar con nombres específicos.

#### a. Características clave de los diccionarios

1. **Claves únicas:** Cada clave en un diccionario debe ser única; no puede haber claves duplicadas. Si se intenta agregar una clave que ya existe, el valor de esa clave será sobrescrito.

2. **Tipo de claves:** Las claves en un diccionario deben ser **inmutables**. Por lo tanto, se suelen utilizar tipos como `str`, `int`, o `tuple`. No se pueden usar listas o diccionarios como claves, ya que son mutables.

3. **Acceso rápido:** Los diccionarios son altamente eficientes en cuanto al acceso a los datos gracias a su implementación interna, basada en tablas hash. Esto permite que la búsqueda de valores sea rápida.

#### b. Manteniendo el orden de creación

A partir de **Python 3.7**, los diccionarios mantienen el orden en el que se agregaron los elementos. Esto significa que, si agregas elementos en un orden específico, al iterar sobre el diccionario, se mantendrá ese orden. Aunque esta característica fue oficialmente documentada en Python 3.7, ya funcionaba así en Python 3.6 como una implementación interna.

Antes de Python 3.6, el orden de los elementos en los diccionarios no estaba garantizado y podía variar.

Ejemplo en Python 3.7+:



```python
# Creación del diccionario
mi_diccionario = {
    'nombre': 'Ana',
    'edad': 25,
    'ciudad': 'Buenos Aires'
}

# Iterando en el mismo orden de inserción
for clave, valor in mi_diccionario.items():
    print(clave, ":", valor)
```

    nombre : Ana
    edad : 25
    ciudad : Buenos Aires


---

### 2. Ejercicios con diccionarios

#### a. Contando palabras

Crea un diccionario que almacene el conteo de palabras en una oración dada. Pide al usuario que ingrese una oración y almacena en el diccionario cuántas veces aparece cada palabra.


```python
texto = "hola mundo hola"
# Salida esperada: {'hola', 2, 'mundo': 1}

palabras = texto.split()
conteo_palabras = {}

for palabra in palabras:
    if palabra in conteo_palabras:
        conteo_palabras[palabra] += 1
    else:
        conteo_palabras[palabra] = 1

print(conteo_palabras)
```

    {'hola': 2, 'mundo': 1}


#### b. Actualización de inventario

Tienes un diccionario que representa el inventario de una tienda, donde las claves son los nombres de los productos y los valores son la cantidad disponible. Pide al usuario que ingrese el nombre de un producto y una cantidad, luego actualiza el inventario sumando esa cantidad al valor existente.


```python
inventario = {'manzanas': 10, 'naranjas': 5, 'bananas': 7}
# Salida esperada: {'manzanas': 13, 'naranjas': 5, 'bananas': 7}

producto = input("Ingresa el nombre del producto: ")
cantidad = int(input("Ingresa la cantidad a agregar: "))

if producto in inventario:
    inventario[producto] += cantidad
else:
    inventario[producto] = cantidad

print(inventario)
```

    {'manzanas': 13, 'naranjas': 5, 'bananas': 7}


#### c. Invirtiendo claves y valores

Dado un diccionario donde las claves son nombres de estudiantes y los valores son sus calificaciones, crea un nuevo diccionario donde las claves sean las calificaciones y los valores una lista de estudiantes que tienen esa calificación.


```python
calificaciones = {'Ana': 10, 'Juan': 8, 'Carlos': 10, 'María': 7}
# Salida esperada: {10: ['Ana', 'Carlos'], 8: ['Juan'], 7: ['María']}

alumnos_por_nota = {}

for alumno, nota in calificaciones.items():
    if nota not in alumnos_por_nota:
        alumnos_por_nota[nota] = []
    alumnos_por_nota[nota].append(alumno)

print(alumnos_por_nota)
```

    {10: ['Ana', 'Carlos'], 8: ['Juan'], 7: ['María']}


#### d. Creación de un diccionario de contactos

Pide al usuario que ingrese nombres y números de teléfono, y almacénalos en un diccionario. Permite que el usuario ingrese varios contactos y luego imprime el diccionario completo.


```python
contactos = {}
# Salida esperada: {'Luis': '12345', 'Ana': '67890'}

while True:
    nombre = input("Ingresa el nombre (o 'salir' para terminar): ")
    if nombre == 'salir':
        break
    telefono = input("Ingresa el número de teléfono: ")
    contactos[nombre] = telefono

print(contactos)
```

    {'Luis': '12345', 'Ana': '67890'}


#### e. Países y capitales

Crea un diccionario con al menos cinco pares de países y sus respectivas capitales. Luego, permite al usuario ingresar el nombre de un país y muestra su capital. Si el país no está en el diccionario, muestra un mensaje de que no está registrado.


```python
paises = {'Argentina': 'Buenos Aires', 'Brasil': 'Brasilia', 'Chile': 'Santiago'}
# Salida esperada: La capital de Chile es Santiago.

pais = input("Ingresa el nombre de un país: ")

if pais in paises:
    print(f"La capital de {pais} es {paises[pais]}.")
else:
    print("El país no está registrado.")
```

    La capital de Chile es Santiago.


#### f. Suma de valores

Crea un diccionario con varios pares clave-valor donde las claves sean nombres de productos y los valores sean sus precios. Calcula e imprime el costo total de todos los productos en el diccionario.


```python
precios = {'lápiz': 5, 'cuaderno': 20, 'mochila': 100}
# Salida esperada: El costo total de todos los productos es 125.

total = sum(precios.values())

print(f"El costo total de todos los productos es {total}.")
```

    El costo total de todos los productos es 125.


#### g. Filtrando productos caros

Tienes un diccionario de productos con sus respectivos precios. Imprime solo aquellos productos cuyo precio sea mayor a un valor especificado (por ejemplo, mayor a 50).


```python
productos = {'camisa': 30, 'zapatos': 70, 'pantalón': 55, 'gorra': 20}
# Salida esperada: {'zapatos': 70, 'pantalón': 55}

filtro = 50
productos_caros = {producto: precio for producto, precio in productos.items() if precio > filtro}

print(productos_caros)
```

    {'zapatos': 70, 'pantalón': 55}


#### h. Diccionario de traducciones

Crea un diccionario donde las claves sean palabras en español y los valores sean sus traducciones en inglés. Luego, permite al usuario ingresar una palabra en español y muestra su traducción. Si la palabra no está en el diccionario, muestra un mensaje indicando que la palabra no tiene traducción.


```python
traducciones = {'perro': 'dog', 'gato': 'cat', 'casa': 'house'}
# Salida esperada: La traducción de 'gato' es 'cat'.

palabra = input("Ingresa una palabra en español: ")

if palabra in traducciones:
    print(f"La traducción de '{palabra}' es '{traducciones[palabra]}'.")
else:
    print("La palabra no tiene traducción.")
```

    La traducción de 'gato' es 'cat'.


#### i. Identificación de elementos únicos

Tienes una lista de números y quieres saber cuántas veces aparece cada número en la lista. Utiliza un diccionario para almacenar cada número y su conteo de apariciones, luego imprime el diccionario.


```python
numeros = [1, 2, 2, 3, 3, 3, 4]
# Salida esperada: {1: 1, 2: 2, 3: 3, 4: 1}

conteo = {}

for numero in numeros:
    if numero in conteo:
        conteo[numero] += 1
    else:
        conteo[numero] = 1

print(conteo)
```

    {1: 1, 2: 2, 3: 3, 4: 1}


#### j. Actualización de precios con descuento

Crea un diccionario con productos y sus respectivos precios. Luego, reduce cada precio un 10% y actualiza el diccionario. Finalmente, imprime el diccionario con los precios ya actualizados.


```python
precios = {'libro': 200, 'revista': 50, 'marcador': 10}
# Salida esperada: {'libro': 180.0, 'revista': 45.0, 'marcador': 9.0}

descuento = 0.10

for producto in precios:
    precios[producto] -= precios[producto] * descuento

print(precios)
```

    {'libro': 180.0, 'revista': 45.0, 'marcador': 9.0}


---

### 3. Ventajas del slicing en Python

1. **Acceso rápido y conciso a subsecciones de datos:** Permite extraer sublistas, subcadenas o subtuplas sin la necesidad de bucles o lógica adicional, lo que facilita la manipulación de datos.

2. **Creación de copias superficiales:** Usando el slicing sin definir `start` ni `stop` (`mi_lista[:]`), se puede crear una copia superficial de una lista, lo cual es útil cuando queremos trabajar con la misma estructura sin modificar el original.

3. **Extracción de datos de manera flexible:** Los valores `start`, `stop` y `step` permiten flexibilidad, incluyendo la selección de elementos en posiciones específicas (pares, impares) o la inversión de una lista (con `[::-1]`), lo cual agiliza operaciones de acceso a datos en sentido inverso.

4. **Evita la sobrecarga de bucles innecesarios:** Al usar slicing, no es necesario iterar manualmente sobre una estructura de datos, lo que simplifica el código y puede mejorar la legibilidad y mantenimiento del mismo.

5. **Menos errores de índice en rangos personalizados:** Al definir límites claros en el slicing (`start` y `stop`), se evita el riesgo de errores comunes al usar índices en bucles.

6. **Ideal para preprocesamiento de datos:** Al trabajar con series de datos, como en análisis de texto o datos numéricos, slicing permite seleccionar y limpiar datos rápidamente, agilizando la preparación antes de aplicarle operaciones más complejas.

---

### 4. Ejercicios con slicing

Estos ejercicios cubren varios usos comunes de slicing en listas.

#### a. Extraer sublista

Dada una lista de números, extrae una sublista con los primeros 5 elementos.


```python
numeros = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
# Salida esperada: [10, 20, 30, 40, 50]

primeros_cinco = numeros[:5]
print(primeros_cinco)
```

    [10, 20, 30, 40, 50]


#### b. Obtener últimos elementos

Dada una lista de palabras, obtén una sublista con las últimas 3 palabras.


```python
palabras = ["python", "javascript", "java", "ruby", "perl", "swift"]
# Salida esperada: ['ruby', 'perl', 'swift']

print(palabras[-3:])
```

    ['ruby', 'perl', 'swift']


#### c. Sublista de elementos en posiciones pares

Dada una lista de letras, crea una nueva lista con los elementos en las posiciones pares de la lista original.


```python
letras = ["a", "b", "c", "d", "e", "f", "g", "h"]
# Salida esperada: ['a', 'c', 'e', 'g']

print(letras[::2])
```

    ['a', 'c', 'e', 'g']


#### d. Invertir lista

Dada una lista de números, utiliza slicing para invertir el orden de la lista.


```python
numeros = [1, 2, 3, 4, 5]
# Salida esperada: [5, 4, 3, 2, 1]

print(numeros[::-1])
```

    [5, 4, 3, 2, 1]


#### e. Sublista desde el tercer elemento hasta el penúltimo

Dada una lista de nombres, crea una sublista que incluya desde el tercer elemento hasta el penúltimo.


```python
nombres = ["Ana", "Luis", "María", "Carlos", "Sofía", "Miguel", "Elena"]
# Salida esperada: ['María', 'Carlos', 'Sofía', 'Miguel']

sublista = nombres[2:-1]
print(sublista)
```

    ['María', 'Carlos', 'Sofía', 'Miguel']


---

### 5. Ventajas de la comprensión de listas

La comprensión de listas es una herramienta poderosa y concisa que facilita la generación de listas en Python, mejorando la legibilidad y eficiencia del código, especialmente cuando se trabaja con transformaciones y filtrados básicos de datos.

1. **Código más corto y legible:** Con una sola línea, se logra el mismo resultado que un bucle `for` convencional, haciendo que el código sea más limpio y fácil de leer.
  
2. **Rendimiento optimizado:** Al estar implementado en el lenguaje como una construcción de comprensión, el rendimiento suele ser mejor que el de los bucles `for` tradicionales en muchos casos.

3. **Filtrado eficiente:** Permite aplicar condiciones fácilmente, generando listas con elementos que cumplen ciertos criterios sin bucles adicionales.

4. **Flexibilidad para realizar operaciones complejas:** Se pueden aplicar transformaciones y cálculos directamente al definir cada elemento, lo cual es útil en diversas tareas de procesamiento de datos.

#### a. Comprensión de listas vs. bucle `for`

La comprensión de listas es ideal cuando se necesita generar listas simples y comprensibles. Sin embargo, en casos complejos, donde la lógica dentro de la iteración es extensa o requiere varias condiciones, un bucle `for` podría ser más adecuado para mantener la claridad.

---

### 6. Ejercicios con comprensión de listas

Estos ejercicios muestran la versatilidad de la comprensión de listas, permitiendo transformaciones, filtrado de datos y la creación de combinaciones de manera simple y concisa.

#### a. Elevar al cuadrado

Dada una lista de números, genera una nueva lista que contenga el cuadrado de cada número en la lista original.


```python
numeros = [1, 2, 3, 4, 5]
# Salida esperada: [1, 4, 9, 16, 25]

cuadrados = [n ** 2 for n in numeros]
print(cuadrados)
```

    [1, 4, 9, 16, 25]


#### b. Filtrar números pares

Dada una lista de números, genera una nueva lista que contenga solo los números pares.


```python
numeros = [10, 15, 20, 25, 30, 35, 40]
# Salida esperada: [10, 20, 30, 40]

pares = [n for n in numeros if n % 2 == 0]
print(pares)
```

    [10, 20, 30, 40]


#### c. Longitud de palabras

Dada una lista de palabras, genera una nueva lista que contenga la longitud de cada palabra.


```python
palabras = ["python", "comprensión", "de", "listas", "es", "útil"]
# Salida esperada: [6, 11, 2, 6, 2, 4]

longitudes = [len(palabra) for palabra in palabras]
print(longitudes)
```

    [6, 11, 2, 6, 2, 4]


#### d. Convertir a minúsculas

Dada una lista de palabras con algunas en mayúsculas y otras en minúsculas, genera una nueva lista con todas las palabras en minúsculas.


```python
palabras = ["PYTHON", "Listas", "Comprensión", "De", "Datos"]
# Salida esperada: ['python', 'listas', 'comprensión', 'de', 'datos']

print([palabra.lower() for palabra in palabras])
```

    ['python', 'listas', 'comprensión', 'de', 'datos']


#### e. Obtener los primeros caracteres

Dada una lista de palabras, genera una nueva lista que contenga solo el primer carácter de cada palabra. 


```python
palabras = ["python", "listas", "comprensión", "de", "datos"]
# Salida esperada: ['p', 'l', 'c', 'd', 'd']

print([palabra[0] for palabra in palabras])
```

    ['p', 'l', 'c', 'd', 'd']

