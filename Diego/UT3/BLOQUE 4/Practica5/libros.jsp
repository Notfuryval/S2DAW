<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Biblioteca</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
</head>
<body>

<header class="site-header">
  <nav class="nav">
    <a class="brand" href="${pageContext.request.contextPath}/libros">
      <span class="brand-mark">B</span><span>Biblioteca Aula</span>
    </a>
    <div class="nav-links">
      <a class="btn btn-secondary" href="${pageContext.request.contextPath}/libros">Colección</a>
      <a class="btn btn-primary" href="${pageContext.request.contextPath}/libros/nuevo">+ Nuevo libro</a>
    </div>
  </nav>
</header>
<main class="container page">
  <section class="hero compact">
    <div>
      <p class="eyebrow">Tu colección</p>
      <h1>Historias, ideas y código</h1>
      <p>Consulta los libros disponibles y abre su ficha completa.</p>
      <form class="search" action="${pageContext.request.contextPath}/libros" method="get">
        <input type="search" name="q" placeholder="Buscar por título..." aria-label="Buscar por título">
        <button class="btn btn-secondary" type="submit">Buscar</button>
      </form>
    </div>
    <img class="hero-art" src="${pageContext.request.contextPath}/assets/img/welcome-code.svg" alt="Biblioteca digital">
  </section>
  <div class="section-title"><div><p class="eyebrow">Catálogo</p><h2>${libros.size()} libros disponibles</h2></div></div>
  <!-- TODO 1-9: completa condiciones, colección, variable, propiedades y enlaces dinámicos. -->
  <c:if test="${TODO_8}">
    <section class="grid">
      <c:forEach var="TODO_1" items="${TODO_2}" varStatus="estado">
        <article class="panel book-card">
          <img class="book-cover" src="${pageContext.request.contextPath}/assets/img/${estado.index % 2 == 0 ? 'cover-jsp-mvc.svg' : 'cover-jdbc-dao.svg'}" alt="Portada decorativa de ${TODO_4}">
          <div class="book-body">
            <span class="badge">${TODO_3}</span>
            <h3>${TODO_4}</h3>
            <div class="meta"><span>${TODO_5}</span><span>Publicado en ${TODO_6}</span></div>
            <div class="card-actions">
              <a class="btn btn-primary" href="${pageContext.request.contextPath}/libro?id=${TODO_7}">Ver</a>
              <a class="btn btn-secondary" href="${pageContext.request.contextPath}/libros/editar?id=${TODO_7}">Editar</a>
            </div>
          </div>
        </article>
      </c:forEach>
    </section>
  </c:if>
  <c:if test="${TODO_9}">
    <section class="empty">
      <img src="${pageContext.request.contextPath}/assets/img/empty-library.svg" alt="Estantería sin libros">
      <h2>La biblioteca está esperando su primer libro</h2>
      <p class="muted">Añade un título para comenzar la colección.</p>
      <a class="btn btn-primary" href="${pageContext.request.contextPath}/libros/nuevo">Añadir libro</a>
    </section>
  </c:if>
</main>
<footer class="footer">DWES · UT3 · JSP y MVC</footer>
</body>
</html>
