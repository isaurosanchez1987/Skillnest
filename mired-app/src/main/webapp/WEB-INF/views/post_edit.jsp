<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><body>
<h2>Editar Publicación</h2>
<form method="post" action="/post/edit/${post.id}">
    Título: <input type="text" name="title" value="${post.title}"/><br/>
    Categoría: <input type="text" name="category" value="${post.category}"/><br/>
    Descripción: <textarea name="description">${post.description}</textarea><br/>
    <button type="submit">Actualizar</button>
</form>
<a href="/home">Cancelar</a>
</body></html>