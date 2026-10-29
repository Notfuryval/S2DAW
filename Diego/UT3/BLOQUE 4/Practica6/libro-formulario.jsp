<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Nuevo libro</title>
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
  <div class="section-title"><div><p class="eyebrow">Gestión de catálogo</p><h1>Nuevo libro</h1><p class="muted">Completa los datos editoriales.</p></div></div>
  <section class="panel">
    <!-- TODO 1-10: completa destino, método y las dos listas de opciones. -->
    <form action="TODO_1" method="TODO_2">
      <div class="form-grid">
        <div class="field span-2"><label for="titulo">Título</label><input id="titulo" name="titulo" required maxlength="150" placeholder="Ej. Desarrollo web con Jakarta"></div>
        <div class="field"><label for="isbn">ISBN</label><input id="isbn" name="isbn" required pattern="[0-9-]{10,17}" placeholder="978-00-000000-0"></div>
        <div class="field"><label for="anio">Año</label><input id="anio" name="anio" type="number" min="1450" max="2100" required></div>
        <div class="field"><label for="precio">Precio</label><input id="precio" name="precio" type="number" min="0" step="0.01" required></div>
        <div class="field"><label for="autorId">Autor</label><select id="autorId" name="autorId" required><option value="">Selecciona un autor</option>
          <c:forEach var="TODO_3" items="${TODO_4}"><option value="${TODO_5}">${TODO_6}</option></c:forEach>
        </select></div>
        <div class="field"><label for="categoriaId">Categoría</label><select id="categoriaId" name="categoriaId" required><option value="">Selecciona una categoría</option>
          <c:forEach var="TODO_7" items="${TODO_8}"><option value="${TODO_9}">${TODO_10}</option></c:forEach>
        </select></div>
      </div>
      <div class="actions" style="margin-top:1.5rem"><button class="btn btn-primary" type="submit">Guardar libro</button><a class="btn btn-secondary" href="${pageContext.request.contextPath}/libros">Cancelar</a></div>
    </form>
  </section>
</main>
<footer class="footer">DWES · UT3 · JSP y MVC</footer>
</body>
</html>
