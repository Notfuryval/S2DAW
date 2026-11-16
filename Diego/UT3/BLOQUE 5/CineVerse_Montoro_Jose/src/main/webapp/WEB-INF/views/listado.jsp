<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html><html lang="es"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>CineVerse</title><link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css"></head><body>
<header class="navbar"><div class="container"><a class="brand" href="${pageContext.request.contextPath}/peliculas">CineVerse</a>
<nav class="navlinks"><a href="${pageContext.request.contextPath}/peliculas">Catálogo</a></nav></div></header><main>
<section class="hero"><div class="container"><div class="hero__content"><span class="eyebrow">Catálogo</span><h1>Historias que ocupan toda la pantalla</h1><p>UPDATE: cargar el registro, reutilizar formulario, conservar ID y actualizar con POST.</p><a class="btn btn--primary" href="#catalogo">Explorar</a></div></div></section>
<section class="section section--white" id="catalogo"><div class="container"><div class="section-head"><div><span class="eyebrow">Selección</span><h2>Descubre el catálogo</h2></div></div>
<%-- TODO 1-9: completa variable, colección, imagen, título, descripción, distintivo, metadato, id y precio cuando exista. --%>
<div class="grid"><c:if test="${empty TODO_2}"><div class="empty"><h3>No hay resultados</h3><p>La interfaz está preparada para representar una colección vacía.</p></div></c:if>
<c:forEach var="TODO_1" items="${TODO_2}"><article class="card">
<img class="card__image poster" src="${pageContext.request.contextPath}${TODO_3}" alt="${TODO_4}">
<div class="card__body"><span class="badge">${TODO_6}</span><h3>${TODO_4}</h3><p>${TODO_5}</p><div class="meta"><span>${TODO_7}</span></div>
<div class="card__footer"><strong class="price">Cartelera</strong><a class="btn btn--ghost" href="${pageContext.request.contextPath}/peliculas?accion=detalle&amp;id=${TODO_8}">Ver detalle</a></div></div></article></c:forEach></div></div></section>
</main><footer><div class="container"><strong>CineVerse</strong><p>Historias que ocupan toda la pantalla. Proyecto académico DWES.</p></div></footer></body></html>
