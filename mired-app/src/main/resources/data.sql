-- Usuarios
INSERT INTO user (id, name, email, password) VALUES
(1, 'Juan Pérez', 'juan@example.com', '$2a$10$wH1zZkNqLTG0QeZsQv6fWuUL0N3ZFdKcuLuM1VJHbZlMHwA6HRPM6'), -- contraseña: 123456
(2, 'Ana Torres', 'ana@example.com', '$2a$10$wH1zZkNqLTG0QeZsQv6fWuUL0N3ZFdKcuLuM1VJHbZlMHwA6HRPM6'), -- contraseña: 123456
(3, 'Luis Gómez', 'luis@example.com', '$2a$10$wH1zZkNqLTG0QeZsQv6fWuUL0N3ZFdKcuLuM1VJHbZlMHwA6HRPM6'); -- contraseña: 123456

-- Publicaciones
INSERT INTO post (id, title, category, description, created_at, author_id) VALUES
(1, 'Mi primera publicación', 'General', '¡Hola a todos!', NOW(), 1),
(2, 'Consejo de estudio', 'Educación', 'Organiza tu tiempo y verás los resultados.', NOW(), 2),
(3, 'Me encanta programar', 'Tecnología', 'Spring Boot + JSP es genial', NOW(), 3);

-- Amistades
INSERT INTO friendship (id, requester_id, receiver_id, status) VALUES
(1, 1, 2, 'ACCEPTED'),
(2, 1, 3, 'PENDING'),
(3, 2, 3, 'ACCEPTED');