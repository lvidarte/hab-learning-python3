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
