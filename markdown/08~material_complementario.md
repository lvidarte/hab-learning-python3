# Clase 8: Material complementario

### 1. Introducción a los parámetros variables en Python

En Python, una función puede recibir un número variable de argumentos usando `*args` y `**kwargs`. 

1. `*args`: permite a la función aceptar un número variable de argumentos posicionales, que se agrupan en una tupla.
2. `**kwargs`: permite a la función aceptar un número variable de argumentos de palabra clave (keyword arguments), que se agrupan en un diccionario.

Los parámetros variables son útiles cuando:
- No conocemos de antemano cuántos argumentos se pasarán a la función.
- Queremos hacer la función flexible y adaptable para diferentes entradas.

También es posible usar `*` y `**` en las llamadas a funciones para expandir listas y diccionarios, respectivamente, en múltiples argumentos.

#### a. Uso de `*args` para argumentos posicionales variables


```python
def suma(*args):
       return sum(args)

print(suma(1, 2, 3))        # 6
print(suma(4, 5, 6, 7, 8))  # 30
```

    6
    30



#### b. Uso de `**kwargs` para argumentos de palabra clave variables



```python
def mostrar_info(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

mostrar_info(nombre="Ana", edad=25, ciudad="Buenos Aires")
```

    nombre: Ana
    edad: 25
    ciudad: Buenos Aires


#### c. Combinación de argumentos de posición, `*args`, y `**kwargs`


```python
def combinar(param1, *args, **kwargs):
       print(f"param1: {param1}")
       print("args:", args)
       print("kwargs:", kwargs)

combinar("Fijo", 10, 20, nombre="Carla", ciudad="Barcelona")
```

    param1: Fijo
    args: (10, 20)
    kwargs: {'nombre': 'Carla', 'ciudad': 'Barcelona'}



#### d. Llamada a función con `*` para expandir una lista



```python
def resta(a, b, c):
       return a - b - c

lista_numeros = [10, 3, 2]
print(resta(*lista_numeros))
```

    5



#### e. Llamada a función con `**` para expandir un diccionario



```python
def mostrar_detalles(nombre, edad, ciudad):
       print(f"Nombre: {nombre}, Edad: {edad}, Ciudad: {ciudad}")

datos = {"nombre": "Juan", "edad": 30, "ciudad": "La Plata"}
mostrar_detalles(**datos)
```

    Nombre: Juan, Edad: 30, Ciudad: La Plata


#### f. Uso combinado de parámetros fijos, `*args`, y `**kwargs`


```python
def evento(descripcion, *invitados, **detalles):
    print(f"Evento: {descripcion}")
    print("Invitados:", ", ".join(invitados))
    for key, value in detalles.items():
        print(f"{key}: {value}")

evento("Fiesta", "Ana", "Carlos", hora="20:00", lugar="Club Social")
```

    Evento: Fiesta
    Invitados: Ana, Carlos
    hora: 20:00
    lugar: Club Social


#### g. Definir una función con `*args` y `**kwargs` para crear un mensaje


```python
def mensaje_personalizado(*args, **kwargs):
    mensaje = " ".join(args)
    detalles = ", ".join(f"{k}={v}" for k, v in kwargs.items())
    return f"{mensaje} ({detalles})"

print(mensaje_personalizado("Hola", "Mundo", autor="Lucia", año=2024))
```

    Hola Mundo (autor=Lucia, año=2024)


#### h. Uso de `*` y `**` para pasar elementos de una lista y un diccionario a una función


```python
def procesar(param1, param2, param3, nombre=None, edad=None):
    print(f"{param1=}, {param2=}, {param3=}")
    print(f"Nombre: {nombre}, Edad: {edad}")

lista = ['a', 'b', 'c']
dicc = {"nombre": "Pedro", "edad": 45}

procesar(*lista, **dicc)
```

    param1='a', param2='b', param3='c'
    Nombre: Pedro, Edad: 45


#### i. Función que acepta cualquier combinación de argumentos


```python
def informe(*args, **kwargs):
    print("Datos:", args)
    print("Detalles:", kwargs)

informe(10, 20, 30, usuario="Juan", edad=30)
```

    Datos: (10, 20, 30)
    Detalles: {'usuario': 'Juan', 'edad': 30}


---

### 2. Modificadores `/` y `*`

En Python (versión 3.8 y superiores), los modificadores `/` y `*` en la definición de parámetros permiten controlar cómo se deben pasar los argumentos a una función: ya sea exclusivamente por posición, exclusivamente por nombre (keyword arguments), o de manera mixta. Estos modificadores son útiles cuando quieres que ciertos parámetros solo se acepten de una manera específica, mejorando la legibilidad y reduciendo errores de llamada.

#### a. Modificador `/` (solo por posición)
El modificador `/` indica que todos los parámetros que estén antes de él deben ser pasados **solo por posición**. Esto significa que, para esos parámetros, no se puede usar el nombre al hacer la llamada a la función, lo cual es útil para evitar la confusión entre parámetros de nombre similar.


```python
def dividir(a, b, /):
    return a / b

# Llamada correcta (solo por posición)
print(dividir(10, 2))  # 5.0
```

    5.0



```python
# Llamada incorrecta (uso por nombre)
print(dividir(a=10, b=2))
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    Cell In[15], line 2
          1 # Llamada incorrecta (uso por nombre)
    ----> 2 print(dividir(a=10, b=2))


    TypeError: dividir() got some positional-only arguments passed as keyword arguments: 'a, b'


#### b. Modificador `*` (solo por nombre)

El modificador `*` indica que todos los parámetros después de él deben ser pasados **solo por nombre** (keyword arguments). Así, estos argumentos solo se pueden pasar especificando el nombre del parámetro y su valor, lo que ayuda a hacer la llamada más explícita.


```python
def crear_usuario(nombre, edad, *, ciudad, pais):
    print(f"Nombre: {nombre}, Edad: {edad}, Ciudad: {ciudad}, País: {pais}")

# Llamada correcta (ciudad y país como keyword arguments)
crear_usuario("Ana", 30, ciudad="Buenos Aires", pais="Argentina")
```

    Nombre: Ana, Edad: 30, Ciudad: Buenos Aires, País: Argentina



```python
# Llamada incorrecta (sin usar keyword arguments)
crear_usuario("Ana", 30, "Buenos Aires", "Argentina")
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    Cell In[17], line 2
          1 # Llamada incorrecta (sin usar keyword arguments)
    ----> 2 crear_usuario("Ana", 30, "Buenos Aires", "Argentina")


    TypeError: crear_usuario() takes 2 positional arguments but 4 were given



### c. Uso combinado de `/` y `*` para una mayor flexibilidad


```python
def producto(a, b, /, c, *, d):
       return (a * b) + c - d

# Llamada correcta
print(producto(2, 3, 4, d=1))
```

    9



```python

# Llamada incorrecta (pasando `d` sin nombre)
print(producto(2, 3, 4, 1))  # Error
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    Cell In[19], line 2
          1 # Llamada incorrecta (pasando `d` sin nombre)
    ----> 2 print(producto(2, 3, 4, 1))  # Error


    TypeError: producto() takes 3 positional arguments but 4 were given


#### d. Función que usa `/`, `*`, `*args`, y `**kwargs` 


```python
def procesar(a, b, /, c, *args, d, e, **kwargs):
    print(f"a: {a}, b: {b}, c: {c}")
    print("args:", args)
    print(f"d: {d}, e: {e}")
    print("kwargs:", kwargs)

procesar(1, 2, 3, 4, 5, d=6, e=7, extra="dato")
```

    a: 1, b: 2, c: 3
    args: (4, 5)
    d: 6, e: 7
    kwargs: {'extra': 'dato'}


---

### 3. Modelo LEGB en Python

En Python, el modelo LEGB define el orden de búsqueda para las variables y nombres en el código. LEGB es un acrónimo de los cuatro niveles en los que Python busca una variable en el siguiente orden:

1. **Local (L)**: Primero, Python busca en el ámbito local, que es el espacio de nombres de una función, método o bloque de código específico.
2. **Enclosing (E)**: Si no encuentra el nombre en el ámbito local, busca en el ámbito que lo engloba, como en una función dentro de otra función.
3. **Global (G)**: Si el nombre no está en el ámbito local ni en el englobante, Python lo busca en el ámbito global del módulo.
4. **Built-in (B)**: Si no lo encuentra en los ámbitos anteriores, busca en el ámbito de nombres predefinidos de Python, como funciones integradas (`print`, `len`, etc.).

#### a. Local Scope (L)


```python
def funcion_local():
    x = "Soy local"
    print(x)  # Busca en el ámbito local de la función

funcion_local()  # Salida: "Soy local"
```

    Soy local


Aquí `x` es local a `funcion_local`, por lo que Python la encuentra directamente en el ámbito local.

#### b. Enclosing Scope (E)


```python
def funcion_externa():
    x = "Soy de la función externa"

    def funcion_interna():
        print(x)  # Busca en el ámbito englobante

    funcion_interna()

funcion_externa()  # Salida: "Soy de la función externa"
```

    Soy de la función externa


Aquí, `x` está en el ámbito de `funcion_externa`, que envuelve `funcion_interna`. La función interna puede acceder a `x` en el ámbito englobante.

#### c. Global Scope (G)


```python
x = "Soy global"

def mostrar_global():
    print(x)  # Busca en el ámbito global

mostrar_global()  # Salida: "Soy global"
```

    Soy global


En este ejemplo, `x` está en el ámbito global, por lo que se encuentra al no haber ningún `x` en el ámbito local de `mostrar_global`.

#### d. Built-in Scope (B)


```python
def mostrar_longitud():
    texto = "Hola"
    print(len(texto))  # `len` es una función built-in

mostrar_longitud()  # Salida: 4
```

    4



Python encuentra `len` en el ámbito de nombres predefinidos, ya que es una función incorporada.

#### e. Combinación de todos los niveles


```python
x = "Soy global"

def funcion_externa():
    x = "Soy de la función externa"

    def funcion_interna():
        x = "Soy local"
        print(x)  # Busca en el ámbito local

    funcion_interna()

funcion_externa()  # Salida: "Soy local"
```

    Soy local


En este caso, `funcion_interna` imprime "Soy local" porque el ámbito local de `funcion_interna` tiene precedencia sobre el englobante y el global.

---

### 4. Uso de `nonlocal` y `global`

`nonlocal` y `global` son palabras clave en Python que permiten acceder y modificar variables en diferentes ámbitos.

#### a. Ejemplo con `nonlocal` para acceder a "Soy de la función externa"

Usamos `nonlocal` dentro de `funcion_interna` para acceder y modificar la variable `x` del ámbito englobante (en este caso, `funcion_externa`).


```python
def funcion_externa():
    x = "Soy de la función externa"

    def funcion_interna():
        nonlocal x  # Accede a x en el ámbito englobante
        x = "Modificado en la función interna"
        print(x)  # Imprime el valor modificado en el ámbito englobante

    funcion_interna()
    print(x)  # Confirma que el valor en el ámbito englobante ha cambiado

funcion_externa()
```

    Modificado en la función interna
    Modificado en la función interna


En este caso, `nonlocal` permite que `funcion_interna` modifique `x` en el ámbito de `funcion_externa`.

#### b. Ejemplo con `global` para acceder a "Soy global"

Usamos `global` para modificar la variable `x` en el ámbito global desde dentro de la función. Esto permite que `funcion_interna` pueda acceder y modificar `x` en el espacio de nombres global.


```python
x = "Soy global"

def funcion_externa():
    def funcion_interna():
        global x  # Accede a x en el ámbito global
        x = "Modificado en la función interna"
        print(x)  # Imprime el valor modificado en el ámbito global

    funcion_interna()
    print(x)  # Confirma que el valor en el ámbito global ha cambiado

funcion_externa()
```

    Modificado en la función interna
    Modificado en la función interna




En este ejemplo, `global` permite a `funcion_interna` cambiar el valor de `x` en el ámbito global, y este cambio es reflejado en todo el programa. 

---

### 5. ColabTurtle

`ColabTurtle` es una librería que permite usar el módulo turtle de Python en Google Colab, que generalmente no es compatible en entorno Jupyter Notebook debido a que utiliza una ventana gráfica interactiva. Esta librería proporciona una forma sencilla de usar el entorno gráfico de la tortuga en Google Colab, permitiéndote crear dibujos, gráficos y patrones de manera interactiva sin necesidad de instalar software adicional.

#### a. ¿Qué es `turtle`?

El módulo `turtle` de Python es una herramienta educativa que permite a los programadores aprender conceptos de programación mientras dibujan figuras geométricas. Usando una tortuga que se mueve por la pantalla, puedes crear gráficos y patrones.

#### b. ¿Por qué una tortuga? 

El módulo turtle de Python está inspirado en el lenguaje de programación Logo, que fue creado en la década de 1960 por Seymour Papert y otros investigadores del MIT. Logo fue diseñado principalmente como una herramienta educativa para enseñar a los niños conceptos básicos de programación a través del uso de una "tortuga" que se mueve por la pantalla, dibujando figuras geométricas.

#### c. ¿Cómo funciona `ColabTurtle`?

`ColabTurtle` permite ejecutar código de `turtle` dentro de Google Colab, utilizando un entorno gráfico que se renderiza directamente en las celdas de código de Colab. Esto hace que sea una herramienta perfecta para enseñar y practicar programación de manera visual sin salir del entorno de Colab.

#### d. Características principales de ColabTurtle

- **Dibujo en tiempo real**: Puedes dibujar figuras y patrones gráficos de manera interactiva.
- **Funciones personalizadas**: Puedes crear funciones para dibujar formas, figuras y patrones, y controlar la tortuga con comandos como `forward()`, `left()`, `right()`, etc.
- **Uso de colores**: Puedes cambiar el color de la tortuga y del trazo para hacer tus dibujos más interesantes.
- **Patrones aleatorios**: Puedes incorporar la librería `random` para generar patrones o movimientos de la tortuga de forma aleatoria, creando resultados únicos cada vez que ejecutas el código.

#### e. ¿Cómo empezar?

Para usar `ColabTurtle`, primero debes instalar la librería.


```python
!pip3 install ColabTurtle
```

Luego hacer el siguiente import.


```python
from ColabTurtle.Turtle import *
```

Finalmente inicializar la tortuga y comenzar a hacer dibujos.


```python
# Inicializa la tortuga
initializeTurtle()

# Dibuja un cuadrado
for _ in range(4):
    forward(100)
    left(90)
```

#### f. Funciones básicas

| Función          | Descripción                                                                 | Uso Ejemplo                                  |
|------------------|-----------------------------------------------------------------------------|----------------------------------------------|
| `initializeTurtle()` | Inicializa la tortuga para comenzar a dibujar.                               | `initializeTurtle()`                        |
| `forward(dist)`   | Mueve la tortuga hacia adelante una distancia especificada en píxeles.      | `forward(100)`                              |
| `backward(dist)`  | Mueve la tortuga hacia atrás una distancia especificada en píxeles.         | `backward(50)`                              |
| `left(angle)`     | Gira la tortuga hacia la izquierda un ángulo especificado en grados.        | `left(90)`                                  |
| `right(angle)`    | Gira la tortuga hacia la derecha un ángulo especificado en grados.          | `right(45)`                                 |
| `penup()`         | Levanta el lápiz, la tortuga no dibuja mientras se mueve.                   | `penup()`                                   |
| `pendown()`       | Baja el lápiz, la tortuga comienza a dibujar mientras se mueve.             | `pendown()`                                 |
| `color(pen_color, fill_color)` | Cambia el color del lápiz (trazo) y el color de relleno.              | `color("blue")`, `color("blue", "yellow")`  |
| `bgcolor(color)`  | Cambia el color de fondo del lienzo.                                         | `bgcolor("lightgray")`                      |
| `speed(speed_value)` | Cambia la velocidad de la tortuga, de 1 (lento) a 13 (rápido).              | `speed(5)`                                  |
| `reset()`         | Resetea el estado de la tortuga, borrando todo y restableciendo la posición. | `reset()`                                   |
| `clear()`         | Borra lo que ha dibujado la tortuga pero mantiene su posición.              | `clear()`                                   |


#### g. Colores disponibles

| Color        | Nombre del Color |
|--------------|------------------|
| `"black"`    | Negro            |
| `"white"`    | Blanco           |
| `"red"`      | Rojo             |
| `"green"`    | Verde            |
| `"blue"`     | Azul             |
| `"yellow"`   | Amarillo         |
| `"cyan"`     | Cian             |
| `"magenta"`  | Magenta          |
| `"orange"`   | Naranja          |
| `"purple"`   | Púrpura          |
| `"brown"`    | Marrón           |
| `"pink"`     | Rosa             |
| `"gray"`     | Gris             |

---

### 6. Ejercicios con funciones - III

#### a. Escribe una función `cuadrado` que dibuje un cuadrado de un tamaño dado.


```python
initializeTurtle()
speed(10)

def cuadrado(lado=100):
  for _ in range(4):
    forward(lado)
    right(90)

for i in range(10, 201, 10):
  cuadrado(lado=i)
```

#### b. Escribe una función que dibuje un triángulo equilátero de lado `n`.


```python
initializeTurtle()
speed(10)

def triangulo(lado=100):
  for _ in range(3):
    forward(lado)
    right(120)

for _ in range(9):
  triangulo()
  right(360/9)
```

#### c. Escribe una función que dibuje 5 cuadrados girando 360/5 cada vez.


```python
initializeTurtle()
speed(10)

def figura():
  for _ in range(5):
    cuadrado(100)
    right(360/5)

figura()
```

#### d. Escribe una función que dibuje un polígono de cualquier cantidad de lados, dado el número de lados y el tamaño del lado.


```python
initializeTurtle()
speed(10)

def poligono(lados, largo=100):
  for _ in range(lados):
    forward(largo)
    right(360/lados)

colores = ['red', 'green', 'blue']

for i in range(3, 21):
  color(colores[i % 3])
  poligono(i, 50)
  right(360/10)
```

#### e. Dibuja un círculo.


```python
initializeTurtle()
speed(11)

for i in range(5, 51, 5):
  poligono(50, i)
```

#### f. Escribe una función que utilizando la función anterior, dibuje 8 polígonos, girando 45 grados a la derecha por cada polígono.


```python
initializeTurtle()
speed(13)

def figura():
  for _ in range(8):
    poligono(9, 60)
    right(360/8)

figura()
```

#### g. Escribe una función `mandala` que sea capaz de dibujar n polígonos, usando colores de la siguiente lista.


```python
import random
import time

initializeTurtle()
speed(11)

#colores = ["red", "blue", "green", "yellow", "purple"]

def rgb():
  r = random.randint(0, 255)
  g = random.randint(0, 255)
  b = random.randint(0, 255)
  return r, g, b

def mandala(poligonos, lados, largo):
  bgcolor(rgb())
  for i in range(poligonos):
    color(rgb())
    poligono(lados, largo)
    right(360/poligonos)

while True:
  clear()
  poligonos = random.randint(3, 25)
  lados = random.randint(3, 10)
  largo = random.randint(50, 100)
  mandala(poligonos, lados, largo)
  time.sleep(1)
```

#### h. Escribe una función que dibuje una estrella de 5 puntas.


```python
initializeTurtle()
speed(10)

def estrella(largo):
  for _ in range(5):
    forward(largo)
    right(144)

estrella(150)
```

#### i. Escribe una función `mover_al_azar` que, sin dibujar, mueva la tortuga a un lugar aleatorio del lienzo.


```python
initializeTurtle()
speed(10)

def mover_al_azar():
  penup()
  x = random.randint(0, 600)
  y = random.randint(0, 300)
  goto(x, y)
  pendown()

for _ in range(10):
  mover_al_azar()
  time.sleep(1)
```

#### j. Escribe una función que dibuje n polígonos al azar, usando un color al azar para cada polígono y moviendo aleatoriamente la tortuga entre cada polígono.


```python
initializeTurtle()
speed(12)

def poligonos(n):
  for _ in range(n):
    color(rgb())
    poligono(random.randint(3, 10), random.randint(50, 100))
    mover_al_azar()
    time.sleep(1)

poligonos(10)
```

#### k. Escribe una función que dibuje una espiral cuadrada.


```python
initializeTurtle()
speed(12)

def espiral_cuadrada(lados=20):
  for lado in range(10, lados * 10 + 1, 10):
    forward(lado)
    right(90)

espiral_cuadrada(40)
```

#### l. Escribe una función que dibuje cualquier tipo de espiral, ya sea triangular, cuadrada, hexagonal, etc.


```python
initializeTurtle()
speed(12)

def espiral(lados=20, poligono=3):
  for lado in range(10, lados * 10 + 1, 10):
    forward(lado)
    right(360/poligono)

espiral(20, 10)
```

#### m. Escribe una función que dibuje un cielo estrellado.


```python
initializeTurtle()
speed(12)

def cielo_estrellado(n):
  for _ in range(n):
    color(rgb())
    estrella(random.randint(3, 10))
    mover_al_azar()

cielo_estrellado(40)
```
