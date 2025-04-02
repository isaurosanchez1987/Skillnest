<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><body>
<h2>Login</h2>
<form method="post" action="/login">
    Correo: <input type="text" name="username"/><br/>
    Contraseña: <input type="password" name="password"/><br/>
    <button type="submit">Login</button>
</form>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>
</body></html>
