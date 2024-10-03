# Clase 4: Estructuras de Control en Python

## Módulo 1: Condicionales

### 1. Estructuras condicionales

Las estructuras condicionales permiten que un programa ejecute diferentes bloques de código dependiendo de si una condición es verdadera o falsa.

#### Sintaxis básica:

- **if**: Evalúa una condición. Si es verdadera, ejecuta el bloque de código asociado.
- **elif**: Se usa después de un `if` para evaluar otra condición si la primera es falsa.
- **else**: Se ejecuta si todas las condiciones anteriores son falsas.

##### Ejemplo:


```python
x = 10

if x > 5:
    print("x es mayor que 5")
elif x == 5:
    print("x es igual a 5")
else:
    print("x es menor que 5")
```

#### Ejercicio práctico:

Crea un programa que dado un número `n` determine si es positivo, negativo o cero usando estructuras condicionales.


```python

```

---

## Módulo 2: Bucles (while y for)

### 1. Bucle `while`

El bucle `while` ejecuta un bloque de código mientras una condición sea verdadera. Si la condición nunca cambia a `False`, el bucle puede ser infinito.

#### Sintaxis básica:

```python
while condición:
    # código a ejecutar mientras la condición sea verdadera
```

##### Ejemplo:


```python
i = 1
while i <= 5:
    print(i)
    i += 1  # Incrementamos i para evitar un bucle infinito
```

#### Ejercicio práctico:

Escribe un programa que imprima los números del 1 al 10 utilizando un bucle `while`.


```python

```

### 2. Bucle `for`

El bucle `for` en Python itera sobre una secuencia (como una lista, una cadena, o un rango de números).

#### Sintaxis básica:

```python
for variable in secuencia:
    # código a ejecutar en cada iteración
```

##### Ejemplo:


```python
for letra in "Python":
    print(letra)
```

El bucle anterior imprimirá cada letra de la palabra "Python".

#### Ejercicio práctico:

Escribe un programa que recorra una lista de números y calcule su suma utilizando un bucle `for`.


```python

```

## 3. Uso de `range()`

La función `range()` genera una secuencia de números y es útil cuando necesitas un rango de valores en un bucle `for`.

##### Ejemplo:


```python
for i in range(5):  # Genera los números de 0 a 4
    print(i)
```

#### Ejercicio práctico:

Escribe un programa que imprima los números del 1 al 20 usando `range()`.


```python

```

#### Ejercicio de combinación de estructuras de control

Combina condicionales y bucles para crear un programa que pida al usuario un número del 1 al 10, e imprima la tabla de multiplicar de ese número (del 1 al 10).

##### Ejemplo:


```python
numero = int(input("Ingresa un número entero en el rango de 1 a 10"))

if 1 <= numero <= 10:
    print(f"Tabla de multiplicar del {numero}:")
    for i in range(1, 11):
        print(f"{numero} x {i} = {numero * i}")
else:
    print("Número fuera de rango. Debe estar entre 1 y 10.")
```

    Tabla de multiplicar del 2:
    2 x 1 = 2
    2 x 2 = 4
    2 x 3 = 6
    2 x 4 = 8
    2 x 5 = 10
    2 x 6 = 12
    2 x 7 = 14
    2 x 8 = 16
    2 x 9 = 18
    2 x 10 = 20

