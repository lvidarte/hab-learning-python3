# Clase 8: Funciones Avanzadas y Alcance de las Variables (Scope)

## Módulo 1: Funciones avanzadas - Argumentos y parámetros opcionales

### 1. Argumentos opcionales

En Python, puedes definir argumentos opcionales en una función estableciendo un valor por defecto para los parámetros. Si el usuario no proporciona un valor para ese argumento, se utilizará el valor por defecto.

#### Ejemplo de argumento opcional:


```python
def saludar(nombre, mensaje="Hola"):
    print(f"{mensaje}, {nombre}!")

# Llamada a la función con el argumento opcional
saludar("Ana")  # Usa el valor por defecto para 'mensaje'
saludar("Pedro", "Buenas tardes")  # Proporciona un valor personalizado
```

    Hola, Ana!
    Buenas tardes, Pedro!


#### Ejercicio práctico:

Crea una función llamada `calcular_precio()` que reciba dos parámetros: `precio` y `descuento`, donde `descuento` sea opcional y por defecto tenga un valor del 10%. Si el descuento no se proporciona, la función aplicará el 10%.


```python

```

### 2. Argumentos por palabra clave

Puedes llamar a una función utilizando el nombre de los parámetros en lugar de su posición. Esto se conoce como "argumentos por palabra clave" (keyword arguments), y es útil para mejorar la legibilidad y evitar errores.

##### Ejemplo con argumentos por palabra clave:


```python
def describir_persona(nombre, edad, ciudad):
    print(f"Nombre: {nombre}, Edad: {edad}, Ciudad: {ciudad}")

describir_persona(edad=30, ciudad="Madrid", nombre="Sofia")  # Se pueden cambiar las posiciones
```

    Nombre: Sofia, Edad: 30, Ciudad: Madrid


#### Ejercicio práctico:

Crea una función llamada `mostrar_informacion()` que acepte tres parámetros: `nombre`, `ocupacion`, y `edad`, pero permite al usuario pasar estos parámetros en cualquier orden al llamar la función utilizando palabras clave.


```python

```

### 3. Parámetros variables (`*args` y `**kwargs`)

Puedes usar `*args` para aceptar un número variable de argumentos posicionales y `**kwargs` para aceptar un número variable de argumentos por palabra clave.

#### Ejemplo con `*args`:


```python
def sumar_numeros(*numeros):
    return sum(numeros)

print(sumar_numeros(1, 2, 3, 4))  # Devuelve 10
```

    10


#### Ejemplo con `**kwargs`:



```python
def detalles_producto(**kwargs):
    for clave, valor in kwargs.items():
        print(f"{clave}: {valor}")

detalles_producto(nombre="Laptop", marca="Dell", precio=1500)
```

    nombre: Laptop
    marca: Dell
    precio: 1500


#### Ejercicio práctico:

Crea una función llamada `registro_evento()` que acepte un número variable de asistentes (usando `*args`) y detalles opcionales sobre el evento (usando `**kwargs`).


```python

```

---

## Módulo 2: Alcance de las Variables (Scope)

### 1. Alcance de las variables

El "alcance" o **scope** de una variable determina dónde se puede acceder a ella en el código. Python tiene dos tipos principales de alcance:

- **Local**: Las variables definidas dentro de una función solo son accesibles dentro de esa función.
- **Global**: Las variables definidas fuera de cualquier función pueden ser accesibles en todo el programa.

#### Ejemplo de variables locales:

#### Ejemplo de variables globales:


```python
y = 20  # 'y' es una variable global

def otra_funcion():
    print(y)  # Accede a la variable global

otra_funcion()  # Imprime 20
```

    20


#### Ejercicio práctico:

Crea una función llamada `mostrar_valores()` que imprima una variable local `a` y una variable global `b`.


```python

```

### 2. Modificar variables globales dentro de una función

Para modificar una variable global dentro de una función, se debe utilizar la palabra clave `global`.

##### Ejemplo de modificación de una variable global:


```python
z = 5  # Variable global

def cambiar_valor():
    global z
    z = 10  # Modifica la variable global
    print("Valor dentro de la función:", z)

cambiar_valor()  # Imprime 10
print("Valor fuera de la función:", z)  # Imprime 10
```

    Valor dentro de la función: 10
    Valor fuera de la función: 10


#### Ejercicio práctico:

Escribe una función llamada `incrementar()` que incremente una variable global `contador` cada vez que se llame. Usa la palabra clave `global` para modificar `contador` desde dentro de la función.



```python

```

### 3. Alcance anidado (nonlocal)

Dentro de funciones anidadas, se puede acceder y modificar variables de la función externa usando la palabra clave `nonlocal`.

#### Ejemplo con `nonlocal`:


```python
def funcion_externa():
    x = "local"

    def funcion_interna():
        nonlocal x
        x = "modificada"
        print("Dentro de funcion_interna:", x)

    funcion_interna()
    print("Dentro de funcion_externa:", x)

funcion_externa()
```

    Dentro de funcion_interna: modificada
    Dentro de funcion_externa: modificada


#### Ejercicio práctico:

Escribe dos funciones anidadas: `exterior()` e `interior()`. Usa `nonlocal` en `interior()` para modificar una variable definida en `exterior()`.


```python

```
