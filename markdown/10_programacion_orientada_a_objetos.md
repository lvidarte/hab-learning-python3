# Clase 10: Programación Orientada a Objetos (OOP)

## Módulo 1: Programación Orientada a Objetos (OOP) - Introducción

### 1. Conceptos básicos de la Programación Orientada a Objetos (OOP)

La **Programación Orientada a Objetos (OOP)** es un paradigma de programación que se basa en la creación de objetos para representar entidades del mundo real o abstracto. A través de este enfoque, el código se estructura de manera más clara, reutilizable y mantenible.

#### Elementos clave de la OOP:

- **Clase**: Es una plantilla o blueprint que define las características (atributos) y comportamientos (métodos) de los objetos que se crearán a partir de ella.
- **Objeto**: Es una instancia de una clase, que contiene valores específicos de los atributos definidos en la clase.
- **Atributos**: Son las propiedades o datos asociados a una clase. Pueden ser atributos de instancia (específicos para cada objeto) o atributos de clase (compartidos entre todas las instancias).
- **Métodos**: Son funciones dentro de una clase que definen las acciones o comportamientos que los objetos pueden realizar.

#### 2. Definición de una clase y creación de un objeto

La estructura básica de una clase en Python se define con la palabra clave `class`:


```python
class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre  # Atributo de instancia
        self.edad = edad      # Atributo de instancia

# Creación de un objeto (instancia) de la clase Persona
persona1 = Persona("Carlos", 30)

# Accediendo a los atributos del objeto
print(persona1.nombre)  # Salida: Carlos
print(persona1.edad)    # Salida: 30
```

    Carlos
    30


En el ejemplo anterior:
- `Persona` es la clase.
- `persona1` es un objeto (instancia) de la clase `Persona`.
- `__init__` es el **constructor**, un método especial que se ejecuta automáticamente al crear un objeto. Se usa para inicializar los atributos del objeto.

#### 3. Importancia de la OOP

La OOP permite estructurar el código de manera que sea fácil de entender, modificar y reutilizar. Sus principales ventajas son:
- **Encapsulación**: Los atributos y métodos se agrupan en una clase, facilitando la organización del código.
- **Herencia**: Permite que una clase herede propiedades y comportamientos de otra clase.
- **Polimorfismo**: Permite que objetos de diferentes clases puedan ser tratados de manera uniforme, siempre y cuando compartan ciertos comportamientos.

#### Ejercicio práctico:

Define una clase `Producto` que tenga los atributos `nombre`, `precio` y `cantidad`. Luego, crea dos objetos de esta clase y muestra sus atributos.


```python

```

---

## Módulo 2: Atributos y métodos

### 1. Atributos de instancia y atributos de clase

Los atributos pueden ser de dos tipos:
- **Atributos de instancia**: Son únicos para cada objeto creado a partir de una clase. Cada instancia de una clase puede tener valores distintos en estos atributos.
- **Atributos de clase**: Son compartidos por todas las instancias de la clase.

#### Ejemplo de atributos de instancia:


```python
class Empleado:
    def __init__(self, nombre, puesto, salario):
        self.nombre = nombre   # Atributo de instancia
        self.puesto = puesto   # Atributo de instancia
        self.salario = salario # Atributo de instancia

# Crear dos objetos de la clase Empleado
empleado1 = Empleado("Ana", "Ingeniera", 50000)
empleado2 = Empleado("Luis", "Gerente", 75000)

# Acceder a los atributos de cada objeto
print(empleado1.nombre, empleado1.puesto, empleado1.salario)
# Salida: Ana Ingeniera 50000

print(empleado2.nombre, empleado2.puesto, empleado2.salario)
# Salida: Luis Gerente 75000
```

    Ana Ingeniera 50000
    Luis Gerente 75000


En este ejemplo, cada empleado tiene sus propios valores para `nombre`, `puesto` y `salario`, que son atributos de instancia.

#### Ejemplo de atributo de clase:

Los atributos de clase son aquellos que son compartidos por todas las instancias de una clase. Pueden ser útiles para almacenar información común entre todos los objetos.


```python
class Empresa:
    sector = "Tecnología"  # Atributo de clase

    def __init__(self, nombre):
        self.nombre = nombre  # Atributo de instancia

# Crear dos objetos de la clase Empresa
empresa1 = Empresa("InnovaTech")
empresa2 = Empresa("SoftSolutions")

# Acceder a los atributos de clase
print(empresa1.sector)  # Salida: Tecnología
print(Empresa.sector)  # Salida: Tecnología

# Acceder a los atributos de instancia
print(empresa1.nombre)  # Salida: InnovaTech
print(empresa2.nombre)  # Salida: SoftSolutions
```

    Tecnología
    Tecnología
    InnovaTech
    SoftSolutions


#### Ejercicio práctico:

Define una clase `Universidad` con un atributo de clase llamado `tipo` que tenga el valor `"Pública"`. Además, define atributos de instancia como `nombre` y `ubicación`. Crea dos objetos de esta clase y muestra los valores de sus atributos.


```python

```

### 2. Métodos en las clases

Los **métodos** son funciones que pertenecen a una clase y permiten a los objetos de esa clase realizar acciones o comportamientos específicos. Los métodos se definen dentro de la clase, y el primer parámetro de un método siempre es `self`, que representa al objeto que está llamando al método.

#### Ejemplo de método de instancia:


```python
class Calculadora:
    def __init__(self):
        pass  # No necesitamos inicializar ningún atributo en este caso

    # Método para sumar dos números
    def sumar(self, a, b):
        return a + b

    # Método para restar dos números
    def restar(self, a, b):
        return a - b

# Crear un objeto de la clase Calculadora
calc = Calculadora()

# Llamar a los métodos del objeto
print(calc.sumar(10, 5))  # Salida: 15
print(calc.restar(10, 5))  # Salida: 5
```

    15
    5


#### Métodos con parámetros adicionales:

Los métodos también pueden aceptar parámetros adicionales que permiten realizar acciones más flexibles.


```python
class Rectangulo:
    def __init__(self, ancho, alto):
        self.ancho = ancho  # Atributo de instancia
        self.alto = alto    # Atributo de instancia

    # Método para calcular el área del rectángulo
    def calcular_area(self):
        return self.ancho * self.alto

# Crear un objeto de la clase Rectangulo
rect = Rectangulo(10, 20)

# Llamar al método calcular_area
print("Área del rectángulo:", rect.calcular_area())  # Salida: 200
```

    Área del rectángulo: 200


#### Ejercicio práctico:

Define una clase `Coche` con los atributos `marca`, `modelo`, y `kilometraje`. Añade un método llamado `viajar()` que acepte una distancia como parámetro y actualice el kilometraje del coche. Crea un objeto de esta clase y usa el método `viajar()` para actualizar su kilometraje.


```python

```

### 3. Atributos y métodos privados

En Python, los atributos y métodos pueden ser "privados", lo que significa que no deberían ser accesibles directamente fuera de la clase. Para hacer que un atributo o método sea privado, se utiliza un guion bajo doble `__` antes del nombre.

#### Ejemplo de atributo privado:


```python
class CuentaBancaria:
    def __init__(self, saldo_inicial):
        self.__saldo = saldo_inicial  # Atributo privado

    # Método para consultar el saldo
    def consultar_saldo(self):
        return self.__saldo

    # Método para depositar dinero
    def depositar(self, monto):
        self.__saldo += monto

# Crear un objeto de la clase CuentaBancaria
cuenta = CuentaBancaria(1000)

# Consultar el saldo mediante el método
print("Saldo inicial:", cuenta.consultar_saldo())  # Salida: 1000

# Intentar acceder al atributo privado directamente causará un error
# print(cuenta.__saldo)  # Esto producirá un AttributeError
```

    Saldo inicial: 1000


En este ejemplo, `__saldo` es un atributo privado, por lo que no se puede acceder a él directamente desde fuera de la clase. Sin embargo, se puede acceder a él a través del método público `consultar_saldo()`.

#### Ejercicio práctico:

Crea una clase `Cuenta` con un atributo privado `__saldo`. Añade métodos para consultar el saldo, depositar y retirar dinero de la cuenta. Asegúrate de que el saldo no pueda ser modificado directamente desde fuera de la clase.


```python

```
