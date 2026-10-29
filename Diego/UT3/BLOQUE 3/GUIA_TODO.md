# Guía de tareas

No cambies la arquitectura ni añadas paquetes nuevos. Trabaja únicamente sobre `dao/LibroDAO.java` y `controller/LibroServlet.java`.

## DAO

- `D1`: ejecutar el SELECT completo y devolver todos los libros.
- `D2`: buscar un libro por `ID_LIBRO` utilizando `PreparedStatement`.
- `D3`: implementar el INSERT con los seis parámetros del formulario.
- `D4`: implementar el UPDATE y añadir el identificador como séptimo parámetro.
- `D5`: implementar el DELETE por identificador.
- `D6`: transformar una fila del `ResultSet` en `Libro`, `Autor` y `Categoria`.
- `D7`: centralizar la asignación de los parámetros compartidos por INSERT y UPDATE.

## Controller

- `C1`: obtener la lista del DAO, guardarla como atributo `libros` y hacer forward.
- `C2`: leer `id`, consultar el DAO, controlar el caso inexistente y enviar `libro`.
- `C3`: cargar autores y categorías para el formulario de alta.
- `C4`: recuperar el libro y cargar los catálogos para el formulario de edición.
- `C5`: construir un `Libro` con los parámetros y llamar a `insert()`.
- `C6`: construir un `Libro` con identificador y llamar a `update()`.
- `C7`: leer el identificador y llamar a `delete()`.
- `C8`: publicar `autores` y `categorias` en la petición.
- `C9`: convertir los parámetros del formulario al modelo Java.

## Pruebas mínimas

```text
GET  /libros
GET  /libros?accion=detalle&id=1
GET  /libros?accion=nuevo
GET  /libros?accion=editar&id=1
POST /libros  accion=crear
POST /libros  accion=actualizar
POST /libros  accion=eliminar
```

Después de una escritura correcta debe realizarse un redirect a `/libros`.

