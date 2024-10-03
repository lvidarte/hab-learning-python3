# Clase 5: Listas, Tuplas y Conjuntos

## Módulo 1: Listas

### 1. Introducción a las listas

Las listas en Python son colecciones ordenadas y mutables, lo que significa que puedes modificar sus elementos después de haberlas creado. Se definen usando corchetes `[]`.

#### Ejemplo básico de una lista:


```python
frutas = ["manzana", "banana", "cereza"]
print(frutas)
```

    ['manzana', 'banana', 'cereza']


#### 2. Acceso y modificación de elementos

Puedes acceder a los elementos de una lista mediante su índice, y modificar los elementos directamente.

##### Ejemplo:


```python
print(frutas[1])  # Acceso al segundo elemento: 'banana'
frutas[1] = "mango"  # Cambia 'banana' por 'mango'
print(frutas)
```

    banana
    ['manzana', 'mango', 'cereza']


#### 3. Métodos comunes de las listas

Algunos métodos útiles de las listas incluyen:

- **append()**: Agrega un elemento al final de la lista.
- **insert()**: Inserta un elemento en una posición específica.
- **remove()**: Elimina el primer elemento que coincide con el valor.
- **pop()**: Elimina el elemento en una posición específica (por defecto, el último).
- **sort()**: Ordena los elementos de la lista.

##### Ejemplo:


```python
frutas.append("naranja")  # Agrega 'naranja' al final
print(frutas)
```

    ['manzana', 'mango', 'cereza', 'naranja']



```python
frutas.insert(1, "kiwi")  # Inserta 'kiwi' en la posición 1
print(frutas)
```

    ['manzana', 'kiwi', 'mango', 'cereza', 'naranja']



```python
frutas.remove("manzana")  # Elimina 'manzana'
print(frutas)
```

    ['kiwi', 'mango', 'cereza', 'naranja']



```python
ultima_fruta = frutas.pop()  # Elimina el último elemento y lo guarda
print("Última fruta eliminada:", ultima_fruta)
print(frutas)
```

    Última fruta eliminada: naranja
    ['kiwi', 'mango', 'cereza']



```python
frutas.sort()  # Ordena la lista alfabéticamente
print(frutas)
```

    ['cereza', 'kiwi', 'mango']


#### 4. Listas anidadas

Las listas pueden contener otras listas, lo que se llama listas anidadas.

##### Ejemplo:


```python
lista_anidada = [["manzana", "banana"], ["zanahoria", "pepino"]]
print(lista_anidada[0])  # Acceso a la primera sublista
print(lista_anidada[1][1])  # Acceso a 'pepino'
```

    ['manzana', 'banana']
    pepino


#### Ejercicio práctico:

Crea una lista con al menos 5 números enteros. Luego, realiza las siguientes acciones:
1. Agrega un número al final de la lista.
2. Inserta un número en la segunda posición.
3. Elimina el tercer número.
4. Ordena la lista de menor a mayor.


```python

```

---

## Módulo 2: Tuplas y conjuntos

### 1. Tuplas

Las tuplas son similares a las listas, pero a diferencia de estas, son inmutables (no se pueden modificar una vez creadas). Se definen usando paréntesis `()`.

#### Ejemplo básico de una tupla:


```python
mi_tupla = ("manzana", "banana", "cereza")
print(mi_tupla)
```

    ('manzana', 'banana', 'cereza')


#### 2. Acceso a elementos en una tupla

Puedes acceder a los elementos de una tupla de la misma manera que en las listas, usando índices, pero no puedes modificar sus elementos.

##### Ejemplo:


```python
print(mi_tupla[1])  # Acceso al segundo elemento: 'banana'

# Intentar modificar un elemento dará un error:
# mi_tupla[1] = "mango"  # Esto generará un TypeError
```

    banana


#### 3. Conversión de tuplas a listas

Si necesitas modificar una tupla, puedes convertirla temporalmente a una lista, hacer los cambios y volver a convertirla en tupla.

##### Ejemplo:


```python
mi_lista = list((1, 2, 3))  # Convertir tupla a lista
mi_lista[1] = "mango"  # Modificar la lista
mi_tupla = tuple(mi_lista)  # Convertir lista de nuevo a tupla
print(mi_tupla)
```

    (1, 'mango', 3)


#### Ejercicio práctico:

Crea una tupla con 4 colores diferentes. Luego, convierte la tupla en una lista, cambia el segundo color, y vuelve a convertir la lista en tupla.


```python

```

### 4. Conjuntos

Los conjuntos son colecciones desordenadas y no permiten elementos duplicados. Se definen usando llaves `{}` o la función `set()`.

#### Ejemplo básico de un conjunto:


```python
mi_conjunto = {"manzana", "banana", "cereza"}
print(mi_conjunto)
```

    {'cereza', 'banana', 'manzana'}


#### 5. Métodos de conjuntos

Los conjuntos permiten operaciones como:

- **add()**: Agrega un elemento al conjunto.
- **remove()**: Elimina un elemento del conjunto (genera un error si no existe).
- **discard()**: Elimina un elemento del conjunto (no genera error si no existe).
- **union()**: Une dos conjuntos.
- **intersection()**: Devuelve los elementos comunes entre dos conjuntos.
- **difference()**: Devuelve los elementos que están en el primer conjunto pero no en el segundo.

##### Ejemplo:


```python
mi_conjunto.add("naranja")  # Agrega 'naranja' al conjunto
print(mi_conjunto)
```

    {'cereza', 'banana', 'manzana', 'naranja'}



```python
mi_conjunto.remove("banana")  # Elimina 'banana' del conjunto
print(mi_conjunto)
```

    {'cereza', 'manzana', 'naranja'}



```python
# Conjuntos para realizar operaciones:
A = {1, 2, 3, 4}
B = {3, 4, 5, 6}

union = A.union(B)  # Unión de A y B
print("Unión:", union)
```

    Unión: {1, 2, 3, 4, 5, 6}



```python
interseccion = A.intersection(B)  # Intersección de A y B
print("Intersección:", interseccion)
```

    Intersección: {3, 4}



```python
diferencia = A.difference(B)  # Elementos en A que no están en B
print("Diferencia:", diferencia)
```

    Diferencia: {1, 2}


#### Ejercicio práctico:

Crea dos conjuntos con números enteros. Luego:
1. Realiza la unión de ambos conjuntos.
2. Encuentra la intersección de los conjuntos.
3. Encuentra la diferencia entre ambos conjuntos.


```python

```
