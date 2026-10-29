# Proyecto de trabajo — UT3 Bloque 3

Este proyecto parte de los DAO y la base de datos de UT2. La novedad es que ahora un servlet llama al DAO y coloca el resultado en la petición para que una JSP preparada genere el HTML.

## Objetivo

Completar el recorrido:

```text
Navegador
  -> LibroServlet
  -> LibroDAO
  -> ConnectionFactory
  -> Oracle
  -> List<Libro> o Libro
  -> request.setAttribute(...)
  -> forward(...)
  -> JSP
  -> HTML
```

## Orden recomendado

1. Completa `LibroDAO.findAll()` y `mapearLibro()`.
2. Completa `LibroServlet.listar()` y prueba `/libros`.
3. Completa `findById()` y `detalle()`.
4. Completa la preparación de catálogos y los formularios GET.
5. Completa `insert()` y `crear()`.
6. Completa `update()` y `actualizar()`.
7. Completa `delete()` y `eliminar()`.

La guía detallada está en `GUIA_TODO.md`. Las JSP, el CSS, las imágenes, los modelos, `ConnectionFactory`, `AutorDAO` y `CategoriaDAO` ya están preparados.

