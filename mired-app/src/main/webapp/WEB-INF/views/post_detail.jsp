<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalle de publicación</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="mb-4">
        <a href="/home" class="btn btn-outline-secondary">⬅️ Volver</a>
    </div>

    <div class="card shadow">
        <div class="card-header bg-primary text-white">
            <h3 class="mb-0">${post.title}</h3>
        </div>
        <div class="card-body">
            <p><strong>Categoría:</strong> ${post.category}</p>
            <p>${post.description}</p>
            <p><em>Publicado por: ${post.author.name}</em></p>

            <c:if test="${post.author.id == sessionScope.usuario.id}">
                <form method="post" action="/post/delete/${post.id}" class="d-inline">
                    <button type="submit" class="btn btn-danger">🗑️ Eliminar</button>
                </form>
                <a href="/post_edit/${post.id}" class="btn btn-warning ms-2">✏️ Editar</a>
            </c:if>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
