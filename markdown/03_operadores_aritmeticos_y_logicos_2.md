# Operadores en Python - Material complementario

### 1. ¿Qué es un operador?

En programación, un **operador** es un *símbolo o palabra reservada* que indica una operación específica a realizar sobre uno o más valores (llamados **operandos**). Los operadores permiten realizar cálculos matemáticos, comparar valores, manipular datos, realizar operaciones lógicas, y más. Python, como muchos otros lenguajes de programación, incluye diversos tipos de operadores para trabajar con distintos tipos de datos y realizar operaciones comunes.

### 2. Clasificación de operadores en Python (y en otros lenguajes)

#### a. **Operadores aritméticos**
   - Realizan operaciones matemáticas básicas, como suma, resta, multiplicación y división.
   - Ejemplos en Python: `+`, `-`, `*`, `/`, `%` (módulo), `**` (potencia), `//` (división entera).

#### b. **Operadores de comparación o relacionales**
   - Comparan dos valores y devuelven un valor booleano (`True` o `False`) indicando si la comparación es verdadera.
   - Ejemplos en Python: `==` (igualdad), `!=` (desigualdad), `<`, `<=`, `>`, `>=`.

#### c. **Operadores lógicos**
   - Permiten construir expresiones lógicas y combinar valores booleanos.
   - Ejemplos en Python: `and`, `or`, `not`.

#### d. **Operadores de asignación**
   - Asignan valores a variables. En Python, el operador de asignación simple es `=`, pero existen operadores compuestos que combinan la asignación con una operación.
   - Ejemplos: `=`, `+=`, `-=`, `*=`, `/=`, etc.

#### e. **Operadores de bits**
   - Operan a nivel de bits entre valores enteros, permitiendo realizar desplazamientos y comparaciones directas de los bits.
   - Ejemplos en Python: `&` (AND bit a bit), `|` (OR bit a bit), `^` (XOR bit a bit), `~` (complemento a nivel de bits), `<<` (desplazamiento a la izquierda), `>>` (desplazamiento a la derecha).

#### f. **Operadores de pertenencia**
   - Verifican si un valor está presente dentro de una colección (listas, cadenas, etc.).
   - Ejemplos en Python: `in`, `not in`.

#### f. **Operadores de identidad**
   - Verifican si dos variables apuntan al mismo objeto en memoria.
   - Ejemplos en Python: `is`, `is not`.

### 3. Ejemplo en Python

En una expresión como:

```python
a = 5
b = 10
c = a + b
```

- El operador de asignación `=` asigna a `a` el valor `5`.
- El operador `+` suma `a` y `b`.
- Otro operador de asignación `=` asigna a `c` el resultado de la suma.

### 4. Importancia de los Operadores
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
