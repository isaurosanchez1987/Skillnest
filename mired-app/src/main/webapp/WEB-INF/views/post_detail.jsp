<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><body>
<h2>Detalle de Publicación</h2>
<h3>${post.title}</h3>
<p><strong>Categoría:</strong> ${post.category}</p>
<p>${post.description}</p>
<c:if test="${post.author.id == sessionScope.usuario.id}">
    <form method="post" action="/post/delete/${post.id}">
        <button type="submit">Eliminar</button>
    </form>
    <a href="/post/edit/${post.id}">Editar</a>
</c:if>
<a href="/home">Volver</a>
</body></html>