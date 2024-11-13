# Funciones Avanzadas y Alcance de las Variables (Scope) - Material complementario

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



      <svg width="800" height="500">
        <rect width="100%" height="100%" fill="black"/>
        <line x1="400" y1="250" x2="400.0" y2="150.0" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="400.0" y1="150.0" x2="300.0" y2="150.0" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="300.0" y1="150.0" x2="300.0" y2="250.0" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="300.0" y1="250.0" x2="400.0" y2="250.0" stroke-linecap="round" style="stroke:white;stroke-width:4"/>
        <g visibility=visible transform="rotate(360,400.0,250.0) translate(382.0, 232.0)">
<path style=" stroke:none;fill-rule:evenodd;fill:white;fill-opacity:1;" d="M 18.214844 0.632812 C 16.109375 1.800781 15.011719 4.074219 15.074219 7.132812 L 15.085938 7.652344 L 14.785156 7.496094 C 13.476562 6.824219 11.957031 6.671875 10.40625 7.066406 C 8.46875 7.550781 6.515625 9.15625 4.394531 11.992188 C 3.0625 13.777344 2.679688 14.636719 3.042969 15.027344 L 3.15625 15.152344 L 3.519531 15.152344 C 4.238281 15.152344 4.828125 14.886719 8.1875 13.039062 C 9.386719 12.378906 10.371094 11.839844 10.378906 11.839844 C 10.386719 11.839844 10.355469 11.929688 10.304688 12.035156 C 9.832031 13.09375 9.257812 14.820312 8.96875 16.078125 C 7.914062 20.652344 8.617188 24.53125 11.070312 27.660156 C 11.351562 28.015625 11.363281 27.914062 10.972656 28.382812 C 8.925781 30.84375 7.945312 33.28125 8.238281 35.1875 C 8.289062 35.527344 8.28125 35.523438 8.917969 35.523438 C 10.941406 35.523438 13.074219 34.207031 15.136719 31.6875 C 15.359375 31.417969 15.328125 31.425781 15.5625 31.574219 C 16.292969 32.042969 18.023438 32.964844 18.175781 32.964844 C 18.335938 32.964844 19.941406 32.210938 20.828125 31.71875 C 20.996094 31.625 21.136719 31.554688 21.136719 31.558594 C 21.203125 31.664062 21.898438 32.414062 22.222656 32.730469 C 23.835938 34.300781 25.5625 35.132812 27.582031 35.300781 C 27.90625 35.328125 27.9375 35.308594 28.007812 34.984375 C 28.382812 33.242188 27.625 30.925781 25.863281 28.425781 L 25.542969 27.96875 L 25.699219 27.785156 C 28.945312 23.960938 29.132812 18.699219 26.257812 11.96875 L 26.207031 11.84375 L 27.945312 12.703125 C 31.53125 14.476562 32.316406 14.800781 33.03125 14.800781 C 33.976562 14.800781 33.78125 13.9375 32.472656 12.292969 C 28.519531 7.355469 25.394531 5.925781 21.921875 7.472656 L 21.558594 7.636719 L 21.578125 7.542969 C 21.699219 6.992188 21.761719 5.742188 21.699219 5.164062 C 21.496094 3.296875 20.664062 1.964844 19.003906 0.855469 C 18.480469 0.503906 18.457031 0.5 18.214844 0.632812"/>
</g>
      </svg>



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

```

#### b. Escribe una función que dibuje un triángulo equilátero de lado `n`.


```python

```

#### c. Escribe una función que dibuje la siguiente figura.


```python

```



      <svg width="800" height="500">
        <rect width="100%" height="100%" fill="black"/>
        <line x1="400" y1="250" x2="400.0" y2="150.0" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="400.0" y1="150.0" x2="500.0" y2="150.0" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="500.0" y1="150.0" x2="500.0" y2="250.0" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="500.0" y1="250.0" x2="400.0" y2="250.0" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="400.0" y1="250.0" x2="495.106" y2="219.098" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="495.106" y1="219.098" x2="526.008" y2="314.204" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="526.008" y1="314.204" x2="430.902" y2="345.106" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="430.902" y1="345.106" x2="400.0" y2="250.0" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="400.0" y1="250.0" x2="458.779" y2="330.902" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="458.779" y1="330.902" x2="377.877" y2="389.681" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="377.877" y1="389.681" x2="319.098" y2="308.779" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="319.098" y1="308.779" x2="400.0" y2="250.0" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="400.0" y1="250.0" x2="341.221" y2="330.902" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="341.221" y1="330.902" x2="260.319" y2="272.123" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="260.319" y1="272.123" x2="319.098" y2="191.221" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="319.098" y1="191.221" x2="400.0" y2="250.0" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="400.0" y1="250.0" x2="304.894" y2="219.098" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="304.894" y1="219.098" x2="335.796" y2="123.992" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="335.796" y1="123.992" x2="430.902" y2="154.894" stroke-linecap="round" style="stroke:white;stroke-width:4"/><line x1="430.902" y1="154.894" x2="400.0" y2="250.0" stroke-linecap="round" style="stroke:white;stroke-width:4"/>
        <g visibility=visible transform="rotate(360,400.0,250.0) translate(382.0, 232.0)">
<path style=" stroke:none;fill-rule:evenodd;fill:white;fill-opacity:1;" d="M 18.214844 0.632812 C 16.109375 1.800781 15.011719 4.074219 15.074219 7.132812 L 15.085938 7.652344 L 14.785156 7.496094 C 13.476562 6.824219 11.957031 6.671875 10.40625 7.066406 C 8.46875 7.550781 6.515625 9.15625 4.394531 11.992188 C 3.0625 13.777344 2.679688 14.636719 3.042969 15.027344 L 3.15625 15.152344 L 3.519531 15.152344 C 4.238281 15.152344 4.828125 14.886719 8.1875 13.039062 C 9.386719 12.378906 10.371094 11.839844 10.378906 11.839844 C 10.386719 11.839844 10.355469 11.929688 10.304688 12.035156 C 9.832031 13.09375 9.257812 14.820312 8.96875 16.078125 C 7.914062 20.652344 8.617188 24.53125 11.070312 27.660156 C 11.351562 28.015625 11.363281 27.914062 10.972656 28.382812 C 8.925781 30.84375 7.945312 33.28125 8.238281 35.1875 C 8.289062 35.527344 8.28125 35.523438 8.917969 35.523438 C 10.941406 35.523438 13.074219 34.207031 15.136719 31.6875 C 15.359375 31.417969 15.328125 31.425781 15.5625 31.574219 C 16.292969 32.042969 18.023438 32.964844 18.175781 32.964844 C 18.335938 32.964844 19.941406 32.210938 20.828125 31.71875 C 20.996094 31.625 21.136719 31.554688 21.136719 31.558594 C 21.203125 31.664062 21.898438 32.414062 22.222656 32.730469 C 23.835938 34.300781 25.5625 35.132812 27.582031 35.300781 C 27.90625 35.328125 27.9375 35.308594 28.007812 34.984375 C 28.382812 33.242188 27.625 30.925781 25.863281 28.425781 L 25.542969 27.96875 L 25.699219 27.785156 C 28.945312 23.960938 29.132812 18.699219 26.257812 11.96875 L 26.207031 11.84375 L 27.945312 12.703125 C 31.53125 14.476562 32.316406 14.800781 33.03125 14.800781 C 33.976562 14.800781 33.78125 13.9375 32.472656 12.292969 C 28.519531 7.355469 25.394531 5.925781 21.921875 7.472656 L 21.558594 7.636719 L 21.578125 7.542969 C 21.699219 6.992188 21.761719 5.742188 21.699219 5.164062 C 21.496094 3.296875 20.664062 1.964844 19.003906 0.855469 C 18.480469 0.503906 18.457031 0.5 18.214844 0.632812"/>
</g>
      </svg>



#### d. Escribe una función que dibuje un polígono de cualquier cantidad de lados, dado el número de lados y el tamaño del lado.


```python

```

#### e. Dibuja un círculo.


```python

```

#### f. Escribe una función que utilizando la función anterior, dibuje 8 polígonos, girando 45 grados a la derecha por cada polígono.


```python

```

#### g. Escribe una función `mandala` que sea capaz de dibujar n polígonos, usando colores de la siguiente lista.


```python
initializeTurtle()

colores = ["red", "blue", "green", "yellow", "purple"]

def mandala(poligonos, lados, largo):
    for i in range(poligonos):
        color(colores[i % 5])
        poligono(lados, largo)
        right(360/poligonos)
```

#### h. Escribe una función que dibuje una estrella de 5 puntas.


```python
initializeTurtle()

def estrella(largo):
    for _ in range(5):
        forward(largo)
        right(144)
```

#### i. Escribe una función `mover_al_azar` que, sin dibujar, mueva la tortuga a un lugar aleatorio del lienzo.


```python

```

#### j. Escribe una función que dibuje n polígonos al azar, usando un color al azar para cada polígono y moviendo aleatoriamente la tortuga entre cada polígono.


```python

```

#### k. Escribe una función que dibuje una espiral cuadrada.


```python

```

#### l. Escribe una función que dibuje cualquier tipo de espiral, ya sea triangular, cuadrada, hexagonal, etc.


```python

```

#### m. Escribe una función que dibuje un cielo estrellado.


```python

```
