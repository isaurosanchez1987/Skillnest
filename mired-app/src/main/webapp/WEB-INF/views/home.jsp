<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>MiRed - Publicaciones</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary">📝 Publicaciones</h2>
        <div>
            <a href="/post/create" class="btn btn-success me-2">➕ Nueva publicación</a>
            <a href="/logout" class="btn btn-outline-danger">🚪 Cerrar sesión</a>
        </div>
    </div>

    <div class="row">
        <c:forEach var="post" items="${posts}">
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <h5 class="card-title text-primary">
                            <a href="/post_details/${post.id}" class="text-decoration-none">${post.title}</a>
                        </h5>
                        <h6 class="card-subtitle mb-2 text-muted">📂 ${post.category}</h6>
                        <p class="card-text">${post.description}</p>
                        <p class="text-end text-muted small">
                            Publicado por <strong>${post.author.name}</strong>
                        </p>
                        <c:if test="${post.author.id == sessionScope.usuario.id}">
                            <div class="d-flex justify-content-end gap-2">
                                <a href="/post_edit/${post.id}" class="btn btn-sm btn-outline-primary">✏️ Editar</a>
                                <form method="post" action="/post/delete/${post.id}">
                                    <button type="submit" class="btn btn-sm btn-outline-danger">🗑️ Eliminar</button>
                                </form>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
