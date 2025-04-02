<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><body>
<h2>Crear Publicación</h2>
<form method="post" action="/post/create">
    Título: <input type="text" name="title"/><br/>
    Categoría: <input type="text" name="category"/><br/>
    Descripción: <textarea name="description"></textarea><br/>
    <button type="submit">Publicar</button>
</form>
<c:if test="${not empty errors}">
    <p style="color:red">${errors}</p>
</c:if>
</body></html>