<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Detalle de libro</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
</head>
<body>

<header class="site-header">
  <nav class="nav">
    <a class="brand" href="${TODO_8}/libros">
      <span class="brand-mark">B</span><span>Biblioteca Aula</span>
    </a>
    <div class="nav-links">
      <a class="btn btn-secondary" href="${TODO_8}/libros">Colección</a>
      <a class="btn btn-primary" href="${TODO_8}/libros/nuevo">+ Nuevo libro</a>
    </div>
  </nav>
</header>
<main class="container page">
  <p class="eyebrow">Ficha editorial</p>
  <section class="panel detail">
    <img class="detail-cover" src="${pageContext.request.contextPath}/assets/img/book-placeholder.svg" alt="Portada ficticia del libro">
    <div>
      <!-- TODO 1-7: completa las propiedades del objeto libro y el id del enlace Editar. -->
      <span class="badge">${TODO_1}</span>
      <h1>${TODO_2}</h1>
      <p class="muted">de <strong>${TODO_3}</strong></p>
      <dl class="definition-list">
        <dt>ISBN</dt><dd>${TODO_4}</dd>
        <dt>Año</dt><dd>${TODO_5}</dd>
        <dt>Precio</dt><dd class="price">${TODO_6} €</dd>
      </dl>
      <div class="actions" style="margin-top:1.5rem">
        <a class="btn btn-secondary" href="${TODO_8}/libros">← Volver</a>
        <a class="btn btn-primary" href="${TODO_8}/libros/editar?id=${TODO_7}">Editar</a>
      </div>
    </div>
  </section>
</main>
<footer class="footer">DWES · UT3 · JSP y MVC</footer>
</body>
</html>
