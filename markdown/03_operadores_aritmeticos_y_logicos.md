# Clase 3: Operadores en Python

## Módulo 1: Operadores aritméticos y lógicos

### 1. Operadores aritméticos

Los operadores aritméticos se utilizan para realizar operaciones matemáticas comunes como suma, resta, multiplicación, etc.

#### Ejemplos de operadores aritméticos:

| Operador | Operación | Ejemplo |
| -------- | --------- | ------- |
| `+` | Suma | `x + y` |
| `-` | Resta | `x - y` |
| `*` | Multiplicación | `x * y` |
| `/` | División (devuelve un valor `float`) | `x / y` |
| `//` | División entera (descarta la parte decimal) | `x // y` |
| `%` | Módulo (devuelve el resto de la división) | `x % y` |
| `**` | Potencia | `x ** y` |


##### Ejemplo:


```python
a = 10
b = 3

print("Suma:", a + b)  # Suma
print("Resta:", a - b)  # Resta
print("Multiplicación:", a * b)  # Multiplicación
print("División:", a / b)  # División
print("División entera:", a // b)  # División entera
print("Módulo:", a % b)  # Módulo
print("Potencia:", a ** b)  # Potencia
```

    Suma: 13
    Resta: 7
    Multiplicación: 30
    División: 3.3333333333333335
    División entera: 3
    Módulo: 1
    Potencia: 1000


#### Ejercicio práctico:

Define dos variables de tipo `float` y aplica todos los operadores aritméticos mencionados.


```python

```

## 2. Operadores lógicos

### Operadores lógicos

Los operadores lógicos permiten realizar operaciones que resultan en valores booleanos (`True` o `False`).

#### Ejemplos de operadores lógicos:

- **and**: Devuelve `True` si ambas condiciones son verdaderas.
- **or**: Devuelve `True` si al menos una de las condiciones es verdadera.
- **not**: Devuelve `True` si la condición es falsa y viceversa.

##### Ejemplo:


```python
x = True
y = False

print("x and y:", x and y)  # Devuelve False
print("x or y:", x or y)  # Devuelve True
print("not x:", not x)  # Devuelve False
```

    x and y: False
    x or y: True
    not x: False


#### Ejercicio práctico:

Crea un programa que defina tres variables booleanas y aplique los operadores lógicos `and`, `or` y `not`, mostrando los resultados.


```python

```

---

## Módulo 2: Operadores de comparación

### 1. Operadores de comparación

Los operadores de comparación comparan dos valores y devuelven `True` o `False` según la condición.

#### Ejemplos de operadores de comparación:

- **Igual a (==)**: Verifica si dos valores son iguales.
- **Distinto de (!=)**: Verifica si dos valores son diferentes.
- **Mayor que (>)**: Verifica si el valor de la izquierda es mayor que el de la derecha.
- **Menor que (<)**: Verifica si el valor de la izquierda es menor que el de la derecha.
- **Mayor o igual que (>=)**: Verifica si el valor de la izquierda es mayor o igual que el de la derecha.
- **Menor o igual que (<=)**: Verifica si el valor de la izquierda es menor o igual que el de la derecha.

##### Ejemplo:


```python
a = 5
b = 10

print("a == b:", a == b)  # Devuelve False
print("a != b:", a != b)  # Devuelve True
print("a > b:", a > b)  # Devuelve False
print("a < b:", a < b)  # Devuelve True
print("a >= b:", a >= b)  # Devuelve False
print("a <= b:", a <= b)  # Devuelve True
```

#### Ejercicio práctico:

Escribe un programa que solicite al usuario dos números y luego aplique todos los operadores de comparación, mostrando los resultados.


```python

```

## 2. Uso combinado de operadores

### Uso combinado de operadores aritméticos, lógicos y de comparación

En Python, puedes combinar operadores para crear expresiones más complejas. Las expresiones lógicas pueden contener operadores de comparación y aritméticos.

##### Ejemplo:


```python
x = 20
y = 15
z = 10

resultado = (x > y) and (y > z)  # Devuelve True
print("Resultado:", resultado)

resultado_2 = (x + z > y) or (z - y > x)  # Devuelve True
print("Resultado 2:", resultado_2)
```

### Ejercicio práctico:

Escribe un programa que combine operadores aritméticos y de comparación, usando también operadores lógicos `and`, `or` o `not`. El programa debe evaluar si una serie de operaciones matemáticas cumplen con una condición específica.


```python

```
