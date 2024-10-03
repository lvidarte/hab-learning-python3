# Clase 11: Programación Orientada a Objetos (OOP) - Encapsulamiento, Herencia y Sobrescritura de Métodos

## Módulo 1: Encapsulamiento y herencia

### 1. Encapsulamiento

El **encapsulamiento** es un principio fundamental de la programación orientada a objetos (OOP) que implica restringir el acceso directo a ciertos atributos o métodos de un objeto. Esto ayuda a proteger los datos y evita que sean modificados accidentalmente desde fuera de la clase. 

En Python, los atributos o métodos pueden indicarse como "privados" utilizando el guion bajo doble `__`. Si bien en Python no existe una verdadera privacidad, esto sugiere que estos elementos no deberían ser accedidos desde fuera de la clase.

#### Ejemplo de encapsulamiento:


```python
class CuentaBancaria:
    def __init__(self, saldo_inicial):
        self.__saldo = saldo_inicial  # Atributo privado

    # Método público para consultar el saldo
    def consultar_saldo(self):
        return self.__saldo

    # Método público para depositar dinero
    def depositar(self, monto):
        if monto > 0:
            self.__saldo += monto

    # Método público para retirar dinero
    def retirar(self, monto):
        if monto <= self.__saldo:
            self.__saldo -= monto
        else:
            print("Fondos insuficientes")

# Crear una cuenta bancaria
cuenta = CuentaBancaria(500)

# Consultar el saldo
print(cuenta.consultar_saldo())  # Salida: 500

# Intentar acceder directamente al saldo (esto no debería hacerse)
# print(cuenta.__saldo)  # Producirá un AttributeError

# Usar los métodos para modificar el saldo
cuenta.depositar(200)
print(cuenta.consultar_saldo())  # Salida: 700

cuenta.retirar(100)
print(cuenta.consultar_saldo())  # Salida: 600
```

    500
    700
    600


En este ejemplo, el atributo `__saldo` es privado y solo puede ser accedido y modificado a través de los métodos `consultar_saldo()`, `depositar()` y `retirar()`. Esto asegura que los cambios en el saldo siempre sean controlados.

#### Ejercicio práctico:

Crea una clase `CuentaInversion` con un atributo privado `__saldo`. Implementa métodos para consultar el saldo, realizar depósitos y retiros, y aplica una tasa de interés mensual sobre el saldo.


```python

```

### 2. Herencia

La **herencia** es un mecanismo que permite a una clase (clase hija o derivada) heredar atributos y métodos de otra clase (clase padre o base). Esto facilita la reutilización de código y permite crear relaciones jerárquicas entre clases.

#### Ejemplo básico de herencia:


```python
# Clase base
class Vehiculo:
    def __init__(self, marca, modelo):
        self.marca = marca
        self.modelo = modelo

    def encender(self):
        print(f"{self.marca} {self.modelo} está encendido.")

# Clase derivada (hereda de Vehiculo)
class Coche(Vehiculo):
    def __init__(self, marca, modelo, puertas):
        super().__init__(marca, modelo)  # Llamar al constructor de la clase base
        self.puertas = puertas

    def tocar_claxon(self):
        print(f"{self.marca} {self.modelo} está tocando el claxon.")

# Crear un objeto de la clase Coche
mi_coche = Coche("Toyota", "Corolla", 4)

# Acceder a métodos y atributos heredados de Vehiculo
mi_coche.encender()  # Salida: Toyota Corolla está encendido.

# Acceder a métodos de la clase Coche
mi_coche.tocar_claxon()  # Salida: Toyota Corolla está tocando el claxon.
```

    Toyota Corolla está encendido.
    Toyota Corolla está tocando el claxon.


En este ejemplo, la clase `Coche` hereda los atributos y métodos de la clase `Vehiculo`, lo que significa que puede usar el método `encender()` además de su propio método `tocar_claxon()`.

#### Ejercicio práctico:

Crea una clase `Electrodomestico` con atributos `marca` y `modelo`, y un método `encender()`. Luego, crea una clase derivada `Lavadora` que herede de `Electrodomestico` y añada un atributo `capacidad`. Implementa un método adicional en `Lavadora` para iniciar el lavado.


```python

```

---

## Módulo 2: Sobrescritura de métodos

### 1. Sobrescritura de métodos

La **sobrescritura de métodos** (method overriding) permite que una clase derivada redefina un método heredado de su clase padre, cambiando su comportamiento o extendiéndolo. Esto es útil cuando la clase hija necesita implementar un comportamiento específico sin modificar la clase base.

#### Ejemplo de sobrescritura de métodos:


```python
# Clase base
class Trabajador:
    def __init__(self, nombre):
        self.nombre = nombre

    def trabajar(self):
        print(f"{self.nombre} está trabajando.")

# Clase derivada (hereda de Trabajador)
class Programador(Trabajador):
    def __init__(self, nombre, lenguaje):
        super().__init__(nombre)
        self.lenguaje = lenguaje

    # Sobrescribir el método trabajar
    def trabajar(self):
        print(f"{self.nombre} está programando en {self.lenguaje}.")

# Crear un objeto de la clase Programador
dev = Programador("Ana", "Python")

# Llamar al método sobrescrito
dev.trabajar()  # Salida: Ana está programando en Python.
```

    Ana está programando en Python.


En este ejemplo, la clase `Programador` sobrescribe el método `trabajar()` de la clase `Trabajador` para proporcionar un comportamiento específico para los programadores.

#### Ejemplo práctico:

Sobrescribe el método `tocar_claxon()` en la clase `Coche` para que también imprima el número de puertas del coche cuando el claxon es tocado.


```python

```

#### 2. Uso del método de la clase padre en una clase hija

A veces, cuando sobrescribimos un método, queremos extender el comportamiento de la clase base en lugar de reemplazarlo completamente. Para ello, podemos usar `super()` para llamar al método de la clase padre dentro del método sobrescrito.

#### Ejemplo:


```python
# Clase base
class Animal:
    def sonido(self):
        print("El animal emite un sonido.")

# Clase derivada
class Perro(Animal):
    # Sobrescribir el método sonido
    def sonido(self):
        super().sonido()  # Llamar al método de la clase base
        print("El perro ladra.")

# Crear un objeto de la clase Perro
mi_perro = Perro()

# Llamar al método sobrescrito
mi_perro.sonido()
# Salida:
# El animal emite un sonido.
# El perro ladra.
```

En este ejemplo, la clase `Perro` sobrescribe el método `sonido()` de la clase `Animal`, pero usa `super().sonido()` para conservar el comportamiento original y agregar un comportamiento específico.

#### Ejercicio práctico:

Define una clase `VehiculoElectrico` que herede de `Vehiculo` (ejemplo anterior) y sobrescriba el método `encender()` para imprimir que el vehículo eléctrico está encendido sin hacer ruido. Asegúrate de llamar también al método de la clase base para imprimir la información general del vehículo.


```python

```
