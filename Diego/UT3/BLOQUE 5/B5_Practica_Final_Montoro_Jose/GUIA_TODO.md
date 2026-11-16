# StayNest

Objetivo: Integración autónoma de CRUD, dos relaciones, método privado de mapeo, DAO, MVC, imágenes y pruebas completas.

## Secuencia de trabajo

1. Instala la base de datos con database/01_schema.sql y database/02_data.sql.
2. Configura DB_URL, DB_USER y DB_PASSWORD o adapta ConnectionFactory.
3. Importa el proyecto Maven y asígnalo a Tomcat 10.1.
4. Completa los TODO por orden. No modifiques la maquetación ni las clases CSS.
5. Prueba listado con datos, listado vacío, detalle válido, id inexistente e id no numérico.
6. Prueba un alta correcta y otra con campos obligatorios ausentes; confirma el redirect.
7. Edita el registro, cambia la relación y comprueba que el id viaja en un campo hidden.
8. Elimina solo mediante POST y comprueba el comportamiento ante claves foráneas.
