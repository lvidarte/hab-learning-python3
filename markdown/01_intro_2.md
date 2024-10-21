# Introducción a Python 3 - Material complementario

### 1. Historia de Python

Python es un lenguaje de programación de alto nivel que ha ganado una [notable popularidad](https://www.tiobe.com/tiobe-index/) desde su creación. Su historia se remonta a 1989, cuando [Guido van Rossum](https://es.wikipedia.org/wiki/Guido_van_Rossum), un programador holandés, comenzó a trabajar en el lenguaje como un proyecto personal durante las vacaciones de Navidad. Su objetivo era crear un lenguaje que fuera fácil de leer y escribir, permitiendo a los desarrolladores enfocarse más en la lógica del programa que en la sintaxis compleja.

#### a. El contexto que dió vida a Python

Guido van Rossum comenzó a trabajar en Python mientras estaba empleado en el Centro de Matemática y Computación de los Países Bajos (CWI), donde se dedicaba a la automatización del sistema operativo Amoeba, desarrollado bajo la supervisión de [Andrew S. Tanenbaum](https://es.wikipedia.org/wiki/Andrew_S._Tanenbaum). Este entorno de trabajo influyó en su decisión de crear un lenguaje de programación que facilitara tareas de scripting y administración en un entorno distribuido, llevando a la creación de Python en 1989.

#### b. Insatisfacción con otros lenguajes

Durante su tiempo trabajando en la automatización de Amoeba, Guido se dio cuenta de que muchos de los lenguajes de programación existentes tenían problemas en términos de usabilidad y legibilidad. Lenguajes como C/C++ y [ABC](https://es.wikipedia.org/wiki/ABC_(lenguaje_de_programaci%C3%B3n)) eran comunes en esa época, pero Guido notó que, aunque C era potente, su sintaxis era compleja y a menudo propensa a errores. Por otro lado, aunque ABC era un lenguaje más fácil de aprender, carecía de la flexibilidad y características avanzadas que él deseaba.

#### c. Evolución de Python

- **1991: Lanzamiento de Python 0.9.0**  
  La primera versión pública de Python, 0.9.0, fue lanzada en febrero de 1991. Esta versión incluía características fundamentales como clases, manejo de excepciones y funciones. Desde sus inicios, Python ha enfatizado la legibilidad y la simplicidad, lo que lo distingue de otros lenguajes.

- **1994: Python 1.0**  
  En enero de 1994, se lanzó Python 1.0, que incluyó nuevas características como la programación orientada a objetos y la gestión de módulos. Este fue un paso importante para establecer a Python como un lenguaje robusto y versátil.

- **2000: Python 2.0**  
  Python 2.0 fue lanzado en octubre de 2000. Esta versión introdujo varias mejoras, como la recolección de basura, el soporte para Unicode y un sistema de manejo de excepciones más robusto. Python 2.0 sentó las bases para la evolución futura del lenguaje.

#### d. Python 3 y la Transición desde Python 2

- **2008: Lanzamiento de Python 3.0**  
  Python 3.0, también conocido como "Python 3000" o "Py3k", fue lanzado en diciembre de 2008. Esta versión fue una revisión completa del lenguaje, diseñada para corregir defectos fundamentales en Python 2 y para simplificar la programación. La transición a Python 3 fue importante porque trajo cambios significativos que no eran retrocompatibles con Python 2.

- **Cambios clave en Python 3**:
  - **Manejo de Cadenas de Texto**: En Python 2, las cadenas de texto (`str`) eran secuencias de bytes, mientras que las cadenas Unicode se representaban con el prefijo `u` (por ejemplo, `u"texto"`). En Python 3, las cadenas de texto (`str`) son Unicode por defecto, lo que mejora el manejo de texto internacional y multilingüe.
  
  - **Divisiones de Enteros**: En Python 2, la división entre enteros realizaba una división entera (es decir, truncaba la parte decimal). Por ejemplo, `5 / 2` resultaba en `2`. En Python 3, esta operación devuelve un número de punto flotante, por lo que `5 / 2` resulta en `2.5`. Para realizar una división entera, se introdujo el operador `//`, que realiza la división y trunca el resultado, por ejemplo, `5 // 2` resulta en `2`.

- **Importancia de Python 3**:  
  Python 3 se diseñó para ser más limpio y coherente, eliminando elementos obsoletos y mejorando la usabilidad. Sin embargo, la transición de Python 2 a Python 3 fue un proceso gradual, ya que muchos proyectos y bibliotecas seguían utilizando Python 2. El soporte oficial de Python 2 finalizó el 1 de enero de 2020, lo que llevó a la comunidad a adoptar cada vez más Python 3.

#### e. Filosofía

Los usuarios de Python se refieren a menudo a la filosofía de Python, que es bastante similar a la [filosofía de Unix](https://es.wikipedia.org/wiki/Filosof%C3%ADa_de_Unix), que puede resumirse en el acrónimo KISS: Keep It Simple, Stupid. El código que siga los principios de Python es reconocido como **pythónico**. Estos principios fueron descritos por el desarrollador de Python Tim Peters en El Zen de Python:

- Bello es mejor que feo.
- Explícito es mejor que implícito.
- Simple es mejor que complejo.
- Complejo es mejor que complicado.
- Plano es mejor que anidado.
- Disperso es mejor que denso.
- La legibilidad cuenta.
- Los casos especiales no son tan especiales como para quebrantar las reglas.
- Lo práctico gana a lo puro.
- Los errores nunca deberían dejarse pasar silenciosamente.
- A menos que hayan sido silenciados explícitamente.
- Frente a la ambigüedad, rechaza la tentación de adivinar.
- Debería haber una —y preferiblemente solo una— manera obvia de hacerlo.
- Aunque esa manera puede no ser obvia al principio a menos que usted sea holandés.
- Ahora es mejor que nunca.
- Aunque nunca es a menudo mejor que ya mismo.
- Si la implementación es difícil de explicar, es una mala idea.
- Si la implementación es fácil de explicar, puede que sea una buena idea.
- Los espacios de nombres (namespaces) son una gran idea. ¡Hagamos más de esas cosas!

---

### 2. Python como Lenguaje Interpretado

#### a. Explicación de que Python es un Lenguaje Interpretado

Cuando decimos que Python es un lenguaje interpretado, nos referimos a cómo se ejecuta el código. En un lenguaje interpretado, el código fuente se traduce y se ejecuta línea por línea en tiempo de ejecución, en lugar de ser precompilado a un archivo binario ejecutable. Esto significa que:

- **Ejecución Directa**: Cuando se ejecuta un programa de Python, el intérprete lee el código y lo convierte en instrucciones que la máquina puede entender y ejecutar de manera inmediata.
- **Interactividad**: Esta característica permite que los desarrolladores trabajen de forma interactiva, probando fragmentos de código y obteniendo resultados inmediatos. Esto es especialmente útil en entornos de desarrollo y aprendizaje, donde se puede experimentar sin la necesidad de una fase de compilación.
- **Fácil Depuración**: Los errores pueden ser detectados rápidamente en el momento de la ejecución, lo que facilita la depuración y permite realizar cambios en el código sin necesidad de recompilar el programa completo.

#### b. Comparación con Lenguajes Compilados

Los lenguajes compilados, como C o C++, utilizan un proceso diferente para ejecutar el código. Aquí se destacan algunas diferencias clave entre lenguajes interpretados y compilados:

- **Proceso de Ejecución**:
  - **Lenguajes Compilados**: El código fuente se traduce en un archivo binario ejecutable antes de ser ejecutado. Este archivo binario es independiente del código fuente y puede ejecutarse sin necesidad de un compilador.
  - **Python (Interpretado)**: El código se traduce y se ejecuta simultáneamente, lo que significa que no hay un archivo binario por separado; el código fuente es lo que se ejecuta directamente.

- **Ejecución Línea por Línea**:
  - **Lenguajes Compilados**: La ejecución es generalmente más rápida, ya que se traduce todo el programa de una vez, y el código binario se optimiza para la plataforma de destino.
  - **Python**: Al ejecutarse línea por línea, Python puede ser más lento en términos de ejecución total. Sin embargo, esta ejecución también permite que el programador vea resultados inmediatos y realice pruebas de forma más sencilla.

- **Flexibilidad para Depurar**:
  - **Lenguajes Compilados**: Si se encuentra un error, el programador debe corregirlo en el código fuente y luego recompilar todo el programa. Esto puede hacer que el proceso de depuración sea más lento y menos eficiente.
  - **Python**: Permite detectar errores en tiempo real mientras se ejecuta el código. Esto significa que los desarrolladores pueden modificar partes del código y volver a ejecutarlo inmediatamente, lo que resulta en un ciclo de desarrollo más ágil.

- **Modificación y Desarrollo**:
  - **Lenguajes Compilados**: Para realizar cambios en un programa, es necesario recompilarlo, lo que puede ser un proceso que lleva tiempo, especialmente en programas grandes.
  - **Python**: Los cambios se pueden hacer en cualquier momento y ejecutarse inmediatamente, lo que permite un flujo de trabajo más dinámico y flexible.

En resumen, Python, como lenguaje interpretado, ofrece una serie de ventajas, especialmente en términos de facilidad de uso y flexibilidad durante el desarrollo. Aunque los lenguajes compilados pueden ofrecer un rendimiento superior en ciertas aplicaciones, la capacidad de Python para ejecutarse línea por línea y permitir cambios instantáneos lo convierte en una excelente opción para muchos proyectos, especialmente aquellos que involucran aprendizaje, prototipado rápido y desarrollo ágil.

#### c. Comparación con otros lenguajes populares

| **Lenguaje**  | **Tipo de Lenguaje** | **Nivel**  | **Paradigma**                  | **Uso Común**                      | **Velocidad de Ejecución** | **Manejo de Memoria**       |
|---------------|-----------------------|------------|--------------------------------|------------------------------------|-----------------------------|------------------------------|
| **Python**    | Interpretado          | Alto       | Multiparadigma                 | Desarrollo web, ciencia de datos, cloud, IA | Moderada                     | Recolección de basura        |
| **Java**      | Compilado/Interpretado| Alto       | Orientado a objetos            | Desarrollo de aplicaciones empresariales, Android | Moderada a rápida            | Recolección de basura        |
| **C**         | Compilado             | Bajo       | Procedimental                  | Sistemas operativos, control de hardware, software embebido | Muy rápida                   | Manual (malloc/free)        |
| **C++**       | Compilado             | Bajo       | Orientado a objetos, genérico  | Desarrollo de videojuegos, aplicaciones de alto rendimiento | Rápida                       | Manual (new/delete)         |
| **JavaScript**| Interpretado          | Alto       | Multiparadigma                 | Desarrollo web (frontend y backend) | Moderada                     | Recolección de basura        |
| **PHP**       | Interpretado          | Alto       | Multiparadigma                 | Desarrollo web                      | Moderada                     | Recolección de basura        |
| **Go**        | Compilado             | Medio      | Multiparadigma                 | Desarrollo de sistemas, servicios web | Rápida                       | Recolección de basura        |
| **C#**        | Compilado             | Alto       | Orientado a objetos            | Desarrollo de aplicaciones de Windows, juegos | Moderada a rápida            | Recolección de basura        |

#### d. El intérprete interactivo de Python

El **intérprete interactivo** de Python es una herramienta fundamental que permite a los usuarios ejecutar código Python de manera inmediata y obtener resultados en tiempo real. Aquí hay una descripción detallada de sus características y funcionamiento:

1. **Entorno de Ejecución**:
   - El intérprete interactivo proporciona un entorno donde los usuarios pueden escribir y ejecutar fragmentos de código Python línea por línea. Esto es especialmente útil para la experimentación y el aprendizaje, ya que permite ver rápidamente los resultados de las operaciones sin necesidad de crear y ejecutar un archivo de script completo.

2. **Interactividad**:
   - Los usuarios pueden ingresar comandos y recibir respuestas inmediatamente, lo que facilita la exploración y prueba de ideas. Esto es particularmente útil para aprender la sintaxis de Python y probar pequeñas secciones de código.

3. **Evaluación de Expresiones**:
   - Cada línea de código ingresada se evalúa de inmediato. Por ejemplo, al ingresar una expresión matemática como `2 + 2`, el intérprete devuelve el resultado `4` al instante.

4. **Acceso a la Documentación**:
   - El intérprete interactivo permite acceder a la documentación de Python y sus bibliotecas mediante el uso de la función `help()`. Esto ayuda a los usuarios a comprender mejor las funciones y módulos disponibles.

5. **Funciones y Módulos**:
   - Los usuarios pueden definir funciones y crear módulos en el intérprete interactivo, lo que les permite organizar el código y reutilizarlo en diferentes sesiones.

Al iniciar el intérprete interactivo de Python (por ejemplo, escribiendo `python` o `python3` en la terminal), se verá un símbolo de mayor que (`>>>`) donde se pueden escribir comandos. Un ejemplo de uso sería:

```python
>>> 10 + 5
15
```

---

### 3. Código Abierto

Python es un lenguaje de programación de [código abierto](https://es.wikipedia.org/wiki/C%C3%B3digo_abierto), lo que significa que su código fuente es accesible y puede ser utilizado, modificado y distribuido por cualquier persona. Este enfoque no solo promueve la colaboración y la transparencia, sino que también permite que Python evolucione y se adapte a las necesidades cambiantes de los desarrolladores y las industrias.

#### a. Concepto de Código Abierto
El código abierto se refiere a un modelo de desarrollo de software donde el código fuente es públicamente accesible. Esto permite a los desarrolladores de todo el mundo contribuir al proyecto, agregar nuevas características, corregir errores y optimizar el rendimiento. La naturaleza abierta de Python fomenta una comunidad activa donde las personas pueden compartir ideas y colaborar en la mejora continua del lenguaje.

#### b. Comunidad Global de Desarrolladores
La comunidad de Python es una de sus mayores fortalezas. Con millones de desarrolladores en todo el mundo, la comunidad de Python abarca una amplia variedad de expertos, desde principiantes hasta profesionales experimentados. Esta diversidad no solo enriquece el lenguaje, sino que también garantiza que haya una gran cantidad de recursos y soporte disponibles para aquellos que desean aprender y desarrollar con Python.

La colaboración de la comunidad ha dado lugar a una rica colección de bibliotecas y frameworks que amplían la funcionalidad de Python. Proyectos populares como Django (un framework web), NumPy (para computación numérica) y Pandas (para análisis de datos) son ejemplos de cómo los desarrolladores han construido sobre la base de Python para resolver problemas específicos y mejorar la productividad.

#### c. Evolución Rápida
La naturaleza de código abierto de Python permite que el lenguaje evolucione rápidamente en respuesta a las necesidades de la comunidad y de la industria. Los desarrolladores pueden proponer mejoras, que son revisadas y discutidas por otros miembros de la comunidad, lo que garantiza que las actualizaciones y nuevas características sean relevantes y efectivas. Este proceso colaborativo ha permitido que Python mantenga su relevancia y continúe siendo uno de los lenguajes de programación más utilizados.

#### d. Python Software Foundation (PSF)
La [Python Software Foundation](https://www.python.org/psf-landing/) (PSF) es una organización sin fines de lucro que gestiona el desarrollo y la promoción de Python. La PSF juega un papel crucial en la gobernanza del lenguaje, apoyando la comunidad y asegurando que el proyecto siga siendo de código abierto. La fundación también organiza conferencias, proporciona financiamiento para proyectos relacionados con Python y promueve el uso del lenguaje en la educación y la industria.

La PSF se encarga de administrar la licencia del lenguaje, asegurando que siga siendo accesible para todos. Además, fomenta un ambiente inclusivo y diverso, invitando a más personas a unirse a la comunidad y contribuir al crecimiento de Python.

#### e. MicroPython: Un Desarrollo Innovador
Una de las innovaciones más emocionantes dentro del ecosistema de Python es MicroPython, un lenguaje diseñado para ejecutarse en microcontroladores y entornos con recursos limitados. MicroPython es una implementación de Python 3 que permite programar dispositivos pequeños y embebidos, facilitando el uso de Python en el ámbito de la electrónica y la robótica.

MicroPython proporciona a los desarrolladores la capacidad de escribir código Python para controlar hardware, lo que abre nuevas oportunidades en la educación y el desarrollo de proyectos DIY (hazlo tú mismo). Gracias a su naturaleza de código abierto, MicroPython también permite a los desarrolladores contribuir a su evolución, expandiendo continuamente sus capacidades y funcionalidades.

Este enfoque ha hecho que MicroPython sea especialmente popular en entornos educativos, donde los estudiantes pueden aprender programación y electrónica simultáneamente. Proyectos como Raspberry Pi Pico y ESP8266 son ejemplos de cómo MicroPython se ha utilizado para enseñar a los estudiantes a interactuar con el mundo físico a través de la programación.

---

### 4. Lenguaje Multiparadigma

Python es un lenguaje multiparadigma, lo que significa que admite múltiples enfoques para resolver problemas de programación. Los tres paradigmas principales que soporta son:

- **[Programación Orientada a Objetos](https://es.wikipedia.org/wiki/Programaci%C3%B3n_orientada_a_objetos) (OOP)**
- **[Programación Funcional](https://es.wikipedia.org/wiki/Programaci%C3%B3n_funcional)**
- **[Programación Imperativa](https://es.wikipedia.org/wiki/Programaci%C3%B3n_imperativa) / [Procedural](https://es.wikipedia.org/wiki/Programaci%C3%B3n_por_procedimientos)**

A continuación, se presentan ejemplos simples para ilustrar la flexibilidad de Python en cada uno de estos paradigmas.

#### a. Programación Orientada a Objetos (OOP)

En la programación orientada a objetos, los datos y las funciones se agrupan en "objetos". Python permite crear clases que pueden ser instanciadas para crear objetos.


```python
# Ejemplo de creación de clases

class Persona:
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def saludar(self):
        print(f"Hola, mi nombre es {self.nombre} y tengo {self.edad} años.")
```


#### b. Programación Funcional

La programación funcional trata a las funciones como ciudadanos de primera clase. Esto significa que las funciones pueden ser pasadas como argumentos, retornadas desde otras funciones y asignadas a variables. Python también soporta funciones anónimas, conocidas como **lambdas**.


```python
# Ejemplo de uso de funciones como objetos de primera clase y lambda

# Definimos una función que toma otra función como argumento
def aplicar_funcion(func, lista):
    return [func(x) for x in lista]

# Usamos una función lambda para elevar al cuadrado los números
numeros = [1, 2, 3, 4]
resultado = aplicar_funcion(lambda x: x ** 2, numeros)

print(resultado)  # Salida: [1, 4, 9, 16]
```


En este ejemplo, la función `aplicar_funcion` toma una función (en este caso, una lambda) y una lista de números, y aplica la función a cada elemento de la lista.

#### c. Programación Imperativa

La programación imperativa se centra en el uso de declaraciones para cambiar el estado de un programa. Esto se hace a través de estructuras de control de flujo, como bucles y condicionales.


```python
# Ejemplo de código imperativo

# Ejemplo de un bucle for para iterar sobre una lista
frutas = ["manzana", "naranja", "cereza"]

for fruta in frutas:
    print(f"Me gusta la {fruta}.")
```


En este caso, el bucle `for` se utiliza para iterar sobre una lista de frutas y se imprime un mensaje para cada fruta.

#### d. Resumen

La versatilidad de Python como un lenguaje multiparadigma permite a los desarrolladores elegir el enfoque más adecuado para un problema específico. Esto no solo mejora la productividad, sino que también permite crear soluciones más claras y mantenibles. Al soportar la programación orientada a objetos, la programación funcional con funciones como ciudadanos de primera clase (incluyendo el uso de lambdas), y la programación imperativa, Python se adapta a una variedad de estilos de programación y necesidades de desarrollo.

---

### 5. Python en la Educación

Python ha emergido como uno de los lenguajes de programación más utilizados en entornos educativos, desde la enseñanza básica hasta niveles más avanzados. Su facilidad de aprendizaje y la claridad de su sintaxis lo convierten en una herramienta ideal para introducir a los estudiantes en conceptos de programación y pensamiento computacional.

#### a. Facilidad de Aprendizaje
La simplicidad de Python permite que los estudiantes, incluso aquellos sin experiencia previa en programación, puedan entender y aplicar conceptos fundamentales rápidamente. Esto facilita un aprendizaje efectivo y motivador, ya que los estudiantes pueden concentrarse en resolver problemas y desarrollar proyectos en lugar de luchar con la complejidad del lenguaje.

#### b. Proyectos Educativos Prácticos
Python se ha integrado en varios proyectos educativos que permiten a los estudiantes experimentar con la programación de manera práctica. Entre los proyectos más destacados se encuentran:

- [Raspberry Pi](https://raspberrypi.org/): Este pequeño ordenador de bajo costo ha revolucionado la enseñanza de la programación y la informática. Con Python, los estudiantes pueden programar aplicaciones, controlar dispositivos y crear proyectos interactivos. Raspberry Pi es utilizado en aulas de todo el mundo para enseñar desde conceptos básicos de programación hasta proyectos avanzados de IoT (Internet de las Cosas).

- [Microbit](https://microbit.org/): Diseñado específicamente para la educación, Microbit es una placa de desarrollo que permite a los estudiantes programar dispositivos de forma sencilla. Con un entorno de programación que incluye Python, los usuarios pueden crear proyectos como juegos, dispositivos de medición y aplicaciones interactivas. La combinación de hardware y software fomenta el aprendizaje práctico y creativo.

- [Arduino](https://arduino.cc/): Aunque Arduino utiliza principalmente C/C++, Python puede ser integrado a través de bibliotecas y herramientas como MicroPython. Esto permite a los estudiantes combinar la programación de hardware con el aprendizaje de Python, fomentando el desarrollo de proyectos en robótica y electrónica.

#### c. Recursos y Comunidades
La comunidad de Python ofrece una gran cantidad de recursos educativos, desde tutoriales y cursos en línea hasta libros y foros de discusión. Muchas organizaciones, como [Code.org](https://code.org/), han incluido Python en sus currículos, ofreciendo a los estudiantes oportunidades para aprender a programar de manera accesible y atractiva.

#### d. Preparación para el Futuro
El conocimiento de Python no solo es valioso para estudiantes que desean seguir carreras en tecnología, sino que también les proporciona habilidades transferibles que son aplicables en diversas disciplinas. A medida que el mundo se vuelve más digital, entender los fundamentos de la programación es cada vez más relevante, independientemente de la carrera que elijan los estudiantes.

---

### 6. MicroPython: Una Implementación Compacta de Python para Microcontroladores

[MicroPython](https://micropython.org/) es una implementación del lenguaje Python diseñada específicamente para ejecutarse en microcontroladores y sistemas embebidos. Ofrece una forma accesible de utilizar Python en dispositivos con recursos limitados, permitiendo a los desarrolladores aprovechar la simplicidad y la flexibilidad de Python en el mundo de la electrónica y la programación de hardware.

#### a. Características Clave de MicroPython

1. **Ligero y Eficiente**: MicroPython está diseñado para funcionar en dispositivos con poca memoria y capacidad de procesamiento. Esto significa que se ha optimizado para ocupar menos espacio y consumir menos recursos en comparación con la implementación estándar de Python.

2. **Interactividad**: Al igual que Python, MicroPython permite la programación interactiva. Esto significa que los desarrolladores pueden utilizar un REPL (Read-Eval-Print Loop) para probar comandos y scripts de forma inmediata, facilitando el desarrollo y la depuración.

3. **Soporte para Hardware**: MicroPython proporciona bibliotecas específicas para interactuar con hardware, como pines GPIO, comunicación I2C, SPI y más. Esto permite a los usuarios controlar componentes electrónicos como sensores, motores y pantallas directamente desde su código Python.

4. **Sintaxis Familiar**: Al ser una implementación de Python, MicroPython mantiene la misma sintaxis y estructura que Python, lo que facilita la transición para aquellos que ya están familiarizados con el lenguaje. Esto hace que MicroPython sea una excelente opción para educadores y principiantes en el ámbito de la programación de hardware.

5. **Portabilidad**: Aunque MicroPython está diseñado para ejecutarse en diferentes plataformas de hardware, como ESP8266, ESP32 y Raspberry Pi Pico, el código Python que se escribe generalmente puede ser portado fácilmente entre estas plataformas con pocos o ningún cambio.

#### b. Ejemplo de Código en MicroPython

A continuación, se muestra un ejemplo simple de cómo usar MicroPython para hacer parpadear un LED conectado a un pin GPIO de un microcontrolador:

```python
from machine import Pin
import time

# Configuramos el pin 2 como salida
led = Pin(2, Pin.OUT)

while True:
    led.on()  # Enciende el LED
    time.sleep(1)  # Espera 1 segundo
    led.off()  # Apaga el LED
    time.sleep(1)  # Espera 1 segundo
```

En este ejemplo, se importa la clase `Pin` desde el módulo `machine`, se configura un pin como salida, y luego se utiliza un bucle infinito para encender y apagar un LED cada segundo. La simplicidad de la sintaxis de MicroPython permite a los desarrolladores centrarse en la lógica del hardware sin complicaciones innecesarias.
