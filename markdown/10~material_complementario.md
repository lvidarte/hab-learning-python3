# Clase 10: Material complementario

### 1. Introducción a la Programación Orientada a Objetos (OOP)

La programación orientada a objetos (OOP) es uno de los paradigmas más importantes y extendidos en el desarrollo de software. Está diseñado para organizar el código en torno a **objetos**, que representan entidades del mundo real o conceptual con las que interactuamos mediante propiedades (**atributos**) y comportamientos (**métodos**).

#### a. Conceptos Clave de la OOP

1. **Clases**: 
   - Son plantillas o moldes para crear objetos. Una clase define los atributos y métodos que tendrán sus objetos.
   - Ejemplo: Una clase `Auto` puede tener atributos como `marca` y `color` y métodos como `acelerar` o `frenar`.

2. **Objetos**: 
   - Son instancias de una clase. Cada objeto tiene sus propios datos, pero todos comparten la estructura definida en la clase.
   - Ejemplo: Un objeto de la clase `Auto` sería un auto específico, como un "Ford rojo".

3. **Encapsulamiento**: 
   - Es la capacidad de ocultar detalles internos de un objeto y exponer solo lo necesario. Esto mejora la seguridad y la modularidad del código.
   - Ejemplo: El método `frenar` de un auto no necesita exponer cómo funcionan los frenos internamente.

4. **Herencia**: 
   - Permite que una clase (subclase) reutilice y extienda las funcionalidades de otra clase (superclase).
   - Ejemplo: Una clase `Camioneta` puede heredar de la clase `Auto`, pero agregar un atributo `carga_maxima`.

5. **Polimorfismo**: 
   - Permite usar un mismo método o atributo en diferentes clases, adaptando su comportamiento según la clase específica.
   - Ejemplo: Un método `acelerar` podría funcionar de manera distinta en un auto eléctrico y en uno a combustión.

6. **Abstracción**: 
   - Es el proceso de simplificar sistemas complejos al centrarse solo en los detalles relevantes para el contexto.
   - Ejemplo: Un cliente de una tienda no necesita saber cómo se gestiona internamente el inventario, solo interactúa con la interfaz de compra.

#### b. ¿Es el paradigma más usado?

La **OOP es uno de los paradigmas más usados**, pero no necesariamente el único ni siempre el más adecuado. Su popularidad se debe a varias razones:

1. **Facilidad para modelar problemas del mundo real**: Las clases y objetos son intuitivos para representar entidades reales.
2. **Mantenibilidad**: Gracias a conceptos como la encapsulación y la modularidad, el código es más fácil de mantener y escalar.
3. **Soporte generalizado**: Lenguajes como Python, Java, C++, y C# están diseñados para trabajar con OOP.

Sin embargo, no es el único paradigma, y en algunos contextos, otros enfoques pueden ser más efectivos:

- **Programación funcional**: Se enfoca en funciones puras y el manejo de datos inmutables (usada en lenguajes como Haskell o Scala).
- **Programación imperativa**: Se basa en instrucciones secuenciales para manipular el estado del programa.
- **Programación declarativa**: Describe qué hacer, no cómo hacerlo (como SQL para bases de datos).


#### c. Ventajas de la OOP

- Modularidad: Divide el programa en partes independientes.
- Reutilización: Las clases y métodos pueden reutilizarse en diferentes partes del código.
- Facilidad para pruebas: Los objetos encapsulan el comportamiento, lo que simplifica las pruebas.

---

### 2. Clases en Python

#### a. La clase más simple en Python

La clase más básica no necesita hacer nada. Usamos la palabra clave `class` y el cuerpo puede estar vacío usando `pass`:


```python
class Persona:
    pass
```

En este punto, `Persona` es solo un contenedor vacío. Podemos crear una instancia (objeto) de esta clase:


```python
persona1 = Persona()
print(persona1)
```

    <__main__.Persona object at 0x10cd0bbc0>


Aunque el objeto existe, no tiene atributos ni métodos.

#### b. Agregando atributos "al vuelo"

En Python, podemos agregar atributos a un objeto **después** de crearlo. Esto no es ideal para casos complejos, pero es útil para comprender cómo funcionan los objetos.


```python
persona1.nombre = "José"
persona1.edad = 30

print(persona1.nombre)  # José
print(persona1.edad)    # 30
```

    José
    30


Aquí hemos agregado los atributos `nombre` y `edad` **dinámicamente**.

#### c. Haciéndolo más estructurado con `__init__`

Para no tener que agregar atributos al vuelo cada vez, usamos el método especial `__init__`. Este método se llama automáticamente cuando se crea un objeto y permite inicializar atributos.


```python
class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad
```

Ahora creamos objetos con valores iniciales:


```python
persona2 = Persona("Ana", 25)
print(persona2.nombre)  # Ana
print(persona2.edad)    # 25
```

    Ana
    25


#### d. Agregando métodos

Podemos incluir **métodos**, que son funciones dentro de la clase. Por ejemplo:


```python
class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def saludar(self):
        return f"Hola, soy {self.nombre} y tengo {self.edad} años."
```

Usando el método:


```python
persona3 = Persona("Carlos", 40)
print(persona3.saludar())
```

    Hola, soy Carlos y tengo 40 años.


---

### 3. Propiedades privadas en Python

En programación orientada a objetos, las **propiedades privadas** son atributos o métodos de una clase que están diseñados para ser inaccesibles desde fuera de la misma. Esto se utiliza para garantizar el **encapsulamiento**, es decir, proteger los datos internos de la manipulación directa.  

En lenguajes como Java o C++, esto se implementa mediante modificadores de acceso como `private`, que impiden que un atributo o método sea accesible fuera de su clase. 

Sin embargo, en **Python no existe un sistema de propiedades realmente privadas**. En lugar de imponer restricciones estrictas, Python sigue una filosofía conocida como **"We are all consenting adults here"** (somos todos adultos responsables). Esto significa que el lenguaje confía en los desarrolladores para respetar las convenciones y no acceder a datos que están marcados como "privados".

#### a. Convenciones para "propiedades privadas" en Python

Python utiliza convenciones de nombres para señalar la intención de privacidad, aunque no impide técnicamente el acceso:

1. **Un guion bajo (`_atributo`)**:
   - Por convención, se utiliza un solo guion bajo al inicio de un nombre para indicar que un atributo o método es "interno" y no debería ser accedido desde fuera de la clase.
   - **No es realmente privado**: Este atributo sigue siendo accesible, pero su uso externo se desaconseja.


```python
class Ejemplo:
    def __init__(self):
        self._dato_privado = 42  # Convención de atributo privado
```

2. **Doble guion bajo (`__atributo`)**:
   - Python aplica un proceso llamado **name mangling** (enmarañamiento de nombres) a los atributos que comienzan con dos guiones bajos. Esto cambia el nombre del atributo internamente para hacerlo más difícil de acceder desde fuera de la clase.
   - **No es realmente privado**: Aunque más difícil de acceder, el atributo sigue estando disponible si conoces el nombre interno modificado (`_NombreClase__atributo`).


```python
class Ejemplo:
    def __init__(self):
        self.__dato_privado = 42


obj = Ejemplo()
# print(obj.__dato_privado)  # Esto genera un AttributeError
print(obj._Ejemplo__dato_privado)  # Acceso indirecto al atributo
```

    42


#### b. ¿Por qué nada es realmente privado en Python?

1. **Filosofía de Python**:
   - Python fomenta la transparencia y la confianza en el código. En lugar de imponer restricciones, el lenguaje incentiva prácticas responsables mediante convenciones.

2. **Acceso completo al objeto**:
   - Mediante herramientas como `dir()` o reflección (reflection), puedes obtener una lista de todos los atributos y métodos de un objeto, incluyendo los que usan `__`.

3. **Control de acceso no estrictamente necesario**:
   - La encapsulación en Python se basa más en la intención que en restricciones técnicas. Si realmente necesitas privacidad estricta, se considera que quizás estás usando el enfoque equivocado para resolver tu problema.

#### c. ¿Por qué usar propiedades "privadas"?

Aunque no hay privacidad real, usar convenciones como `_atributo` o `__atributo` es útil porque:

1. **Previenen conflictos de nombres**:
   - Especialmente en clases heredadas, el enmarañamiento de nombres ayuda a evitar que una subclase accidentalmente sobrescriba atributos o métodos de una superclase.

2. **Comunican intención**:
   - Al marcar un atributo como privado, indicas claramente que otros desarrolladores no deberían usarlo directamente.

3. **Permiten mayor control**:
   - Puedes usar propiedades (`@property`) para acceder o modificar atributos internos de manera controlada.

---

### 4. Introducción a los *Dunder Methods*

Los *dunder methods* (abreviación de **double underscore methods**) son métodos especiales en Python que tienen dos guiones bajos al inicio y al final de su nombre, como `__init__`, `__str__` y `__repr__`. Estos métodos permiten personalizar el comportamiento de las clases en operaciones específicas, como crear objetos, representarlos como cadenas, realizar cálculos, entre otros.

Por ejemplo:
- `__init__`: Se ejecuta al crear una nueva instancia (constructor).
- `__str__` y `__repr__`: Se utilizan para definir cómo debe representarse el objeto como texto.

Los *dunder methods* hacen que tus clases sean más intuitivas y que se integren mejor con el lenguaje Python.

#### a. Método `__repr__`

- Propósito: Representación oficial del objeto.
- Se utiliza principalmente para los desarrolladores y debe ser lo más informativa y detallada posible.
- Generalmente, su salida debería ser algo que, idealmente, permita reconstruir el objeto.

Python lo utiliza cuando:
- Llamas a `repr(objeto)` directamente.
- Inspeccionas el objeto en la terminal o en un depurador.
- El `__str__` no está definido, pero `__repr__` sí.



```python
class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def __repr__(self):
        return f"Persona(nombre='{self.nombre}', edad={self.edad})"


Persona("Jairo", 30)
```




    Persona(nombre='Jairo', edad=30)



#### b. Método `__str__`

- Propósito: Representación informal o amigable para el usuario final.
- Es ideal para mostrar datos importantes del objeto de una forma clara y sencilla.

Python lo utiliza cuando:
- Llamas a `print(objeto)` o a `str(objeto)`.
- Necesitas una representación legible para el usuario.


```python
class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def __str__(self):
        return f"{self.nombre}, {self.edad} años"


p = Persona("Jairo", 30)
print(p)
```

    Jairo, 30 años


#### c. Diferencias entre `__repr__` y `__str__`

| Aspecto            | `__repr__`                             | `__str__`                      |
|---------------------|----------------------------------------|---------------------------------|
| **Propósito**       | Representación oficial (desarrollador) | Representación informal (usuario) |
| **Usos comunes**    | Debugging, logs                       | Mensajes al usuario final       |
| **Fallback**        | Si no hay `__str__`, usa `__repr__`   | Si no hay `__repr__`, NO usa `__str__` |

#### d. Ejemplo combinando ambos


```python
class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def __repr__(self):
        return f"Persona(nombre='{self.nombre}', edad={self.edad})"

    def __str__(self):
        return f"{self.nombre} tiene {self.edad} años."


p = Persona("Jairo", 30)

print(repr(p))
print(str(p))
```

    Persona(nombre='Jairo', edad=30)
    Jairo tiene 30 años.


---

### 5. Docstrings en clases

Aquí un ejemplo completo de uso correcto de docstrings en clases.


```python
from typing import Union


class Calculadora:
    """
    Una clase para realizar operaciones matemáticas básicas.

    Esta clase proporciona métodos para sumar, restar, multiplicar 
    y dividir dos números. Incluye validación básica para evitar errores, 
    como la división por cero.

    Atributos:
        ultima_operacion (Union[str, None]): Guarda el tipo de la última operación realizada.
    """

    def __init__(self) -> None:
        """
        Inicializa una nueva instancia de la clase Calculadora.
        """
        self.ultima_operacion: Union[str, None] = None

    def sumar(self, a: Union[int, float], b: Union[int, float]) -> Union[int, float]:
        """
        Retorna la suma de `a` y `b`.

        Args:
            a (Union[int, float]): El primer número.
            b (Union[int, float]): El segundo número.

        Returns:
            Union[int, float]: La suma de `a` y `b`.
        """
        self.ultima_operacion = "suma"
        return a + b

    def restar(self, a: Union[int, float], b: Union[int, float]) -> Union[int, float]:
        """
        Retorna la resta de `a` y `b`.

        Args:
            a (Union[int, float]): El minuendo.
            b (Union[int, float]): El sustraendo.

        Returns:
            Union[int, float]: La diferencia entre `a` y `b`.
        """
        self.ultima_operacion = "resta"
        return a - b

    def multiplicar(self, a: Union[int, float], b: Union[int, float]) -> Union[int, float]:
        """
        Retorna el producto de `a` y `b`.

        Args:
            a (Union[int, float]): El primer número.
            b (Union[int, float]): El segundo número.

        Returns:
            Union[int, float]: El producto de `a` y `b`.
        """
        self.ultima_operacion = "multiplicación"
        return a * b

    def dividir(self, a: Union[int, float], b: Union[int, float]) -> float:
        """
        Retorna la división de `a` entre `b`.

        Args:
            a (Union[int, float]): El dividendo.
            b (Union[int, float]): El divisor.

        Returns:
            float: El cociente de `a` dividido por `b`.

        Raises:
            ValueError: Si `b` es igual a cero.
        """
        if b == 0:
            raise ValueError("El divisor no puede ser cero.")
        self.ultima_operacion = "división"
        return a / b

```

---

### 6. Introducción a Setters y Getters en Python

En muchos lenguajes de programación, los **setters** y **getters** son métodos que se utilizan para controlar el acceso a los atributos de una clase. Por ejemplo, los métodos `get_` y `set_` permiten leer o modificar valores de forma controlada, protegiendo los datos de manipulaciones indebidas. 

En Python, aunque se pueden implementar métodos `get_` y `set_` manualmente, la filosofía de diseño del lenguaje favorece el uso de **propiedades** con el decorador `@property`. Esto permite definir métodos que parecen atributos al ser llamados, promoviendo un estilo de programación más limpio y más "Pythonic" (es decir, idiomático en Python).


#### a. Ejemplo Clásico con `get_` y `set_`



```python
class Persona:
    def __init__(self, nombre):
        self._nombre = nombre  # Atributo privado

    def get_nombre(self):
        return self._nombre

    def set_nombre(self, valor):
        if not valor:
            raise ValueError("El nombre no puede estar vacío")
        self._nombre = valor
```


```python
persona = Persona("Elo")
print(persona.get_nombre())
persona.set_nombre("Ana")
print(persona.get_nombre())
```

    Elo
    Ana



Aunque este enfoque funciona, es **verboso** y no se siente natural para quienes están acostumbrados al estilo simple de Python.

#### b. La forma pythonic: `@property`

Python introduce la función integrada `property` (o su forma decorativa `@property`) para reemplazar los métodos `get_` y `set_`. Esto permite definir comportamiento controlado al acceder o modificar atributos, sin cambiar la forma en que el atributo se usa.

#### c. Ejemplo con `@property`


```python
class Persona:
    def __init__(self, nombre: str):
        self._nombre = nombre  # Atributo privado

    @property
    def nombre(self) -> str:
        """Getter para el nombre."""
        return self._nombre

    @nombre.setter
    def nombre(self, valor: str) -> None:
        """Setter para el nombre."""
        if not valor:
            raise ValueError("El nombre no puede estar vacío")
        self._nombre = valor
```


```python
persona = Persona("Elo")
print(persona.nombre)
persona.nombre = "Ana"  # Se llama al setter automáticamente
print(persona.nombre)
```

    Elo
    Ana


#### d. Ventajas de Usar `@property`

1. **Simplicidad y claridad**:
   - Con `@property`, el acceso a los atributos parece directo, como si fueran públicos, aunque están controlados internamente.
   
2. **Compatibilidad con código existente**:
   - Si decides agregar lógica al acceso de un atributo después de que ya se usa como público, puedes convertirlo en una propiedad sin romper el código existente.

3. **Estilo Pythonic**:
   - La comunidad Python valora la legibilidad y simplicidad del código. La convención de no usar métodos `get_` y `set_` refuerza esta filosofía.

4. **Encapsulación sin complicaciones**:
   - Aunque se accede a los atributos como si fueran públicos, el uso de propiedades garantiza que puedes aplicar validaciones u otra lógica si es necesario.

#### e. Cuándo Usar `@property`

1. **Validación**:
   Si necesitas validar o procesar datos antes de asignarlos.
2. **Cálculos derivados**:
   Para atributos cuyo valor depende de otros.
3. **Mantener consistencia**:
   Garantizar que los atributos tengan valores válidos sin exponerlos directamente.

#### f. Contraste con Otros Lenguajes

En lenguajes como Java o C++, los métodos `get_` y `set_` son comunes porque la sintaxis de esos lenguajes no soporta directamente el concepto de propiedades. En Python, la flexibilidad del decorador `@property` permite ocultar esta lógica detrás de una interfaz más simple y limpia.

---

### 6. Ejercicios con clases

#### a. Crea una clase Cuenta que permita depositar y retirar dinero.


```python
class Cuenta:
    def __init__(self, saldo: float) -> None:
        self.saldo = saldo
      
    def depositar(self, monto: float) -> None:
        self.saldo += monto

    def retirar(self, monto: float) -> None:
        if self.saldo < monto:
            raise ValueError("Saldo insuficiente")
        self.saldo -= monto

    def __str__(self) -> str:
        return f"Cuenta(saldo={self.saldo})"


cuenta = Cuenta(10000)
cuenta.depositar(5000)
cuenta.retirar(2000)
print(cuenta)
```

    Cuenta(saldo=13000)


#### b. Implementa una clase Producto que lleve la cuenta de cuántas instancias se han creado.


```python
class Producto:
  contador: int = 0

  def __init__(self, nombre: str, precio: float) -> None:
    self.nombre = nombre
    self.precio = precio
    Producto.contador += 1


for i in range(10):
  p = Producto(f"Producto {i}", 1000)
  print(p.nombre)

print('Total instancias', Producto.contador)
```

    Producto 0
    Producto 1
    Producto 2
    Producto 3
    Producto 4
    Producto 5
    Producto 6
    Producto 7
    Producto 8
    Producto 9
    Total instancias 10


#### c. Crea una clase Persona que valide que la edad sea mayor que cero.


```python
class Persona:
  def __init__(self, nombre: str, edad: int) -> None:
    self.nombre = nombre
    self.edad = edad

  @property
  def nombre(self) -> str:
    return self._nombre
  
  @nombre.setter
  def nombre(self, valor: str) -> None:
    if valor == '':
        raise ValueError("El nombre no puede ser una cadena vacía.")
    self._nombre = valor

  @property
  def edad(self) -> int:
    return self._edad

  @edad.setter
  def edad(self, valor: int) -> None:
    if valor <= 0:
      raise ValueError("La edad debe ser mayor que cero.")
    self._edad = valor


persona = Persona("juan", 30)
print(persona.nombre, persona.edad)
```

    juan 30


#### d. Implementa el método `__str__` para mostrar información amigable de un objeto Persona.


```python
class Persona:
  def __init__(self, nombre: str, edad: int) -> None:
    self.nombre = nombre
    self.edad = edad

  @property
  def nombre(self) -> str:
    return self._nombre
  
  @nombre.setter
  def nombre(self, valor: str) -> None:
    if valor == '':
        raise ValueError("El nombre no puede ser una cadena vacía.")
    self._nombre = valor

  @property
  def edad(self) -> int:
    return self._edad

  @edad.setter
  def edad(self, valor: int) -> None:
    if valor <= 0:
      raise ValueError("La edad debe ser mayor que cero.")
    self._edad = valor

  def __str__(self) -> str:
    return f"Persona(nombre={self.nombre}, edad={self.edad})"


persona = Persona("juan", 30)
print(persona)
```

    Persona(nombre=juan, edad=30)


#### e. Implementa una clase Dado que permita tirar un dado de n caras. Luego maneja una serie de 3 dados usando una lista y genera los valores de cada dado iterando la lista.


```python
import random


class Dado:
  def __init__(self, caras: int) -> None:
    self.caras = caras

  def tirar(self) -> int:
    return random.randint(1, self.caras)

  def __str__(self) -> str:
    return f"Dado({self.caras})"


dados = [Dado(6), Dado(7), Dado(15)]

for dado in dados:
  print(dado, dado.tirar())
```

    Dado(6) 4
    Dado(7) 5
    Dado(15) 5


#### f. Crea una clase Estudiante que almacene el nombre y las calificaciones de un estudiante. Luego, crea una lista de objetos Estudiante y calcula el promedio de calificaciones de todos los estudiantes.


```python
class Estudiante:
  def __init__(self, nombre: str, calificaciones: list[float]) -> None:
    self.nombre = nombre
    self.calificaciones = calificaciones

  def promedio(self) -> float:
        return sum(self.calificaciones) / len(self.calificaciones)


estudiantes = [
    Estudiante("Ana", [7.5, 8.0, 9.0]),
    Estudiante("Luis", [6.0, 7.5, 8.5]),
    Estudiante("Clara", [9.5, 9.0, 8.0]),
]

promedio_general = sum(est.promedio() for est in estudiantes) / len(estudiantes)
print(f"Promedio general: {promedio_general:.2f}")
```

    Promedio general: 8.11


#### g. Crea una clase Libro con atributos como título y autor, y una clase Biblioteca que gestione una lista de libros. Agrega métodos para añadir libros, eliminar libros por título y obtener todos los libros.


```python
class Libro:
  def __init__(self, titulo: str, autor: str) -> None:
    self.titulo = titulo
    self.autor = autor

  def __str__(self) -> str:
    return f"Libro({self.titulo}, {self.autor})"


class Biblioteca:
  def __init__(self) -> None:
    self._libros = []

  def agregar_libro(self, libro: Libro) -> None:
    if isinstance(libro, Libro):
      self._libros.append(libro)

  @property
  def libros(self) -> list[Libro]:
    return self._libros

  def eliminar_libro(self, libro: Libro) -> bool:
    for libro_ in self._libros:
      if libro_ == libro:
        self._libros.remove(libro)
        return True
    return False


biblioteca = Biblioteca()
biblioteca.agregar_libro(Libro("El principito", "Antoine de Saint-Exupéry"))
biblioteca.agregar_libro(Libro("Don Quijote de la Mancha", "Miguel de Cervantes"))
biblioteca.agregar_libro(Libro("1984", "George Orwell"))

for libro in biblioteca.libros:
  print(libro)
```

    Libro(El principito, Antoine de Saint-Exupéry)
    Libro(Don Quijote de la Mancha, Miguel de Cervantes)
    Libro(1984, George Orwell)


#### h. Crea una clase Curso que gestione una lista de estudiantes y permita calcular el promedio del curso. Utiliza la clase Estudiante del ejercicio f.


```python
class Curso:
    def __init__(self, nombre: str):
        self.nombre = nombre
        self._estudiantes = []

    def agregar_estudiante(self, estudiante: Estudiante) -> None:
        self._estudiantes.append(estudiante)

    def promedio_curso(self) -> float:
        return sum(est.promedio() for est in self._estudiantes) / len(self._estudiantes)


curso = Curso("Matemáticas")
curso.agregar_estudiante(Estudiante("Pedro", [7, 8, 9]))
curso.agregar_estudiante(Estudiante("María", [6, 6, 7]))
print(f"Promedio del curso: {curso.promedio_curso():.2f}")
```

    Promedio del curso: 7.17


#### i. Crea una clase Auto y una clase Concesionaria para gestionar autos.


```python
class Auto:
    def __init__(self, marca: str, modelo: str, precio: float):
        self.marca = marca
        self.modelo = modelo
        self.precio = precio

    def __str__(self) -> str:
        return f"{self.marca} {self.modelo} - ${self.precio:.2f}"


class Concesionaria:
    def __init__(self):
        self._autos = []

    def agregar_auto(self, auto: Auto) -> None:
        self._autos.append(auto)

    def autos(self) -> list:
        return self._autos


concesionaria = Concesionaria()
concesionaria.agregar_auto(Auto("Toyota", "Corolla", 20000))
concesionaria.agregar_auto(Auto("Ford", "Focus", 18000))

for auto in concesionaria.autos():
    print(auto)
```

    Toyota Corolla - $20000.00
    Ford Focus - $18000.00


#### j. Carrito de Compras

Crea las siguientes clases:

- Clase Producto:
Representa un producto con nombre, precio y cantidad.

- Clase Carrito:
Representa el carrito de compras. Tendrá métodos para:

  - Agregar productos al carrito.
  - Eliminar productos por nombre.
  - Calcular el total del carrito.


```python
class Producto:

    def __init__(self, nombre: str, precio_unitario: float, cantidad: int) -> None:
        self._nombre = nombre
        self._precio_unitario = precio_unitario
        self._cantidad = cantidad

    def subtotal(self):
        return self._precio_unitario * self._cantidad

    def __str__(self):
        return f"Producto(nombre={self._nombre}, subtotal=${self.subtotal()})"


class Carrito:

    def __init__(self):
        self._productos = []

    def agregar_producto(self, producto: Producto) -> None:
        self._productos.append(producto)

    def eliminar_producto(self, producto: Producto) -> bool:
        for producto_ in self._productos:
            if producto_ == producto:
                self._productos.remove(producto)
                return True
        return False

    def total(self) -> float:
        return sum(producto.subtotal() for producto in self._productos)


productos = [
    Producto("Manzanas", 1, 4),
    Producto("Bebida", 10, 2),
]

carrito = Carrito()

for producto in productos:
    carrito.agregar_producto(producto)

print(f'Total carrito: ${carrito.total()}')

if carrito.eliminar_producto(productos[1]):
    print(f"Producto eliminado: {productos[1]}")
else:
    print("No se encontró el producto")

print(f'Total carrito: ${carrito.total()}')
```

    Total carrito: $24
    Producto eliminado: Producto(nombre=Bebida, subtotal=$20)
    Total carrito: $4


---

### 7. Ejercicios con ColabTurtlePlus

[ColabTurtlePlus](https://larryriddle.agnesscott.org/ColabTurtlePlus/documentation2.html) es una biblioteca que permite usar una tortuga gráfica (similar a la que se utiliza en el entorno de **Logo**) para dibujar en Google Colab. Es una herramienta visual y divertida para enseñar conceptos de programación. 

Con `ColabTurtlePlus`, puedes crear y controlar múltiples tortugas, lo que significa que puedes tener varias tortugas en la misma pantalla, cada una realizando tareas independientes como dibujar diferentes formas o patrones.

#### a. Instalación con `pip`


```python
!pip install ColabTurtlePlus
```

#### b. Uso básico

- Se crea una tortuga con `Turtle()`.
- Puedes usar métodos como `forward()`, `right()`, y `left()` para moverla y dibujar.


```python
from ColabTurtlePlus.Turtle import Turtle, clearscreen, setup, speed, hideturtle


clearscreen()
setup(800, 500)
speed(11)

# Crear tortugas
tortuga1 = Turtle()
tortuga2 = Turtle()

# Mover tortuga1
tortuga1.forward(100)
tortuga1.right(90)

# Mover tortuga2
tortuga2.left(45)
tortuga2.forward(50)
```

#### c. Ejemplo usando clases


```python
from random import randint, choice


clearscreen()
setup(800, 500)
hideturtle() # Tortuga por defecto
speed(11)

colors = ['red', 'green', 'blue', 'yellow', 'purple', 'cyan']


class Tortuga:
    def __init__(self, x, y):
        self.tortuga = Turtle()
        self.tortuga.jumpto(x, y)

    def poligono_al_azar(self, largo: int) -> None:
        lados = randint(3, 11)
        print(f"Dibujando polígono de {lados} lados")
        self.tortuga.fillcolor(choice(colors))
        self.tortuga.begin_fill()
        for _ in range(lados):
            self.tortuga.forward(largo)
            self.tortuga.right(360/lados)
        self.tortuga.end_fill()


tortugas = []
for _ in range(10):
    tortugas.append(Tortuga(randint(-300, 300), randint(-200, 200)))

for t in tortugas:
    t.poligono_al_azar(random.randint(10, 100))
```
