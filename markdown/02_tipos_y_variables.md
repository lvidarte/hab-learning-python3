# Clase 2: Tipos y Variables en Python

## Módulo 1: Tipos de datos en Python

### 1. Tipos de datos básicos

Python tiene varios tipos de datos básicos. A continuación, se describen los más comunes:

- **Números**:
  - **Enteros (int)**: Números enteros, positivos o negativos, sin decimales. Ejemplo: `42`, `-3`.
  - **Flotantes (float)**: Números reales, que pueden incluir decimales. Ejemplo: `3.14`, `-0.001`.
  - **Cadenas (str)**: Secuencias de caracteres que se utilizan para representar texto. Las cadenas se pueden definir con comillas simples o dobles. Ejemplo: `'Hola, mundo!'`, `"Python es genial!"`.
  - **Booleanos (bool)**: Representan valores de verdad. Solo pueden ser `True` o `False`.



```python
type(10)
```




    int




```python
type(3.14)
```




    float




```python
print("hola", type("hola"))
```

    hola <class 'str'>



```python
print(True, type(True), False, type(False))
```

    True <class 'bool'> False <class 'bool'>


### 2. Conversión de tipos

Es posible convertir entre diferentes tipos de datos utilizando funciones integradas, como:

- `int()`: Convierte un valor a entero.
- `float()`: Convierte un valor a flotante.
- `str()`: Convierte un valor a cadena.

#### Ejemplo de conversión de tipos:


```python
type(int("100"))
```




    int




```python
type(float("100"))
```




    float




```python
type(str(100))
```




    str



### 3. Ejercicio práctico

1. Defina un número entero, un número flotante, y una cadena.
2. Imprima cada uno de ellos y su tipo utilizando `type()`.
3. Realiza conversiones entre tipos y muestra los resultados.


```python

```

---

## Módulo 2: Variables y asignación

### 1. ¿Qué es una variable?

Una variable es un espacio en la memoria que se utiliza para almacenar datos. En Python, no es necesario declarar el tipo de variable antes de usarla, ya que Python utiliza tipado dinámico.

### 2. Asignación de variables

Para asignar un valor a una variable, se utiliza el operador `=`. La sintaxis es la siguiente:

```python
nombre_variable = valor
```

#### Ejemplo de asignación de variables:



```python
# Variable de tipo int
num = 10

# Al inicializar una variable el valor no se muestra en pantalla.
# Para ver el valor de la variable podemos usar print
print(num)
```

    10



```python
# Variable de tipo str
nombre = "Lucas"
print(nombre)
```

    Lucas



```python
# Variable de tipo bool
en_ejecucion = True
print(en_ejecucion, type(en_ejecucion))
```

    True <class 'bool'>


### 3. Nombres de variables

Los nombres de las variables deben seguir ciertas reglas:

- Pueden contener letras, números y guiones bajos (_).
- No pueden comenzar con un número.
- No pueden contener espacios ni caracteres especiales.
- No pueden ser palabras reservadas de Python (como `if`, `for`, `while`, etc.).

### 4. Ejercicio práctico

1. Define al menos tres variables de diferentes tipos (int, float, str).
2. Imprime el valor y el tipo de cada variable.
3. Realiza cambios en los valores de las variables y vuelve a imprimirlos.


```python

```
