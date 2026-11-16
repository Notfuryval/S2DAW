-- Oracle. Ejecutar con el usuario de la práctica.
CREATE SEQUENCE seq_tipo_destino_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_destino_id START WITH 1 INCREMENT BY 1;

CREATE TABLE tipo_destino (
    id NUMBER,
    nombre VARCHAR2(120) NOT NULL,
    CONSTRAINT pk_tipo_destino PRIMARY KEY (id),
    CONSTRAINT uk_tipo_destino_nombre UNIQUE (nombre)
);

CREATE OR REPLACE TRIGGER seq_tipo_destino_id
BEFORE INSERT ON tipo_destino
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT seq_tipo_destino_id.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

CREATE TABLE destino (
    id NUMBER,
    nombre VARCHAR2(150) NOT NULL,
    pais VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(1000),
    precio_desde NUMBER(9,2) NOT NULL,
    dias NUMBER(3) NOT NULL,
    imagen VARCHAR2(300) NOT NULL,
    destacado NUMBER(1) DEFAULT 0 NOT NULL,
    tipo_id NUMBER NOT NULL,
    CONSTRAINT pk_destino PRIMARY KEY (id),
    CONSTRAINT ck_destino_precio_desde CHECK (precio_desde >= 0),
    CONSTRAINT ck_destino_dias CHECK (dias >= 0),
    CONSTRAINT ck_destino_destacado CHECK (destacado IN (0,1)),
    CONSTRAINT fk_destino_tipo FOREIGN KEY (tipo_id) REFERENCES tipo_destino(id)
);

CREATE OR REPLACE TRIGGER seq_destino_id
BEFORE INSERT ON destino
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT seq_destino_id.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Datos coherentes con las imágenes locales de assets/img/catalogo.
INSERT INTO tipo_destino (nombre) VALUES ('Costa');
INSERT INTO tipo_destino (nombre) VALUES ('Ciudad');
INSERT INTO tipo_destino (nombre) VALUES ('Naturaleza');
INSERT INTO tipo_destino (nombre) VALUES ('Aventura');
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Costa de Brétema', 'España', 'Acantilados atlánticos y senderos sobre el océano', 645, 6, '/assets/img/catalogo/costa-bretema.webp', 1, 1);
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Isla Calista', 'Grecia', 'Pueblos blancos, calas tranquilas y cocina mediterránea', 890, 7, '/assets/img/catalogo/isla-calista.webp', 1, 1);
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Valle Dolena', 'Italia', 'Alpes, lagos y rutas panorámicas', 760, 6, '/assets/img/catalogo/valle-dolena.webp', 1, 3);
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Praga Esencial', 'República Checa', 'Arquitectura, puentes y barrios históricos', 525, 4, '/assets/img/catalogo/praga-esencial.webp', 0, 2);
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Bahía Moana', 'Polinesia', 'Arena blanca, laguna turquesa y descanso', 1490, 9, '/assets/img/catalogo/bahia-moana.webp', 1, 1);
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Oasis de Tamer', 'Marruecos', 'Dunas, palmerales y noche en campamento', 620, 5, '/assets/img/catalogo/oasis-tamer.webp', 0, 4);
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Aurora de Nordvik', 'Noruega', 'Fiordos nevados y observación de auroras', 1180, 6, '/assets/img/catalogo/aurora-nordvik.webp', 1, 4);
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Ruta Volcánica', 'España', 'Paisajes volcánicos y costa de lava', 570, 5, '/assets/img/catalogo/ruta-volcanica.webp', 0, 4);
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Lago Hallen', 'Austria', 'Pueblo alpino, navegación y senderismo', 680, 5, '/assets/img/catalogo/lago-hallen.webp', 0, 3);
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Horizonte de Jade', 'China', 'Metrópolis, mercados y miradores nocturnos', 1290, 8, '/assets/img/catalogo/horizonte-jade.webp', 1, 2);
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Refugio Tambora', 'Costa Rica', 'Selva, fauna y alojamiento sostenible', 1120, 8, '/assets/img/catalogo/refugio-tambora.webp', 0, 3);
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Estocolmo Blanco', 'Suecia', 'Canales, diseño nórdico y ambiente invernal', 845, 5, '/assets/img/catalogo/estocolmo-blanco.webp', 0, 2);
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Cañón del Sol', 'Estados Unidos', 'Carretera escénica y grandes paisajes', 980, 7, '/assets/img/catalogo/canon-sol.webp', 0, 4);
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Colinas de Valdoro', 'Italia', 'Viñedos, pueblos de piedra y gastronomía', 735, 6, '/assets/img/catalogo/valdoro.webp', 1, 3);
INSERT INTO destino (nombre, pais, descripcion, precio_desde, dias, imagen, destacado, tipo_id) VALUES ('Murallas de Adria', 'Croacia', 'Ciudad costera amurallada y mar transparente', 795, 6, '/assets/img/catalogo/murallas-adria.webp', 0, 2);

COMMIT;