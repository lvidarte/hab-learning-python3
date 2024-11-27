# Clase 12: Material complementario

### 1. Introducción a la lectura y escritura de archivos en Python

Trabajar con archivos es una de las tareas comunes en cualquier lenguaje de programación, incluido Python. Python ofrece una interfaz simple y poderosa para leer y escribir archivos, aprovechando el sistema de archivos del sistema operativo subyacente. 

#### a. Concepto clave: Descriptores de archivo (File Descriptors)

- Un **descriptor de archivo** es un identificador único que el sistema operativo utiliza para manejar un archivo abierto.
- Cada vez que abres un archivo en Python, el sistema operativo asigna un descriptor a esa operación. Este descriptor permite realizar operaciones como leer, escribir o cerrar el archivo.
- Sin embargo, los descriptores son un recurso limitado. Si no cierras los archivos abiertos, estos descriptores permanecen ocupados, lo que puede llevar a problemas como **fugas de recursos** o **errores por límites de archivos abiertos**.

#### b. Por qué liberar recursos

1. **Evitar fugas de recursos**: 
   - Cada archivo abierto consume un descriptor del sistema operativo. No cerrar los archivos puede causar un agotamiento de estos descriptores, lo que impacta el rendimiento.
2. **Integridad de datos**:
   - Escribir en un archivo y no cerrarlo adecuadamente puede provocar que los datos no se guarden correctamente, ya que los buffers internos del sistema operativo podrían no vaciarse.
3. **Buenas prácticas de programación**:
   - Liberar recursos ayuda a mantener tu aplicación eficiente y libre de errores.

#### c. El bloque `with` en Python

Python proporciona una forma sencilla y segura de manejar archivos utilizando el bloque `with`, que asegura que los recursos se liberen automáticamente al salir del bloque, incluso si ocurre una excepción. Sus ventajas son:

- **Manejo automático de recursos**: No necesitas llamar manualmente a `close()`.
- **Código más limpio**: Reduce el riesgo de olvidarte de cerrar un archivo.
- **Seguridad**: Garantiza que el archivo se cierre, incluso si ocurre un error durante las operaciones.

#### d. Abrir un archivo

El método básico para abrir un archivo es la función `open()`. Su sintaxis:

```python
open(nombre_archivo, modo)
```
Donde `modo` puede ser:
- `'r'`: Leer (por defecto).
- `'w'`: Escribir (borra el contenido existente o crea el archivo si no existe).
- `'a'`: Añadir al final del archivo.
- `'b'`: Modo binario (se combina con otros modos, como `'rb'` o `'wb'`).

---

### 2. Generación de un archivo de texto


```python
archivo = "datos.txt"

# Contenido del archivo
contenido = """\
Nombre,Edad,Profesión
Ana,28,Ingeniera
Carlos,34,Doctor
Sofía,23,Estudiante
Miguel,45,Profesor
Lucía,29,Diseñadora
"""

# Crear el archivo
with open(archivo, "w") as file:
    file.write(contenido)

print(f"Archivo '{archivo}' generado con éxito.")
```

    Archivo 'datos.txt' generado con éxito.



```python
with open(archivo, "r") as file:
    for line in file.readlines():
        print('\t'.join(line.strip().split(',')))
```

    Nombre	Edad	Profesión
    Ana	28	Ingeniera
    Carlos	34	Doctor
    Sofía	23	Estudiante
    Miguel	45	Profesor
    Lucía	29	Diseñadora


---

### 3. Generación de un archivo csv

- Documentación: [https://docs.python.org/es/3.9/library/csv.html](https://docs.python.org/es/3.9/library/csv.html)


```python
import csv

archivo= "datos.csv"

# Datos a escribir en el archivo
datos = [
    ["Nombre", "Edad", "Profesión"],  # Encabezado
    ["Ana", 28, "Ingeniera"],
    ["Carlos", 34, "Doctor"],
    ["Sofía", 23, "Estudiante"],
    ["Miguel", 45, "Profesor"],
    ["Lucía", 29, "Diseñadora"],
]

# Crear el archivo CSV y escribir los datos
with open(archivo, mode="w", newline="") as file:
    writer = csv.writer(file)
    writer.writerows(datos)

print(f"Archivo '{archivo}' generado con éxito.")
```

    Archivo 'data.txt' generado con éxito.


---

### 4. Lectura y escritura de archivos UTF-8 en Python

#### a. Abrir archivos UTF-8

Cuando trabajas con archivos que contienen texto en codificación UTF-8, es crucial especificar correctamente la codificación al abrir el archivo para evitar problemas con caracteres especiales. Python ofrece la función `open()` con un parámetro `encoding` que permite abrir archivos en la codificación deseada.


```python
# Escribir en un archivo con codificación UTF-8
with open('archivo_utf8.txt', 'w', encoding='utf-8') as file:
    file.write("Hola, este es un archivo en UTF-8.\n")
    file.write("Aquí podemos agregar más texto en diferentes idiomas: Español, 中文, العربية.\n")

# Leer el archivo con codificación UTF-8
with open('archivo_utf8.txt', 'r', encoding='utf-8') as file:
    content = file.read()

# Imprimir el contenido del archivo
print(content)
```

    Hola, este es un archivo en UTF-8.
    Aquí podemos agregar más texto en diferentes idiomas: Español, 中文, العربية.
    


En este ejemplo, `encoding='utf-8'` asegura que Python lea correctamente los caracteres especiales, como tildes, eñes, o caracteres de otros idiomas.

En Python 3, UTF-8 es la codificación por defecto en la mayoría de los sistemas modernos (Linux, macOS y versiones recientes de Windows). Por lo tanto no es necesario especificar explícitamente la codificación al abrir un archivo si deseas usar UTF-8.

#### b. ¿Qué es Unicode?

**Unicode** es un estándar de codificación de caracteres que pretende representar todos los caracteres de todos los idiomas escritos del mundo. Se diseñó para resolver los problemas de las codificaciones anteriores, que eran limitadas y no podían representar la variedad completa de caracteres (por ejemplo, ASCII solo cubre 128 caracteres).
Unicode asigna un **código único** a cada carácter (por ejemplo, "A" tiene el valor 65 en Unicode, pero también lo tiene en ASCII).

#### c. ¿UTF-8?

**UTF-8** es una de las **codificaciones de caracteres** más populares y ampliamente usadas en el mundo. Es una implementación de Unicode que usa una secuencia de 1 a 4 bytes para representar cada carácter.

**UTF-8** es **compatible con ASCII**, lo que significa que los primeros 128 caracteres de Unicode (que son los mismos que ASCII) se representan de la misma manera en ambas codificaciones. Los caracteres adicionales (como tildes o caracteres chinos) requieren más bytes.

- **Ventajas de UTF-8**:
  - Es eficiente en términos de espacio para idiomas basados en el alfabeto latino.
  - No requiere la definición de un tamaño fijo de memoria para cada carácter.
  - Es compatible con el sistema ASCII.

#### d. ¿Cómo trabaja internamente Python con Unicode y UTF-8?

Python 3 internamente usa **Unicode** para representar cadenas de texto (`str`). Cada carácter dentro de una cadena en Python es un **punto de código Unicode**.
  
#### e. Codificación y Decodificación

Cuando trabajas con archivos o datos binarios, Python convierte internamente las cadenas de texto de Unicode a un formato de bytes (y viceversa) usando una codificación como UTF-8. Esta conversión se llama **codificación** (de Unicode a bytes) y **decodificación** (de bytes a Unicode).


```python
# Codificación: Convierte los caracteres de una cadena en una secuencia de bytes.

text = "¡Hola, mundo!" # ♥ π
encoded_text = text.encode('utf-8')  # Codificar como UTF-8 (bytes)
print(encoded_text)  # b'\xc2\xa1Hola, mundo!'
```

    b'\xc2\xa1Hola, mundo!'



```python
# Decodificación: Convierte una secuencia de bytes en una cadena de caracteres.

byte_data = b'\xc2\xa1Hola, mundo!'
decoded_text = byte_data.decode('utf-8')  # Decodificar de UTF-8 a cadena
print(decoded_text)  # ¡Hola, mundo!

#print(len(decoded_text))  # Total caracteres
print(' '.join(f"{byte:08b}" for byte in byte_data))
```

    ¡Hola, mundo!
    11000010 10100001 01001000 01101111 01101100 01100001 00101100 00100000 01101101 01110101 01101110 01100100 01101111 00100001



```python
# Codificación a UTF-16
print(text.encode('utf-16'))
```

    b'\xff\xfe\xa1\x00H\x00o\x00l\x00a\x00,\x00 \x00m\x00u\x00n\x00d\x00o\x00!\x00'



```python
# Decodificación desde UTF-16
byte_data = b'\xff\xfe\xa1\x00H\x00o\x00l\x00a\x00,\x00 \x00m\x00u\x00n\x00d\x00o\x00!\x00'
print(byte_data.decode('utf-16'))

# Imprimir byte a byte
#print(' '.join(f"{byte:08b}" for byte in byte_data))
```

    ¡Hola, mundo!



```python
print(0xA1)
```

    161


---

### 5. ASCII

**ASCII (American Standard Code for Information Interchange)** es un sistema de codificación de caracteres que se utiliza para representar texto en las computadoras y otros dispositivos electrónicos. Fue desarrollado en la década de 1960 y es uno de los estándares más antiguos en la informática.

ASCII utiliza un conjunto de **128 códigos numéricos** (del 0 al 127) para representar caracteres. Estos códigos incluyen:

- **Letras (mayúsculas y minúsculas):** Desde la `A` hasta la `Z` (códigos 65 a 90) y desde la `a` hasta la `z` (códigos 97 a 122).
- **Números:** Del `0` al `9` (códigos 48 a 57).
- **Símbolos:** Como `@`, `#`, `&`, y otros caracteres comunes (por ejemplo, el espacio, la coma, el punto, etc.).
- **Carácter de control:** Como `nueva línea (LF)`, `tabulación (TAB)`, y el `carácter de fin de línea (CR)`.

#### a. Características clave de ASCII

- **Longitud fija:** Cada carácter se representa mediante un valor numérico de **7 bits**, lo que da como resultado 128 posibles caracteres (aunque algunos sistemas lo usan con 8 bits, con valores de 0 a 255).
- **Compatibilidad:** ASCII es compatible con casi todos los lenguajes de programación y sistemas operativos. Los caracteres ASCII básicos son los mismos en casi todos los entornos, lo que facilita la interoperabilidad.

Aunque ASCII es limitado, en la actualidad se utiliza como base para otras codificaciones más complejas, como **UTF-8**, que es capaz de representar una gama más amplia de caracteres de diferentes idiomas y símbolos globales.

#### b. Tabla de caracteres

| Código ASCII | HEX    | BIN        | Caracter | Descripción                         |
|--------------|--------|------------|----------|-------------------------------------|
| 0            | 0x00   | 0b00000000 | NUL      | Carácter nulo (null)                |
| 1            | 0x01   | 0b00000001 | SOH      | Inicio de encabezado                |
| 2            | 0x02   | 0b00000010 | STX      | Inicio de texto                     |
| 3            | 0x03   | 0b00000011 | ETX      | Fin de texto                        |
| 4            | 0x04   | 0b00000100 | EOT      | Fin de transmisión                  |
| 5            | 0x05   | 0b00000101 | ENQ      | Consulta                            |
| 6            | 0x06   | 0b00000110 | ACK      | Reconocimiento                      |
| 7            | 0x07   | 0b00000111 | BEL      | Timbre (bell)                       |
| 8            | 0x08   | 0b00001000 | BS       | Retroceso (backspace)               |
| 9            | 0x09   | 0b00001001 | TAB      | Tabulación horizontal               |
| 10           | 0x0A   | 0b00001010 | LF       | Salto de línea (Line Feed)          |
| 11           | 0x0B   | 0b00001011 | VT       | Tabulación vertical                 |
| 12           | 0x0C   | 0b00001100 | FF       | Form feed (salto de página)         |
| 13           | 0x0D   | 0b00001101 | CR       | Retorno de carro (Carriage Return)  |
| 14           | 0x0E   | 0b00001110 | SO       | Cambio de modo (Shift Out)          |
| 15           | 0x0F   | 0b00001111 | SI       | Cambio de modo (Shift In)           |
| 16           | 0x10   | 0b00010000 | DLE      | Escape de datos                     |
| 17           | 0x11   | 0b00010001 | DC1      | Control de dispositivo 1 (XON)      |
| 18           | 0x12   | 0b00010010 | DC2      | Control de dispositivo 2            |
| 19           | 0x13   | 0b00010011 | DC3      | Control de dispositivo 3 (XOFF)     |
| 20           | 0x14   | 0b00010100 | DC4      | Control de dispositivo 4            |
| 21           | 0x15   | 0b00010101 | NAK      | No reconocimiento                   |
| 22           | 0x16   | 0b00010110 | SYN      | Sincronización                      |
| 23           | 0x17   | 0b00010111 | ETB      | Fin de bloque de transmisión        |
| 24           | 0x18   | 0b00011000 | CAN      | Cancelar                            |
| 25           | 0x19   | 0b00011001 | EM       | Fin de medio                        |
| 26           | 0x1A   | 0b00011010 | SUB      | Sustitución (substitute)            |
| 27           | 0x1B   | 0b00011011 | ESC      | Escape                              |
| 28           | 0x1C   | 0b00011100 | FS       | Separador de archivos               |
| 29           | 0x1D   | 0b00011101 | GS       | Separador de grupo                  |
| 30           | 0x1E   | 0b00011110 | RS       | Separador de registro               |
| 31           | 0x1F   | 0b00011111 | US       | Separador de unidad                 |
| 32           | 0x20   | 0b00100000 | SPACE    | Espacio                             |
| 33           | 0x21   | 0b00100001 | !        | Signo de exclamación                |
| 34           | 0x22   | 0b00100010 | "        | Comillas dobles                     |
| 35           | 0x23   | 0b00100011 | #        | Almohadilla                         |
| 36           | 0x24   | 0b00100100 | $        | Signo de dólar                      |
| 37           | 0x25   | 0b00100101 | %        | Porcentaje                          |
| 38           | 0x26   | 0b00100110 | &        | Ampersand                           |
| 39           | 0x27   | 0b00100111 | '        | Comillas simples                    |
| 40           | 0x28   | 0b00101000 | (        | Paréntesis izquierdo                |
| 41           | 0x29   | 0b00101001 | )        | Paréntesis derecho                  |
| 42           | 0x2A   | 0b00101010 | *        | Asterisco                           |
| 43           | 0x2B   | 0b00101011 | +        | Signo de más                        |
| 44           | 0x2C   | 0b00101100 | ,        | Coma                                |
| 45           | 0x2D   | 0b00101101 | -        | Guion (-)                           |
| 46           | 0x2E   | 0b00101110 | .        | Punto                               |
| 47           | 0x2F   | 0b00101111 | /        | Barra diagonal                      |
| 48           | 0x30   | 0b00110000 | 0        | Dígito 0                            |
| 49           | 0x31   | 0b00110001 | 1        | Dígito 1                            |
| 50           | 0x32   | 0b00110010 | 2        | Dígito 2                            |
| 51           | 0x33   | 0b00110011 | 3        | Dígito 3                            |
| 52           | 0x34   | 0b00110100 | 4        | Dígito 4                            |
| 53           | 0x35   | 0b00110101 | 5        | Dígito 5                            |
| 54           | 0x36   | 0b00110110 | 6        | Dígito 6                            |
| 55           | 0x37   | 0b00110111 | 7        | Dígito 7                            |
| 56           | 0x38   | 0b00111000 | 8        | Dígito 8                            |
| 57           | 0x39   | 0b00111001 | 9        | Dígito 9                            |
| 58           | 0x3A   | 0b00111010 | :        | Dos puntos                          |
| 59           | 0x3B   | 0b00111011 | ;        | Punto y coma                        |
| 60           | 0x3C   | 0b00111100 | <        | Menor que                           |
| 61           | 0x3D   | 0b00111101 | =        | Igual a                             |
| 62           | 0x3E   | 0b00111110 | >        | Mayor que                           |
| 63           | 0x3F   | 0b00111111 | ?        | Signo de pregunta                   |
| 64           | 0x40   | 0b01000000 | @        | Arroba                              |
| 65           | 0x41   | 0b01000001 | A        | Letra mayúscula A                   |
| 66           | 0x42   | 0b01000010 | B        | Letra mayúscula B                   |
| 67           | 0x43   | 0b01000011 | C        | Letra mayúscula C                   |
| 68           | 0x44   | 0b01000100 | D        | Letra mayúscula D                   |
| 69           | 0x45   | 0b01000101 | E        | Letra mayúscula E                   |
| 70           | 0x46   | 0b01000110 | F        | Letra mayúscula F                   |
| 71           | 0x47   | 0b01000111 | G        | Letra mayúscula G                   |
| 72           | 0x48   | 0b01001000 | H        | Letra mayúscula H                   |
| 73           | 0x49   | 0b01001001 | I        | Letra mayúscula I                   |
| 74           | 0x4A   | 0b01001010 | J        | Letra mayúscula J                   |
| 75           | 0x4B   | 0b01001011 | K        | Letra mayúscula K                   |
| 76           | 0x4C   | 0b01001100 | L        | Letra mayúscula L                   |
| 77           | 0x4D   | 0b01001101 | M        | Letra mayúscula M                   |
| 78           | 0x4E   | 0b01001110 | N        | Letra mayúscula N                   |
| 79           | 0x4F   | 0b01001111 | O        | Letra mayúscula O                   |
| 80           | 0x50   | 0b01010000 | P        | Letra mayúscula P                   |
| 81           | 0x51   | 0b01010001 | Q        | Letra mayúscula Q                   |
| 82           | 0x52   | 0b01010010 | R        | Letra mayúscula R                   |
| 83           | 0x53   | 0b01010011 | S        | Letra mayúscula S                   |
| 84           | 0x54   | 0b01010100 | T        | Letra mayúscula T                   |
| 85           | 0x55   | 0b01010101 | U        | Letra mayúscula U                   |
| 86           | 0x56   | 0b01010110 | V        | Letra mayúscula V                   |
| 87           | 0x57   | 0b01010111 | W        | Letra mayúscula W                   |
| 88           | 0x58   | 0b01011000 | X        | Letra mayúscula X                   |
| 89           | 0x59   | 0b01011001 | Y        | Letra mayúscula Y                   |
| 90           | 0x5A   | 0b01011010 | Z        | Letra mayúscula Z                   |
| 91           | 0x5B   | 0b01011011 | [        | Corchete izquierdo                  |
| 92           | 0x5C   | 0b01011100 | \        | Barra invertida (backslash)         |
| 93           | 0x5D   | 0b01011101 | ]        | Corchete derecho                    |
| 94           | 0x5E   | 0b01011110 | ^        | Circunflejo (caret)                 |
| 95           | 0x5F   | 0b01011111 | _        | Guion bajo (underscore)             |
| 96           | 0x60   | 0b01100000 | `        | Acento grave (backtick)             |
| 97           | 0x61   | 0b01100001 | a        | Letra minúscula a                   |
| 98           | 0x62   | 0b01100010 | b        | Letra minúscula b                   |
| 99           | 0x63   | 0b01100011 | c        | Letra minúscula c                   |
| 100          | 0x64   | 0b01100100 | d        | Letra minúscula d                   |
| 101          | 0x65   | 0b01100101 | e        | Letra minúscula e                   |
| 102          | 0x66   | 0b01100110 | f        | Letra minúscula f                   |
| 103          | 0x67   | 0b01100111 | g        | Letra minúscula g                   |
| 104          | 0x68   | 0b01101000 | h        | Letra minúscula h                   |
| 105          | 0x69   | 0b01101001 | i        | Letra minúscula i                   |
| 106          | 0x6A   | 0b01101010 | j        | Letra minúscula j                   |
| 107          | 0x6B   | 0b01101011 | k        | Letra minúscula k                   |
| 108          | 0x6C   | 0b01101100 | l        | Letra minúscula l                   |
| 109          | 0x6D   | 0b01101101 | m        | Letra minúscula m                   |
| 110          | 0x6E   | 0b01101110 | n        | Letra minúscula n                   |
| 111          | 0x6F   | 0b01101111 | o        | Letra minúscula o                   |
| 112          | 0x70   | 0b01110000 | p        | Letra minúscula p                   |
| 113          | 0x71   | 0b01110001 | q        | Letra minúscula q                   |
| 114          | 0x72   | 0b01110010 | r        | Letra minúscula r                   |
| 115          | 0x73   | 0b01110011 | s        | Letra minúscula s                   |
| 116          | 0x74   | 0b01110100 | t        | Letra minúscula t                   |
| 117          | 0x75   | 0b01110101 | u        | Letra minúscula u                   |
| 118          | 0x76   | 0b01110110 | v        | Letra minúscula v                   |
| 119          | 0x77   | 0b01110111 | w        | Letra minúscula w                   |
| 120          | 0x78   | 0b01111000 | x        | Letra minúscula x                   |
| 121          | 0x79   | 0b01111001 | y        | Letra minúscula y                   |
| 122          | 0x7A   | 0b01111010 | z        | Letra minúscula z                   |
| 123          | 0x7B   | 0b01111011 | {        | Llave izquierda                     |
| 124          | 0x7C   | 0b01111100 | \|       | Barra vertical (pipe)               |
| 125          | 0x7D   | 0b01111101 | }        | Llave derecha                       |
| 126          | 0x7E   | 0b01111110 | ~        | Virgulilla (tilde)                  |
| 127          | 0x7F   | 0b01111111 | DEL      | Carácter de eliminación (delete)    |


#### c. ASCII Art

El **ASCII Art** es una forma de arte digital que utiliza caracteres ASCII para crear representaciones visuales de imágenes, objetos o escenas. Se basa en la disposición de caracteres alfanuméricos y símbolos disponibles en la tabla ASCII para formar patrones y figuras que, cuando se ven en un entorno de texto, crean una imagen o ilustración. Es una forma popular de expresión artística en los primeros días de la computación, especialmente cuando las capacidades gráficas eran limitadas.

Por ejemplo, un simple gato en ASCII podría verse como:

```
 /\_/\  
( o.o ) 
 > ^ <
```

Otro ejemplo sería un árbol navideño:

```
    *
   /o\
  /ooo\
 /ooooo\
/ooooooo\
    |
```

Para explorar más ejemplos y aprender sobre cómo crear tu propio arte ASCII, puedes visitar [ASCII Art.eu](https://www.asciiart.eu/), un sitio web dedicado a esta forma de arte.

---

### 6. Caracteres especiales

Los **caracteres especiales** son símbolos en texto que no representan un carácter visible directamente, sino que tienen un propósito funcional. Son esenciales para controlar el formato o la interpretación del texto y pueden variar según el sistema operativo.


#### a. El carácter de salto de línea (`newline`)

El salto de línea es uno de los caracteres especiales más comunes. Su propósito es indicar el final de una línea de texto y el comienzo de una nueva.

#### b. Representaciones principales del caracter salto de línea

1. **Linux/macOS:** Usa el carácter de nueva línea (`LF`, *Line Feed*), representado por:
   - **Hexadecimal:** `0x0A`
   - **Código ASCII:** 10
   - **Secuencia de escape en Python y otros lenguajes:** `\n`

2. **Windows:** Usa una combinación de dos caracteres, el retorno de carro seguido de nueva línea (`CR+LF`, *Carriage Return + Line Feed*):
   - **Hexadecimal:** `0x0D 0x0A`
   - **Códigos ASCII:** 13 (`CR`) seguido de 10 (`LF`)
   - **Secuencia de escape:** `\r\n`

#### c. Ejemplo de diferencias de representación del caracter salto de línea en distintos SO

- En **Linux/macOS**, un archivo de texto con tres líneas se vería así:
  ```
  Línea 1\n
  Línea 2\n
  Línea 3\n
  ```
- En **Windows**, se verá así:
  ```
  Línea 1\r\n
  Línea 2\r\n
  Línea 3\r\n
  ```

#### d. ¿Por qué existen estas diferencias?

La razón histórica está en los dispositivos mecánicos como las máquinas de escribir y las primeras impresoras:
- **`CR` (Carriage Return):** Mueve el "carro" de impresión al inicio de la línea.
- **`LF` (Line Feed):** Avanza el papel una línea hacia arriba.

Diferentes sistemas adoptaron maneras distintas de manejar los saltos de línea:
- **Unix/Linux/macOS:** Usaron solo `LF` para simplificar.
- **Windows (derivado de DOS):** Mantuvieron `CR+LF` para compatibilidad con terminales antiguas.


#### e. Otros caracteres especiales comunes

| **Carácter**      | **Secuencia** | **Descripción**                                       |
|-------------------|---------------|-------------------------------------------------------|
| Tabulación        | `\t`          | Inserta un espacio de tabulación (horizontal tab).    |
| Retorno de carro  | `\r`          | Mueve el cursor al inicio de la línea actual.         |
| Espacio           | `\s` (a veces)| Representa un espacio en blanco explícito.            |
| Comillas dobles   | `\"`          | Representa una comilla doble en un texto escapado.    |
| Comillas simples  | `\'`          | Representa una comilla simple en un texto escapado.   |
| Barra invertida   | `\\`          | Inserta un carácter de barra invertida (`\`).         |
