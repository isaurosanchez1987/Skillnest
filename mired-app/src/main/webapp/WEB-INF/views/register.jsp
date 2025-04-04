<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro - MiRed</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <h2 class="text-center text-primary mb-4">👤 Registro de Usuario</h2>

    <div class="row justify-content-center">
        <div class="col-md-6">
            <form method="post" action="/register">
                <div class="mb-3">
                    <label for="name" class="form-label">Nombre completo:</label>
                    <input type="text" class="form-control" name="name" id="name" value="${userDTO.name}" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Correo electrónico:</label>
                    <input type="email" class="form-control" name="email" id="email" value="${userDTO.email}" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña:</label>
                    <input type="password" class="form-control" name="password" id="password" required>
                </div>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>

                <button type="submit" class="btn btn-success w-100">Registrarse</button>
                <div class="text-center mt-3">
                    ¿Ya tienes una cuenta? <a href="/login">Inicia sesión</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
