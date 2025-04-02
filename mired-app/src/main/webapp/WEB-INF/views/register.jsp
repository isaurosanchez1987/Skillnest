<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><body>
<h2>Registro</h2>
<form method="post" action="/register">
    Nombre: <input type="text" name="name"/><br/>
    Email: <input type="email" name="email"/><br/>
    Contraseña: <input type="password" name="password"/><br/>
    <button type="submit">Registrar</button>
</form>
<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>
</body></html>