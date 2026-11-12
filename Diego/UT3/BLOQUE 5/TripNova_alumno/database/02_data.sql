-- Datos coherentes con las imágenes locales de assets/img/catalogo.
INSERT INTO tipo_destino (id, nombre) VALUES (1, 'Costa');
INSERT INTO tipo_destino (id, nombre) VALUES (2, 'Ciudad');
INSERT INTO tipo_destino (id, nombre) VALUES (3, 'Naturaleza');
INSERT INTO tipo_destino (id, nombre) VALUES (4, 'Aventura');
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (1, 'Costa de Brétema', 'España', 'Acantilados atlánticos y senderos sobre el océano', 645, 6, '/assets/img/catalogo/costa-bretema.webp', 1, 1);
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (2, 'Isla Calista', 'Grecia', 'Pueblos blancos, calas tranquilas y cocina mediterránea', 890, 7, '/assets/img/catalogo/isla-calista.webp', 1, 1);
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (3, 'Valle Dolena', 'Italia', 'Alpes, lagos y rutas panorámicas', 760, 6, '/assets/img/catalogo/valle-dolena.webp', 1, 3);
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (4, 'Praga Esencial', 'República Checa', 'Arquitectura, puentes y barrios históricos', 525, 4, '/assets/img/catalogo/praga-esencial.webp', 0, 2);
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (5, 'Bahía Moana', 'Polinesia', 'Arena blanca, laguna turquesa y descanso', 1490, 9, '/assets/img/catalogo/bahia-moana.webp', 1, 1);
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (6, 'Oasis de Tamer', 'Marruecos', 'Dunas, palmerales y noche en campamento', 620, 5, '/assets/img/catalogo/oasis-tamer.webp', 0, 4);
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (7, 'Aurora de Nordvik', 'Noruega', 'Fiordos nevados y observación de auroras', 1180, 6, '/assets/img/catalogo/aurora-nordvik.webp', 1, 4);
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (8, 'Ruta Volcánica', 'España', 'Paisajes volcánicos y costa de lava', 570, 5, '/assets/img/catalogo/ruta-volcanica.webp', 0, 4);
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (9, 'Lago Hallen', 'Austria', 'Pueblo alpino, navegación y senderismo', 680, 5, '/assets/img/catalogo/lago-hallen.webp', 0, 3);
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (10, 'Horizonte de Jade', 'China', 'Metrópolis, mercados y miradores nocturnos', 1290, 8, '/assets/img/catalogo/horizonte-jade.webp', 1, 2);
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (11, 'Refugio Tambora', 'Costa Rica', 'Selva, fauna y alojamiento sostenible', 1120, 8, '/assets/img/catalogo/refugio-tambora.webp', 0, 3);
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (12, 'Estocolmo Blanco', 'Suecia', 'Canales, diseño nórdico y ambiente invernal', 845, 5, '/assets/img/catalogo/estocolmo-blanco.webp', 0, 2);
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (13, 'Cañón del Sol', 'Estados Unidos', 'Carretera escénica y grandes paisajes', 980, 7, '/assets/img/catalogo/canon-sol.webp', 0, 4);
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (14, 'Colinas de Valdoro', 'Italia', 'Viñedos, pueblos de piedra y gastronomía', 735, 6, '/assets/img/catalogo/valdoro.webp', 1, 3);
INSERT INTO destino (id, nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES (15, 'Murallas de Adria', 'Croacia', 'Ciudad costera amurallada y mar transparente', 795, 6, '/assets/img/catalogo/murallas-adria.webp', 0, 2);

COMMIT;
