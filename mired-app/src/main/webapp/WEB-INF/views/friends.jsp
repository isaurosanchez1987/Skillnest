<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><body>
<h2>Amistades</h2>

<form method="get" action="/friends">
    Buscar usuarios: <input type="text" name="search"/>
    <button type="submit">Buscar</button>
</form>

<h3>Usuarios encontrados</h3>
<c:forEach var="user" items="${results}">
    <form method="post" action="/friends/send/${user.id}">
        ${user.name}
        <button type="submit">Enviar solicitud</button>
    </form>
</c:forEach>

<h3>Solicitudes pendientes</h3>
<c:forEach var="sol" items="${pending}">
    ${sol.requester.name}
    <form method="post" action="/friends/accept/${sol.id}">
        <button type="submit">Aceptar</button>
    </form>
    <form method="post" action="/friends/reject/${sol.id}">
        <button type="submit">Rechazar</button>
    </form>
</c:forEach>

<h3>Amigos actuales</h3>
<c:forEach var="f" items="${friends}">
    <c:choose>
        <c:when test="${f.requester.id == sessionScope.usuario.id}">
            ${f.receiver.name}
        </c:when>
        <c:otherwise>
            ${f.requester.name}
        </c:otherwise>
    </c:choose>
    <form method="post" action="/friends/delete/${f.id}">
        <button type="submit">Eliminar</button>
    </form>
</c:forEach>
</body></html>