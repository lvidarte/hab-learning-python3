# Clase 11: Material complementario

### 1. Niveles de acceso en Python

En Python, no existen niveles de acceso formales como en otros lenguajes orientados a objetos (por ejemplo, `private`, `protected`, `public`). Sin embargo, se puede manejar la visibilidad de los atributos y métodos usando convenciones de nombres:

#### a. Público (Public)
   - Todos los atributos y métodos que **no tienen un prefijo especial** son públicos.
   - Se pueden acceder y modificar desde cualquier lugar.


```python
class MiClase:
    def __init__(self):
        self.atributo_publico = "Soy accesible"
       
    def metodo_publico(self):
        return "Método público"

obj = MiClase()
print(obj.atributo_publico)  # Funciona
```

    Soy accesible


#### b. Protegido (Protected)
   - Los atributos y métodos **con un guion bajo `_` al principio** se consideran protegidos **por convención**.
   - Esto significa que **no deberían ser accedidos directamente desde fuera de la clase, pero es aceptable que las subclases los utilicen.


```python
class MiClase:
    def __init__(self):
        self._atributo_protegido = "Atributo protegido: no deberías accederlo por fuera de la clase."
       
    def _metodo_protegido(self):
        return "Método protegido: no deberías accederlo por fuera de la clase."

obj = MiClase()
print(obj._atributo_protegido)  # Aunque no es recomendado, es accesible
print(obj._metodo_protegido())  # Misma situación aquí
```

    Atributo protegido: no deberías accederlo por fuera de la clase.
    Método protegido: no deberías accederlo por fuera de la clase.


#### c. Privado (Private)
   - Los atributos y métodos **con dos guiones bajos `__` al principio** se consideran privados y **no deberían ser accedidos por fuera de la clase ni tampoco por subclases**.
   - Python utiliza un mecanismo llamado **name mangling** para renombrar estos atributos y evitar el acceso directo desde fuera de la clase.
   - Sin embargo, siguen siendo accesibles de forma indirecta.


```python
class MiClase:
    def __init__(self):
        self.__atributo_privado = "Acceso restringido"
       
    def __metodo_privado(self):
        return "Método privado"
       
    def acceso_indirecto(self):
        return self.__atributo_privado

obj = MiClase()
# print(obj.__atributo_privado)  # Error
print(obj.acceso_indirecto())   # Funciona
print(obj._MiClase__atributo_privado)  # Técnicamente posible por name mangling
```

#### d. Uso de métodos y atributos protegidos en la clase hija

Auí se muestra cómo las subclases pueden usar atributos y métodos protegidos de manera apropiada mientras siguen las convenciones de Python.


```python
class Empleado:
    def __init__(self, nombre: str, salario: float) -> None:
        self.nombre = nombre      # Atributo público
        self.__salario = salario  # Atributo privado

    def salario(self) -> float:
        return self.__salario
   
    def salario_total(self) -> float:
        return self.__salario + self._bono()

    def _bono(self, porcentaje=0.1):  # Método protegido
        return self.__salario * porcentaje

    def __str__(self):
        return f"Empleado(nombre={self.nombre}, salario={self.__salario})"


class Gerente(Empleado):
    def __init__(self, nombre: str, salario: float, equipo: list[Empleado]) -> None:
        super().__init__(nombre, salario)
        self.equipo = equipo  # Lista de empleados a cargo

    def salario_total(self) -> float:
        return self.salario() + self._bono(0.2) # Uso del método público y el protegido

    def __str__(self):
        return f"Gerente(nombre={self.nombre}, salario={self.salario()}, empleados_a_cargo={len(self.equipo)})"

```


```python
equipo = [
    Empleado("Juan", 5000),
    Empleado("Carlos", 4500),
    Empleado("Ana", 5500),
]

for empleado in equipo:
    print(empleado)
```

    Empleado(nombre=Juan, salario=5000)
    Empleado(nombre=Carlos, salario=4500)
    Empleado(nombre=Ana, salario=5500)



```python
gerente = Gerente("María", 7000, equipo)
print(gerente)
```

    Gerente(nombre=María, salario=7000, empleados_a_cargo=3)



```python
empleados = equipo + [gerente]

print("| Empleado | Salario Base | Salario Total |")
print("|----------|--------------|---------------|")
for empleado in empleados:
    print(f"| {empleado.nombre:<8} | ${empleado.salario():11,.2f} | ${empleado.salario_total():12,.2f} |")
```

    | Empleado | Salario Base | Salario Total |
    |----------|--------------|---------------|
    | Juan     | $   5,000.00 | $    5,500.00 |
    | Carlos   | $   4,500.00 | $    4,950.00 |
    | Ana      | $   5,500.00 | $    6,050.00 |
    | María    | $   7,000.00 | $    8,400.00 |


#### e. Resumen rápido:

| **Nivel de acceso** | **Convención**        | **Accesibilidad**                                       |
|----------------------|-----------------------|---------------------------------------------------------|
| **Público**          | Sin prefijo          | Totalmente accesible desde cualquier lugar             |
| **Protegido**        | `_nombre`            | Accesible, pero desaconsejado fuera de la clase o subclase|
| **Privado**          | `__nombre`           | Accesible indirectamente, pero desaconsejado fuera de la clase|

Esto es una **convención** y no una restricción estricta. En Python se confía en la responsabilidad del programador.

---

### 3. Polimorfismo en Python

Python implementa el polimorfismo de forma natural debido a su naturaleza **dinámica** y basada en **duck typing** (si un objeto "actúa" como un pato, se le trata como un pato).

#### a. Tipos de polimorfismo en Python

1. **Polimorfismo de métodos (sobrescritura):**
   - Las clases hijas pueden sobrescribir métodos de la clase padre para proporcionar un comportamiento específico.
   
2. **Polimorfismo con funciones y objetos:**
   - Un mismo método o función puede trabajar con diferentes tipos de objetos, siempre que tengan la interfaz adecuada.

3. **Polimorfismo basado en duck typing:**
   - En Python, no importa el tipo exacto de un objeto, sino si tiene los métodos o atributos necesarios.

#### b. Polimorfismo con herencia


```python
class Animal:
    def hacer_sonido(self):
        raise NotImplementedError("Este método debe ser implementado por una subclase")

class Perro(Animal):
    def hacer_sonido(self):
        return "Guau"

class Gato(Animal):
    def hacer_sonido(self):
        return "Miau"

# Uso polimórfico
animales = [Perro(), Gato()]

for animal in animales:
    print(animal.hacer_sonido())  # Salida: "Guau" y "Miau"
```

    Guau
    Miau


Aquí, el método `hacer_sonido` se comporta de manera distinta dependiendo de si el objeto es un **Perro** o un **Gato**.

#### c. Duck typing


```python
class Perro:
    def hacer_sonido(self):
        return "Guau"

class Auto:
    def hacer_sonido(self):
        return "Bip bip"

# Polimorfismo basado en la interfaz
objetos = [Perro(), Auto()]

for objeto in objetos:
    print(objeto.hacer_sonido())  # Salida: "Guau" y "Bip bip"
```

    Guau
    Bip bip


En este ejemplo, ambos objetos tienen el método `hacer_sonido`, por lo que se tratan de la misma manera, **independientemente de sus tipos**.

#### d. Ventajas del polimorfismo

1. **Flexibilidad:** El código se adapta fácilmente a nuevos tipos de datos.
2. **Reusabilidad:** Permite escribir funciones y métodos genéricos.
3. **Extensibilidad:** Es fácil agregar nuevas clases sin modificar el código existente.

---

### 3. Sobrecarga de métodos en Python

La **sobrecarga de métodos** es un tipo de polimorfismo, y se refiere a la capacidad de definir múltiples métodos con el mismo nombre en una clase, pero con diferentes **firmas de método** (es decir, diferente número o tipo de argumentos).

- **En Python:** Esto **no existe** como tal. Si defines dos métodos con el mismo nombre en una clase, el último sobrescribe al anterior, ya que Python no usa las firmas de método para diferenciarlos.

#### a. Ejemplo de comportamiento en Python


```python
class Ejemplo:
    def metodo(self, x):
        print(f"Un argumento: {x}")

    # Sobreescribe al método anterior
    def metodo(self, x, y):
        print(f"Dos argumentos: {x}, {y}")

obj = Ejemplo()
obj.metodo(1)  # Error: falta un argumento
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    Cell In[47], line 10
          7         print(f"Dos argumentos: {x}, {y}")
          9 obj = Ejemplo()
    ---> 10 obj.metodo(1)  # Error: falta un argumento


    TypeError: Ejemplo.metodo() missing 1 required positional argument: 'y'


El método con dos argumentos sobrescribe al método con uno, y el anterior queda inaccesible.

#### b. Sustitución de métodos (Sobrescritura)

Esto **sí está permitido** en Python y es la manera común de implementar polimorfismo a través de la herencia.

- Una subclase puede sobrescribir un método de la clase padre para proporcionar un comportamiento específico.


```python
class Padre:
    def saludar(self):
        return "Hola desde la clase Padre"

class Hijo(Padre):
    def saludar(self):
        return "Hola desde la clase Hijo"

objeto = Hijo()
print(objeto.saludar())  # Salida: "Hola desde la clase Hijo"
```

    Hola desde la clase Hijo


Aquí, el método `saludar` en la subclase **Hijo** sobrescribe el de la clase **Padre**, y el objeto usa la implementación más específica.

#### c. Simulación de sobrecarga en usando argumentos opcionales

Aunque no hay sobrecarga de métodos de manera nativa, puedes simularla usando:

- Los **Argumentos opcionales (`*args` y `**kwargs`):** permiten manejar diferentes números de argumentos en un mismo método.


```python
class Ejemplo:
    def metodo(self, *args):
        if len(args) == 1:
            print(f"Un argumento: {args[0]}")
        elif len(args) == 2:
            print(f"Dos argumentos: {args[0]}, {args[1]}")

obj = Ejemplo()
obj.metodo(1)       # Un argumento: 1
obj.metodo(1, 2)    # Dos argumentos: 1, 2
```

    Un argumento: 1
    Dos argumentos: 1, 2


#### d. Sobrecarga funcional (usando `@singledispatch`)

Python permite sobrecargar funciones basadas en el tipo de argumento con el decorador `@singledispatch`.


```python
from functools import singledispatch

@singledispatch
def procesar(valor):
    print(f"Tipo no soportado: {type(valor)}")

@procesar.register
def _(valor: int):
    print(f"Procesando entero: {valor}")

@procesar.register
def _(valor: str):
    print(f"Procesando cadena: {valor}")

procesar(42)    # Procesando entero: 42
procesar("Hola")  # Procesando cadena: Hola
procesar(3.14)    # Tipo no soportado: <class 'float'>
```

    Procesando entero: 42
    Procesando cadena: Hola
    Tipo no soportado: <class 'float'>


---

### 4. Dataclases

Las **dataclasses** (clases de datos) en Python son una funcionalidad introducida en Python 3.7 para simplificar la creación de clases que se utilizan principalmente para almacenar datos. En lugar de escribir manualmente constructores, métodos como `__repr__`, `__eq__`, y otros, las dataclasses permiten generarlos automáticamente, reduciendo la cantidad de código repetitivo y haciendo que el código sea más limpio y fácil de mantener.

#### a. Características principales de las dataclasses

1. **Reducción del código repetitivo**: 
   - No necesitas escribir un constructor `__init__` a mano para inicializar atributos.
   - Métodos como `__repr__`, `__eq__`, y `__hash__` pueden ser generados automáticamente.

2. **Definición sencilla**:
   - Usan el decorador `@dataclass` para declarar que una clase es una dataclass.

3. **Flexibilidad**:
   - Puedes personalizar el comportamiento de los métodos generados.
   - Soportan tipos de datos (type hints), pero no son obligatorios.

4. **Valores predeterminados y campos opcionales**:
   - Permiten establecer valores predeterminados para los atributos o configurarlos con `field`.

#### b. Sintaxis básica


```python
from dataclasses import dataclass

@dataclass
class Persona:
    nombre: str
    edad: int
    ciudad: str = "Sin especificar"  # Valor por defecto

# Uso
persona = Persona(nombre="Juan", edad=30)
print(persona)
```

    Persona(nombre='Juan', edad=30, ciudad='Sin especificar')


#### c. Ventajas

1. **Métodos generados automáticamente**:
   - Se crean automáticamente `__init__`, `__repr__`, `__eq__`, y opcionalmente `__hash__`.
2. **Comparación de objetos**:
   - Dos objetos de la misma clase se comparan por el valor de sus atributos.
3. **Soporte para inmutabilidad**:
   - Puedes hacer que los atributos sean inmutables al usar `frozen=True`.

#### d. Ejemplo con comparación automática


```python
from dataclasses import dataclass

@dataclass
class Producto:
    nombre: str
    precio: float

producto1 = Producto(nombre="Laptop", precio=1000)
producto2 = Producto(nombre="Laptop", precio=1000)

print(producto1 == producto2)
```

    True


#### e. Uso de `field` para personalización

El método `field` permite configurar opciones avanzadas para los atributos de las dataclasses, como valores predeterminados calculados o exclusión de ciertos campos.


```python
from dataclasses import dataclass, field

@dataclass
class Empleado:
    nombre: str
    salario: float
    id: int = field(default=0)  # Valor predeterminado
    historial: list = field(default_factory=list)  # Usa una función para el valor predeterminado

# Uso
empleado = Empleado(nombre="Ana", salario=50000)
print(empleado)
```

    Empleado(nombre='Ana', salario=50000, id=0, historial=[])


#### f. Dataclasses inmutables

Usa el parámetro `frozen=True` para crear dataclasses inmutables.


```python
from dataclasses import dataclass, FrozenInstanceError

@dataclass(frozen=True)
class Punto:
    x: int
    y: int

punto = Punto(10, 20)

try:
    punto.x = 5
except FrozenInstanceError as e:
    print(e)
```

    cannot assign to field 'x'


---

### 5. Ejercicios con clases


#### a. **Sistema de notificaciones:** Crea una clase base `Notificacion` con un método `enviar`. Implementa subclases como `Email`, `SMS` y `PushNotification`.


```python
class Notificacion:
    def enviar(self, mensaje):
        raise NotImplementedError("Debe ser implementado por la subclase")

class Email(Notificacion):
    def enviar(self, mensaje):
        return f"Enviando email: {mensaje}"

class SMS(Notificacion):
    def enviar(self, mensaje):
        return f"Enviando SMS: {mensaje}"

class PushNotification(Notificacion):
    def enviar(self, mensaje):
        return f"Enviando notificación push: {mensaje}"


notificaciones = [Email(), SMS(), PushNotification()]
for notificacion in notificaciones:
    print(notificacion.enviar("¡Hola!"))
```

    Enviando email: ¡Hola!
    Enviando SMS: ¡Hola!
    Enviando notificación push: ¡Hola!


#### b. **Gestión de una biblioteca:** Crea una clase base `Material` con atributos comunes (título, autor) y métodos como `informacion`. Luego, define subclases `Libro`, `Revista` y `DVD`.


```python
class Material:
    def __init__(self, titulo, autor):
        self.titulo = titulo
        self.autor = autor

    def informacion(self):
        raise NotImplementedError("Debe ser implementado por la subclase")


class Libro(Material):
    def informacion(self):
        return f"Libro: {self.titulo} por {self.autor}"

class Revista(Material):
    def informacion(self):
        return f"Revista: {self.titulo} por {self.autor}"

class DVD(Material):
    def informacion(self):
        return f"DVD: {self.titulo}, dirigido por {self.autor}"


materiales = [
    Libro("1984", "George Orwell"),
    Revista("Science Monthly", "Varios"),
    DVD("Inception", "Christopher Nolan"),
]

for material in materiales:
    print(material.informacion())
```

    Libro: 1984 por George Orwell
    Revista: Science Monthly por Varios
    DVD: Inception, dirigido por Christopher Nolan


#### c. **Tienda online:** Crea una clase base `Usuario` con un método `descuento`. Implementa subclases como `UsuarioPremium` y `UsuarioRegular` donde el usuario premium tenga un 20% de descuento.


```python
class Usuario:
    def __init__(self, nombre, total_compra):
        self.nombre = nombre
        self.total_compra = total_compra

    def descuento(self):
        raise NotImplementedError("Debe ser implementado por la subclase")


class UsuarioPremium(Usuario):
    def descuento(self):
        return self.total_compra * 0.80  # 20% de descuento

class UsuarioRegular(Usuario):
    def descuento(self):
        return self.total_compra  # Sin descuento


usuarios = [UsuarioPremium("Juan", 1000), UsuarioRegular("Ana", 500)]
for usuario in usuarios:
    print(f"{usuario.nombre} paga: ${usuario.descuento()}")
```

    Juan paga: $800.0
    Ana paga: $500


#### d. **Biblioteca extendida:** Agrega control de acceso a la clase `Material` para que ciertos atributos solo puedan ser leídos mediante un método público, no directamente.


```python
class Material:
    def __init__(self, titulo, autor):
        self.__titulo = titulo
        self.__autor = autor

    def get_informacion(self):
        return f"Título: {self.__titulo}, Autor: {self.__autor}"


class Libro(Material):
    def get_informacion(self):
        return f"Libro -> {super().get_informacion()}"


libro = Libro("1984", "George Orwell")
print(libro.get_informacion())
```

    Libro -> Título: 1984, Autor: George Orwell


#### e. **Inventario de vehículos:** Crea una clase base `Vehiculo` con métodos para obtener detalles y atributos protegidos. Define subclases como `Auto` y `Motocicleta`.


```python
class Vehiculo:
    def __init__(self, marca, modelo):
        self._marca = marca
        self._modelo = modelo

    def detalles(self):
        raise NotImplementedError("Debe ser implementado por la subclase")


class Auto(Vehiculo):
    def detalles(self):
        return f"Auto: {self._marca}, Modelo: {self._modelo}"

class Motocicleta(Vehiculo):
    def detalles(self):
        return f"Motocicleta: {self._marca}, Modelo: {self._modelo}"


vehiculos = [
    Auto("Toyota", "Corolla"),
    Motocicleta("Yamaha", "FZ"),
]

for vehiculo in vehiculos:
    print(vehiculo.detalles())
```

    Auto: Toyota, Modelo: Corolla
    Motocicleta: Yamaha, Modelo: FZ


#### f. **Animales abstractos:** Crea una clase `Animal` que sea abstracta y define subclases como `Perro` y `Pez`, cada una con su propio método `hablar`.


```python
from abc import ABC, abstractmethod


class Animal(ABC):
    @abstractmethod
    def hablar(self):
        pass

class Perro(Animal):
    def hablar(self):
        return "Guau"

class Vaca(Animal):
    def hablar(self):
        return "Muuu"


animales = [Perro(), Vaca()]
for animal in animales:
    print(animal.hablar())
```

    Guau
    Muuu


#### g. **Sistema de pagos avanzado:** Crea subclases de `MetodoDePago` con validaciones privadas para asegurarte de que los datos del usuario sean correctos.


```python
class MetodoDePago:
    def __init__(self, usuario):
        self.__usuario = usuario

    def validar_usuario(self):
        return len(self.__usuario) > 3

    def pagar(self):
        raise NotImplementedError("Debe ser implementado por la subclase")


class TarjetaCredito(MetodoDePago):
    def pagar(self):
        if self.validar_usuario():
            return "Pago exitoso con tarjeta"
        return "Usuario no válido"


pago = TarjetaCredito("Diego")
print(pago.pagar())
```

    Pago exitoso con tarjeta


#### h. **Registro de dispositivos:** Crea una clase `Dispositivo` con atributos protegidos. Implementa subclases como `Laptop` y `Tablet` que amplíen su funcionalidad.


```python
class Dispositivo:
    def __init__(self, marca, modelo):
        self._marca = marca
        self._modelo = modelo

    def especificaciones(self):
        raise NotImplementedError("Debe ser implementado por la subclase")


class Laptop(Dispositivo):
    def especificaciones(self):
        return f"Laptop: {self._marca}, {self._modelo}"

class Tablet(Dispositivo):
    def especificaciones(self):
        return f"Tablet: {self._marca}, {self._modelo}"


dispositivos = [Laptop("Dell", "XPS"), Tablet("Apple", "iPad")]
for dispositivo in dispositivos:
    print(dispositivo.especificaciones())
```

    Laptop: Dell, XPS
    Tablet: Apple, iPad



#### i. **Sistema de autenticación multinivel:** Crea un sistema donde los usuarios tengan roles (`Admin`, `Editor`, `Viewer`) y permisos diferentes para acceder a ciertos recursos. Usa métodos protegidos y privados para manejar la autenticación.

Requisitos:
  1. Una clase base `Usuario` que maneje el login y roles.
  2. Subclases con métodos específicos según el rol.


```python
class Usuario:
    def __init__(self, nombre, rol):
        self.nombre = nombre
        self._rol = rol

    def _verificar_acceso(self, permiso):
        permisos = {
            "Admin": ["leer", "escribir", "borrar"],
            "Editor": ["leer", "escribir"],
            "Viewer": ["leer"]
        }
        return permiso in permisos.get(self._rol, [])

    def acceder_recurso(self, permiso):
        if not self._verificar_acceso(permiso):
            raise PermissionError(f"{self.nombre} no tiene permiso para {permiso}.")
        return f"{self.nombre} accedió al recurso con permiso '{permiso}'."

# Uso
usuarios = [
    Usuario("Ana", "Admin"),
    Usuario("Luis", "Editor"),
    Usuario("Sofía", "Viewer")
]
for usuario in usuarios:
    try:
        print(usuario.acceder_recurso("escribir"))
    except PermissionError as e:
        print(e)
```

    Ana accedió al recurso con permiso 'escribir'.
    Luis accedió al recurso con permiso 'escribir'.
    Sofía no tiene permiso para escribir.


#### j. **Sistema de Evaluación con Ponderación:** Crea una dataclass `Evaluacion` que almacene las notas y ponderaciones de un estudiante. Calcula el promedio ponderado en una clase `CalculadoraPromedio`.


```python
from dataclasses import dataclass

@dataclass
class Evaluacion:
    nombre: str
    nota: float
    ponderacion: float

class CalculadoraPromedio:
    def __init__(self, evaluaciones):
        self.__evaluaciones = evaluaciones

    def calcular_promedio(self):
        total = sum(e.nota * e.ponderacion for e in self.__evaluaciones)
        peso_total = sum(e.ponderacion for e in self.__evaluaciones)
        return total / peso_total if peso_total != 0 else 0

# Uso
evaluaciones = [
    Evaluacion("Parcial 1", 8, 0.4),
    Evaluacion("Parcial 2", 9, 0.6)
]
calculadora = CalculadoraPromedio(evaluaciones)
print(f"Promedio ponderado: {calculadora.calcular_promedio():.2f}")

```

    Promedio ponderado: 8.60

