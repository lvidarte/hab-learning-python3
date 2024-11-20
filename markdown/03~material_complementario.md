# Clase 3: Material complementario

### 1. ¿Qué es un operador?

En programación, un **operador** es un *símbolo o palabra reservada* que indica una operación específica a realizar sobre uno o más valores (llamados **operandos**). Los operadores permiten realizar cálculos matemáticos, comparar valores, manipular datos, realizar operaciones lógicas, y más. Python, como muchos otros lenguajes de programación, incluye diversos tipos de operadores para trabajar con distintos tipos de datos y realizar operaciones comunes.

#### a. Clasificación de operadores en Python (y en otros lenguajes)

- **Operadores aritméticos**
   - Realizan operaciones matemáticas básicas, como suma, resta, multiplicación y división.
   - Ejemplos en Python: `+`, `-`, `*`, `/`, `%` (módulo), `**` (potencia), `//` (división entera).

- **Operadores de comparación o relacionales**
   - Comparan dos valores y devuelven un valor booleano (`True` o `False`) indicando si la comparación es verdadera.
   - Ejemplos en Python: `==` (igualdad), `!=` (desigualdad), `<`, `<=`, `>`, `>=`.

- **Operadores lógicos**
   - Permiten construir expresiones lógicas y combinar valores booleanos.
   - Ejemplos en Python: `and`, `or`, `not`.

- **Operadores de asignación**
   - Asignan valores a variables. En Python, el operador de asignación simple es `=`, pero existen operadores compuestos que combinan la asignación con una operación.
   - Ejemplos: `=`, `+=`, `-=`, `*=`, `/=`, etc.

- **Operadores de bits**
   - Operan a nivel de bits entre valores enteros, permitiendo realizar desplazamientos y comparaciones directas de los bits.
   - Ejemplos en Python: `&` (AND bit a bit), `|` (OR bit a bit), `^` (XOR bit a bit), `~` (complemento a nivel de bits), `<<` (desplazamiento a la izquierda), `>>` (desplazamiento a la derecha).

- **Operadores de pertenencia**
   - Verifican si un valor está presente dentro de una colección (listas, cadenas, etc.).
   - Ejemplos en Python: `in`, `not in`.

- **Operadores de identidad**
   - Verifican si dos variables apuntan al mismo objeto en memoria.
   - Ejemplos en Python: `is`, `is not`.

#### b. Ejemplo en Python

En una expresión como:

```python
a = 5
b = 10
c = a + b
```

- El operador de asignación `=` asigna a `a` el valor `5`.
- El operador `+` suma `a` y `b`.
- Otro operador de asignación `=` asigna a `c` el resultado de la suma.

#### c. Importancia de los Operadores

Los operadores son esenciales porque permiten realizar transformaciones y cálculos con los datos de una manera simple y eficiente. Facilitan tareas complejas, desde matemáticas básicas hasta manipulaciones avanzadas de datos, y constituyen una parte fundamental de la lógica en la programación.

---

### 2. Palabras reservadas

En Python, las **[palabras reservadas](https://docs.python.org/es/3/reference/lexical_analysis.html#keywords)** son términos que tienen un significado especial y están predefinidos en el lenguaje. Estas palabras no pueden usarse como identificadores (nombres de variables, funciones, clases, etc.), ya que tienen un propósito específico en la estructura y sintaxis del código. Cada palabra reservada está asociada a una funcionalidad particular, como el control de flujo, la definición de estructuras, la lógica booleana, o la gestión de excepciones.

<table>
    <tr>
        <td>False</td>
        <td>await</td>
        <td>else</td>
        <td>import</td>
        <td>pass</td>
    </tr>
    <tr>
        <td>None</td>
        <td>break</td>
        <td>except</td>
        <td><span style="color:red">in</span></td>
        <td>raise</td>
    </tr>
    <tr>
        <td>True</td>
        <td>class</td>
        <td>finally</td>
        <td><span style="color:red">is</span></td>
        <td>return</td>
    </tr>
    <tr>
        <td><span style="color:red">and</span></td>
        <td>continue</td>
        <td>for</td>
        <td>lambda</td>
        <td>try</td>
    </tr>
    <tr>
        <td>as</td>
        <td>def</td>
        <td>from</td>
        <td>nonlocal</td>
        <td>while</td>
    </tr>
    <tr>
        <td>assert</td>
        <td>del</td>
        <td>global</td>
        <td><span style="color:red">not</span></td>
        <td>with</td>
    </tr>
    <tr>
        <td>async</td>
        <td>elif</td>
        <td>if</td>
        <td><span style="color:red">or</span></td>
        <td>yield</td>
    </tr>
</table>

#### a. Error al usar palabras reservadas


```python
class = 10
```


      Cell In[1], line 1
        class = 10
              ^
    SyntaxError: invalid syntax




```python
def lambda():
    pass
```


      Cell In[3], line 1
        def lambda():
            ^
    SyntaxError: invalid syntax



---

### 3. Precedencia de operadores

En Python, la **precedencia de operadores** determina el orden en el cual se evalúan las expresiones cuando se combinan varios operadores. Los operadores de mayor precedencia se evalúan antes que los de menor precedencia. Así se organizan en Python, desde los de mayor a menor prioridad:

1. **Operadores de paréntesis `()`**
   - Los paréntesis tienen la precedencia más alta y se usan para agrupar expresiones, asegurando que las operaciones dentro de ellos se realicen primero.
   - Ejemplo: `2 * (3 + 4)` evalúa `3 + 4` primero.

2. **Operadores de potencia `**`**
   - La potencia se evalúa después de los paréntesis.
   - Ejemplo: `2 ** 3` da `8`.

3. **Operadores unarios `+x`, `-x`, `~x`**
   - Cambian el valor de una variable numérica (`+` para positivo, `-` para negativo y `~` para su complemento a nivel de bits).
   - Ejemplo: `-5` o `+3`.

4. **Multiplicación, división, división entera y módulo `*`, `/`, `//`, `%`**
   - Estos operadores tienen la misma precedencia y se evalúan de izquierda a derecha.
   - Ejemplo: `10 / 5 * 2` evalúa `10 / 5` primero.

5. **Suma y resta `+`, `-`**
   - La suma y la resta también se evalúan de izquierda a derecha.
   - Ejemplo: `5 + 3 - 2` evalúa `5 + 3` primero.

6. **Operadores de desplazamiento de bits `<<`, `>>`**
   - Son operadores para desplazar bits a la izquierda o derecha.
   - Ejemplo: `4 << 1` (desplaza los bits de `4` a la izquierda).

7. **Operadores de comparación `<`, `<=`, `>`, `>=`**
   - Comparan dos valores numéricos, retornando `True` o `False`.
   - Ejemplo: `5 < 3` da `False`.

8. **Igualdad y desigualdad `==`, `!=`**
   - Comparan si dos valores son iguales o diferentes.
   - Ejemplo: `5 == 5` da `True`.

9. **Operadores bit a bit `&`, `^`, `|`**
   - Operan a nivel de bits entre números enteros.
   - Ejemplo: `5 & 3` hace una comparación bit a bit.

10. **Operadores lógicos `not`, `and`, `or`**
   - La precedencia entre operadores lógicos es la siguiente: `not` es el de mayor prioridad, seguido por `and` y luego `or`.
   - Ejemplo: `True and False or True` evalúa `True and False` primero.

11. **Operador de asignación y operadores compuestos `=`, `+=`, `-=`, `*=`, `/=`, etc.**
   - Estos operadores se usan para asignar valores a las variables y tienen la precedencia más baja.
   - Ejemplo: `x = 5` asigna `5` a `x`.


#### a. TIP: Ante la duda, usar paréntesis

En caso de duda, **es útil utilizar paréntesis** para especificar el orden deseado de evaluación, aunque no siempre sean necesarios. Esto mejora la legibilidad del código y evita confusiones en operaciones complejas.

#### b Ejemplo de encadenamiento de operadores


```python
10 + 5 * 2 - 3 / 1 ** 2
```




    17.0




**Evaluación Paso a Paso**:
   - Primero, evaluamos la potencia: `1 ** 2` resulta en `1`.
   - Ahora, la expresión se ve así: `10 + 5 * 2 - 3 / 1`.
   - A continuación, evaluamos la multiplicación y la división de izquierda a derecha:
     - `5 * 2` resulta en `10`.
     - La expresión ahora es: `10 + 10 - 3 / 1`.
     - Luego, `3 / 1` resulta en `3.0`.
     - La expresión se convierte en: `10 + 10 - 3.0`.
   - Finalmente, evaluamos la suma y la resta de izquierda a derecha:
     - `10 + 10` resulta en `20`.
     - La expresión final es: `20 - 3.0`, que resulta en `17.0`.

---

### 4. Representaciones Numéricas en Python

Python soporta varias notaciones numéricas para representar y trabajar con distintos sistemas de numeración. Aquí tienes un resumen de las principales notaciones:

#### a. Decimal (Base 10)
   - Es la notación numérica estándar en la mayoría de los lenguajes de programación.
   - No requiere ningún prefijo.
   - Puede representar enteros (`int`) y flotantes (`float`).


```python
123 # Número entero en decimal
```




    123




```python
123.45 # Número decimal con punto flotante
```




    123.45



#### b. Binario (Base 2)
   - Usa el prefijo `0b` o `0B` para indicar binario.
   - Solo soporta enteros; no hay notación directa para binarios con decimales.


```python
0b1010  # Representa el número 10 en decimal
```




    10



#### c. Octal (Base 8)
   - Usa el prefijo `0o` o `0O` para indicar octal.
   - Solo para enteros.


```python
0o12  # Representa el número 10 en decimal
```




    10



#### d. Hexadecimal (Base 16)
   - Usa el prefijo `0x` o `0X` para indicar hexadecimal.
   - Solo para enteros.


```python
0x1A  # Representa el número 26 en decimal
```




    26



#### e. Notación científica (punto flotante en Base 10)
   - Usa `e` o `E` para indicar la potencia de 10.
   - Solo para valores de punto flotante, permitiendo representar números muy grandes o muy pequeños.


```python
1.23e6   # Científico grande: Equivale a 1.23 * 10^6
```




    1230000.0




```python
4.56e-3  # Científico pequeño: Equivale a 4.56 * 10^-3
```




    0.00456



#### f. Notación compleja
   - Python también soporta números complejos, usando `j` para denotar la parte imaginaria.


```python
3 + 4j  # Número complejo con parte real 3 e imaginaria 4
```




    (3+4j)



#### g. Resumen de notaciones numéricas en Python

| Notación               | Prefijo    | Ejemplo Literal  | Tipo de Datos |
|------------------------|------------|------------------|---------------|
| Decimal                | *Ninguno*  | `123`, `45.67`  | `int`, `float` |
| Binario (Base 2)       | `0b` / `0B`| `0b1010`        | `int`         |
| Octal (Base 8)         | `0o` / `0O`| `0o12`          | `int`         |
| Hexadecimal (Base 16)  | `0x` / `0X`| `0x1A`          | `int`         |
| Científica             | `e` / `E`  | `1.23e6`        | `float`       |
| Compleja               | *Ninguno*  | `3 + 4j`        | `complex`     |

---

### 5. Operadores de bits

Aquí tienes ejemplos prácticos de los operadores de bits en Python usando la notación binaria. Cada operación muestra cómo manipular valores a nivel de bits utilizando números binarios.

#### a. AND bit a bit (`&`)
   - Realiza una operación AND bit a bit entre dos números; el resultado tiene un `1` en cada posición donde ambos bits son `1`.

**Tabla de verdad AND:**
| X | Y | X AND Y |
|:-:|:-:|:-------:|
| 0 | 0 |    0    |
| 0 | 1 |    0    |
| 1 | 0 |    0    |
| 1 | 1 |    1    |

El operador AND produce 1 solo si ambas entradas (X e Y) son 1; de lo contrario, da 0.


```python
a = 0b1101  # 13 en decimal
b = 0b1011  # 11 en decimal

bin(a & b)  # Resultado: 0b1001 (9 en decimal)
```




    '0b1001'



#### b. OR bit a bit (`|`)
   - Realiza una operación OR bit a bit; el resultado tiene un `1` en cada posición donde al menos uno de los bits es `1`.

**Tabla de verdad OR:**
| X | Y | X OR Y |
|:-:|:-:|:------:|
| 0 | 0 |   0    |
| 0 | 1 |   1    |
| 1 | 0 |   1    |
| 1 | 1 |   1    |

El operador OR produce 1 si al menos una de las entradas (X o Y) es 1; solo da 0 cuando ambas entradas son 0.


```python
a = 0b1101  # 13 en decimal
b = 0b1011  # 11 en decimal

bin(a | b)  # Resultado: 0b1111 (15 en decimal)
```




    '0b1111'



#### c. XOR bit a bit (`^`)
   - Realiza una operación XOR bit a bit; el resultado tiene un `1` en cada posición donde los bits son diferentes.

**Tabla de verdad XOR:**
| X | Y | X XOR Y |
|:-:|:-:|:-------:|
| 0 | 0 |    0    |
| 0 | 1 |    1    |
| 1 | 0 |    1    |
| 1 | 1 |    0    |

El operador XOR produce 1 si exactamente una de las entradas (X o Y) es 1; da 0 cuando ambas son iguales (ambas 0 o ambas 1).


```python
a = 0b1101  # 13 en decimal
b = 0b1011  # 11 en decimal

bin(a ^ b)  # Resultado: 0b0110 (6 en decimal)
```




    '0b110'



#### d. NOT bit a bit (`~`)
   - Invierte todos los bits del número (de `0` a `1` y de `1` a `0`). Nota: en Python, esto da como resultado el complemento a dos, que es el valor negado más uno.


```python
a = 0b1101  # 13 en decimal

bin(~a)  # Resultado: -0b1110 (-14 en decimal)
```




    '-0b1110'



#### e. Desplazamiento a la izquierda (`<<`)
   - Desplaza los bits hacia la izquierda, agregando ceros a la derecha. Cada desplazamiento a la izquierda equivale a multiplicar el número por 2.


```python
a = 0b1010  # 10 en decimal

bin(a << 2)  # Resultado: 0b101000 (40 en decimal)
```




    '0b101000'



#### f. Desplazamiento a la derecha (`>>`)
   - Desplaza los bits hacia la derecha, descartando los bits más a la derecha. Cada desplazamiento a la derecha equivale a dividir el número entre 2.


```python
a = 0b1010  # 10 en decimal

bin(a >> 2)  # Resultado: 0b10 (2 en decimal)
```




    '0b10'



#### g. Resumen de ejemplos de operadores de bits

| Operador    | Ejemplo             | Resultado Binario | Resultado Decimal |
|-------------|----------------------|-------------------|-------------------|
| AND (`&`)   | `0b1101 & 0b1011`   | `0b1001`         | 9                 |
| OR (`\|`)    | `0b1101 \| 0b1011`   | `0b1111`         | 15                |
| XOR (`^`)   | `0b1101 ^ 0b1011`   | `0b0110`         | 6                 |
| NOT (`~`)   | `~0b1101`           | `-0b1110`        | -14               |
| Shift Izq. (`<<`) | `0b1010 << 2` | `0b101000`       | 40                |
| Shift Der. (`>>`) | `0b1010 >> 2` | `0b10`           | 2                 |

Estos operadores de bits pueden ser muy útiles para trabajar con máscaras, manipulación de bits y optimización a nivel bajo en Python.

---

### 6. Operadores de asignación (Ultimos en la lista de precedencia)

1. **Asignación Simple (`=`)**: Asigna un valor a una variable.
   ```python
   x = 10
   ```

Los siguientes operadores permiten modificar y asignar valores en un solo paso, simplificando el código.


2. **Asignación Compuesta**:
   - `+=`: Suma y asigna → `x += 3` (equivale a `x = x + 3`)
   - `-=`: Resta y asigna → `y -= 4`
   - `*=`: Multiplica y asigna → `z *= 2`
   - `/=`: Divide y asigna → `a /= 5`
   - `//=`: División entera y asigna → `b //= 3`
   - `%=`: Módulo y asigna → `c %= 5`
   - `**=`: Potencia y asigna → `d **= 3`

3. **Asignación Bit a Bit**:
   - `&=`: AND bit a bit → `e &= 0b1011`
   - `|=`: OR bit a bit → `f |= 0b1011`
   - `^=`: XOR bit a bit → `g ^= 0b1011`
   - `<<=`: Desplazamiento a la izquierda → `h <<= 2`
   - `>>=`: Desplazamiento a la derecha → `i >>= 2`


#### a. Ejemplo sencillo de un contador usando el operador compuesto de suma y asignación (`+=`)


```python
contador = 0

while True:
    contador += 1
    print(f"{contador=}")
    if contador == 5:
        break
```

    contador=1
    contador=2
    contador=3
    contador=4
    contador=5


---

### 7. Clasificación de los operadores según su número de operandos

Los operadores en Python se pueden clasificar en dos categorías principales: **unarios y binarios**. Los operadores unarios requieren un solo operando para realizar una operación, como el operador de negación (-) que cambia el signo de un número. Por otro lado, los operadores binarios operan sobre dos operandos y son utilizados en operaciones como la suma (+), la resta (-), y la multiplicación (*), donde se requiere de ambos valores para producir un resultado.


| **Operador** | **Descripción**                           | **Tipo**  | **Ejemplo**                     |
|--------------|------------------------------------------|-----------|---------------------------------|
| `+`          | Suma                                     | Binario   | `3 + 2` → `5`                   |
| `-`          | Resta                                    | Binario   | `5 - 2` → `3`                   |
| `*`          | Multiplicación                           | Binario   | `4 * 2` → `8`                   |
| `/`          | División                                 | Binario   | `8 / 2` → `4.0`                 |
| `//`         | División entera                          | Binario   | `8 // 3` → `2`                  |
| `%`          | Módulo (resto de la división)           | Binario   | `8 % 3` → `2`                   |
| `**`         | Potencia                                 | Binario   | `2 ** 3` → `8`                  |
| `-`          | Negación                                 | <span style="color:red">Unario</span>    | `-5` → `-5`                     |
| `+`          | Positivo                                 | <span style="color:red">Unario</span>    | `+3` → `3`                      |
| `==`         | Igual a                                  | Binario   | `3 == 3` → `True`               |
| `!=`         | No igual a                               | Binario   | `3 != 4` → `True`               |
| `>`          | Mayor que                                | Binario   | `5 > 3` → `True`                |
| `<`          | Menor que                                | Binario   | `3 < 5` → `True`                |
| `>=`         | Mayor o igual que                        | Binario   | `5 >= 5` → `True`               |
| `<=`         | Menor o igual que                        | Binario   | `3 <= 4` → `True`               |
| `and`        | Conjunción lógica                        | Binario   | `True and False` → `False`      |
| `or`         | Disyunción lógica                        | Binario   | `True or False` → `True`        |
| `not`        | Negación lógica                          | <span style="color:red">Unario</span>    | `not True` → `False`            |
| `is`         | Identidad                                | Binario   | `a is b` (donde `a` y `b` son el mismo objeto) |
| `is not`     | No identidad                             | Binario   | `a is not b` (donde `a` y `b` son diferentes objetos) |
| `in`         | Pertenece a                              | Binario   | `'a' in 'apple'` → `True`       |
| `not in`     | No pertenece a                           | Binario   | `'b' not in 'apple'` → `True`   |
| `<<`         | Desplazamiento a la izquierda            | Binario   | `3 << 1` → `6`                   |
| `>>`         | Desplazamiento a la derecha              | Binario   | `6 >> 1` → `3`                   |
| `&`          | AND bit a bit                            | Binario   | `5 & 3` → `1`                    |
| `\|`          | OR bit a bit                             | Binario   | `5 \| 3` → `7`                    |
| `^`          | XOR bit a bit                            | Binario   | `5 ^ 3` → `6`                    |
| `=`          | Asignación                               | Binario   | `x = 5`                          |
| `+=`         | Asignación y suma                        | Binario   | `x += 2` (equivalente a `x = x + 2`) |
| `-=`         | Asignación y resta                       | Binario   | `x -= 1` (equivalente a `x = x - 1`) |
| `*=`         | Asignación y multiplicación              | Binario   | `x *= 2` (equivalente a `x = x * 2`) |
| `/=`         | Asignación y división                    | Binario   | `x /= 2` (equivalente a `x = x / 2`) |
| `//=`        | Asignación y división entera             | Binario   | `x //= 3` (equivalente a `x = x // 3`) |
| `%=`         | Asignación y módulo                      | Binario   | `x %= 3` (equivalente a `x = x % 3`) |
| `**=`        | Asignación y potencia                    | Binario   | `x **= 2` (equivalente a `x = x ** 2`) |
| `&=`         | Asignación y AND bit a bit              | Binario   | `x &= 3` (equivalente a `x = x & 3`) |
| `\|=`         | Asignación y OR bit a bit               | Binario   | `x \|= 3` (equivalente a `x = x | 3`) |
| `^=`         | Asignación y XOR bit a bit              | Binario   | `x ^= 3` (equivalente a `x = x ^ 3`) |
| `<<=`        | Asignación y desplazamiento a la izquierda | Binario   | `x <<= 1` (equivalente a `x = x << 1`) |
| `>>=`        | Asignación y desplazamiento a la derecha | Binario   | `x >>= 1` (equivalente a `x = x >> 1`) |

#### a. El operador ternario en Python

Python posee también un operador ternario, que es en realidad una forma concisa de escribir una expresión condicional que selecciona entre dos valores basándose en una condición. Se utiliza en la siguiente sintaxis:

```python
resultado = valor_si_verdadero if condicion else valor_si_falso
```

Si la `condicion` se evalúa como `True`, se asigna `valor_si_verdadero` a la variable `resultado`. Si la `condicion` es `False`, se asigna `valor_si_falso`. Este operador es útil para simplificar expresiones condicionales y mejorar la legibilidad del código, ya que permite realizar asignaciones o retornos en una sola línea en lugar de usar una estructura condicional más extensa. Por ejemplo:


```python
x = 10
mensaje = "Es positivo" if x > 0 else "Es negativo o cero"
print(mensaje)
```

    Es positivo


En este caso, si `x` es mayor que 0, `mensaje` será "Es positivo"; de lo contrario, será "Es negativo o cero".

---

### 8. Ejercicios con operadores

Aquí tienes cinco ejercicios para practicar operadores aritméticos y lógicos en Python.

#### a. Suma y promedio
Escribe un programa que solicite al usuario dos números y luego calcule y muestre su suma y su promedio.

**Pistas:**
- Usa el operador de suma (`+`).
- Calcula el promedio dividiendo la suma entre 2.


```python

```

#### b. Verificación de par
Crea un programa que pida al usuario un número entero y determine si es par o impar.

**Pistas:**
- Usa el operador de módulo (`%`) para verificar si el número es divisible entre 2.
- Imprime "El número es par" si el resultado es 0; de lo contrario, imprime "El número es impar".


```python

```

#### c. Comparación de números
Escribe un programa que solicite al usuario tres números y determine cuál es el mayor.

**Pistas:**
- Utiliza operadores de comparación (`>`, `<`) para comparar los números.
- Imprime el número mayor.


```python

```

#### d. Evaluación de condiciones
Crea un programa que pida al usuario su edad y verifique si puede votar (mayor de 18 años) y si es un adolescente (entre 13 y 19 años).

**Pistas:**
- Usa operadores lógicos (`and`, `or`) para evaluar las condiciones.
- Imprime un mensaje que indique si el usuario puede votar y si es un adolescente.


```python

```

#### e. Cálculo de la potencia

Escribe un programa que pida al usuario un número y un exponente, y que calcule la potencia del número elevado al exponente utilizando el operador de potencia (`**`).

**Pistas:**
- Usa el operador de potencia para calcular el resultado.
- Imprime el resultado en un formato claro, por ejemplo: "El resultado de [número] elevado a [exponente] es [resultado]".


```python

```
