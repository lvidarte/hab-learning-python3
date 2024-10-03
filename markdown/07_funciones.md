# Clase 7: Funciones en Python, Parámetros y Retorno de Valores

## Módulo 1: Funciones en Python

### 1. Definición y uso de funciones

Una función en Python es un bloque de código reutilizable que realiza una tarea específica. Las funciones se definen usando la palabra clave `def`, seguidas por el nombre de la función y paréntesis `()`.

#### Ejemplo básico de una función:


```python
def saludar():
    print("Hola, bienvenidos al curso de Python")

# Llamar a la función
saludar()
```

    Hola, bienvenidos al curso de Python


#### 2. Ventajas de usar funciones

Las funciones permiten:

- Reutilizar código
- Dividir un programa en partes más pequeñas y manejables
- Evitar la repetición de código

#### Ejercicio práctico:

Escribe una función llamada `despedida()` que imprima un mensaje de despedida. Llama a la función tres veces.


```python

```

### 3. Argumentos y parámetros

Una función puede aceptar datos (argumentos) para personalizar su comportamiento. Los parámetros se definen dentro de los paréntesis al definir la función.

##### Ejemplo con parámetros:


```python
def saludar_persona(nombre):
    print(f"Hola, {nombre}!")

saludar_persona("Ana")
saludar_persona("Juan")
```

    Hola, Ana!
    Hola, Juan!


--- 

## Módulo 2: Parámetros y retorno de valores

### 1. Parámetros por defecto

Puedes definir valores por defecto para los parámetros de una función, que se utilizarán si no se proporciona un argumento al llamar a la función.

#### Ejemplo de parámetros por defecto:


```python
def saludar_persona(nombre="invitado"):
    print(f"Hola, {nombre}!")

saludar_persona()  # Llama a la función sin argumentos
saludar_persona("Pedro")  # Llama a la función con un argumento
```

    Hola, invitado!
    Hola, Pedro!


#### Ejercicio práctico:

Escribe una función llamada `presentar()` que reciba dos parámetros, `nombre` y `edad`, donde `edad` tenga un valor por defecto de 18. Si no se proporciona una edad, debe usar el valor por defecto.


```python

```

### 2. Retorno de valores

Las funciones pueden devolver un valor usando la palabra clave `return`. Esto permite que el resultado de una función sea utilizado en otros cálculos o tareas.

#### Ejemplo de función que devuelve un valor:


```python
def sumar(a, b):
    return a + b

resultado = sumar(5, 3)
print("La suma es:", resultado)
```

    La suma es: 8


##### Ejemplo de función con varios valores de retorno:


```python
def operaciones(a, b):
    suma = a + b
    resta = a - b
    return suma, resta

resultado_suma, resultado_resta = operaciones(8, 4)
print(f"Suma: {resultado_suma}, Resta: {resultado_resta}")
```

    Suma: 12, Resta: 4


#### Ejercicio práctico:

Escribe una función llamada `calcular_potencia()` que reciba dos números como parámetros y devuelva el resultado de elevar el primero al segundo.


```python

```

### 3. Funciones con parámetros variables

A veces, es útil definir funciones que puedan recibir un número variable de argumentos usando `*args` o `**kwargs`.

#### Ejemplo con `*args`:


```python
def sumar_todos(*numeros):
    return sum(numeros)

print(sumar_todos(1, 2, 3, 4))  # Devuelve 10
```

    10


#### Ejemplo con `**kwargs`:


```python
def detalles_persona(**kwargs):
    for clave, valor in kwargs.items():
        print(f"{clave}: {valor}")

detalles_persona(nombre="Laura", edad=25, ciudad="Madrid")
```

    nombre: Laura
    edad: 25
    ciudad: Madrid


#### Ejercicio práctico:

Escribe una función llamada `calcular_total()` que reciba un número variable de precios y devuelva la suma de todos los precios.


```python

```
