<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><body>
<h2>Publicaciones</h2>
<c:forEach var="post" items="${posts}">
    <div>
        <h3><a href="/post/details/${post.id}">${post.title}</a></h3>
        <p><strong>Categoría:</strong> ${post.category}</p>
        <p>${post.description}</p>
        <p><em>Publicado por ${post.author.name}</em></p>
        <c:if test="${post.author.id == sessionScope.usuario.id}">
            <a href="/post/edit/${post.id}">Editar</a>
        </c:if>
    </div>
</c:forEach>
<a href="/post/create">Agregar publicación</a>
<a href="/logout">Cerrar sesión</a>
</body></html>