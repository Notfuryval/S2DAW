-- Oracle. Ejecutar con el usuario de la práctica.
CREATE SEQUENCE seq_localidad_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_tipo_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_alojamiento_id START WITH 1 INCREMENT BY 1;

CREATE TABLE localidad (
    id NUMBER,
    nombre VARCHAR2(120) NOT NULL,
    CONSTRAINT pk_localidad PRIMARY KEY (id),
    CONSTRAINT uk_localidad_nombre UNIQUE (nombre)
);

CREATE OR REPLACE TRIGGER seq_localidad_id
BEFORE INSERT ON localidad
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT seq_localidad_id.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

CREATE TABLE tipo (
    id NUMBER,
    nombre VARCHAR2(120) NOT NULL,
    CONSTRAINT pk_tipo PRIMARY KEY (id),
    CONSTRAINT uk_tipo_nombre UNIQUE (nombre)
);

CREATE OR REPLACE TRIGGER seq_tipo_id
BEFORE INSERT ON tipo
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT seq_tipo_id.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

CREATE TABLE alojamiento (
    id NUMBER,
    nombre VARCHAR2(180) NOT NULL,
    descripcion VARCHAR2(1200),
    precio_noche NUMBER(9,2) NOT NULL,
    capacidad NUMBER(2) NOT NULL,
    imagen VARCHAR2(300) NOT NULL,
    destacado NUMBER(1) DEFAULT 0 NOT NULL,
    localidad_id NUMBER NOT NULL,
    tipo_id NUMBER NOT NULL,
    CONSTRAINT pk_alojamiento PRIMARY KEY (id),
    CONSTRAINT ck_alojamiento_precio_noche CHECK (precio_noche >= 0),
    CONSTRAINT ck_alojamiento_capacidad CHECK (capacidad >= 0),
    CONSTRAINT ck_alojamiento_destacado CHECK (destacado IN (0,1)),
    CONSTRAINT fk_alojamiento_localidad FOREIGN KEY (localidad_id) REFERENCES localidad(id),
    CONSTRAINT fk_alojamiento_tipo FOREIGN KEY (tipo_id) REFERENCES tipo(id)
);

CREATE OR REPLACE TRIGGER seq_alojamiento_id
BEFORE INSERT ON alojamiento
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT seq_alojamiento_id.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Datos coherentes con las imágenes locales de assets/img/catalogo.
INSERT INTO localidad (nombre) VALUES ('Puerto Ámbar');
INSERT INTO localidad (nombre) VALUES ('Valle Niebla');
INSERT INTO localidad (nombre) VALUES ('Ciudad Lumen');
INSERT INTO localidad (nombre) VALUES ('Sierra Clara');
INSERT INTO localidad (nombre) VALUES ('Ribera Azul');
INSERT INTO localidad (nombre) VALUES ('Campo Serena');
INSERT INTO localidad (nombre) VALUES ('Costa Dorada');
INSERT INTO localidad (nombre) VALUES ('Bosque Alto');
INSERT INTO tipo (nombre) VALUES ('Apartamento');
INSERT INTO tipo (nombre) VALUES ('Villa');
INSERT INTO tipo (nombre) VALUES ('Cabaña');
INSERT INTO tipo (nombre) VALUES ('Casa rural');
INSERT INTO tipo (nombre) VALUES ('Loft');
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Ático Lumen', 'Vistas urbanas, terraza y diseño contemporáneo', 145, 4, '/assets/img/catalogo/atico-lumen.webp', 1, 3, 1);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Villa Horizonte', 'Piscina infinita y acceso a una cala tranquila', 310, 8, '/assets/img/catalogo/villa-horizonte.webp', 1, 7, 2);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Cabaña Pico Norte', 'Madera, cristal y senderos desde la puerta', 175, 5, '/assets/img/catalogo/cabana-pico.webp', 1, 4, 3);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Casa del Jardín', 'Piedra, jardín privado y ritmo rural', 130, 6, '/assets/img/catalogo/casa-jardin.webp', 0, 6, 4);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Loft de la Fábrica', 'Espacio industrial restaurado en el centro', 118, 3, '/assets/img/catalogo/loft-fabrica.webp', 0, 3, 5);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Refugio Esmeralda', 'Alojamiento sostenible dentro del bosque', 165, 4, '/assets/img/catalogo/refugio-esmeralda.webp', 1, 8, 3);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Casa del Lago', 'Terraza sobre el agua y embarcadero privado', 220, 6, '/assets/img/catalogo/casa-lago.webp', 1, 5, 4);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Apartamento Marina', 'Luz mediterránea y paseo marítimo cercano', 135, 4, '/assets/img/catalogo/apartamento-marina.webp', 0, 1, 1);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Villa Calma', 'Piscina, porche y vistas abiertas al mar', 285, 7, '/assets/img/catalogo/villa-calma.webp', 1, 7, 2);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Cabaña del Pinar', 'Arquitectura moderna entre pinos', 155, 4, '/assets/img/catalogo/cabana-pinar.webp', 0, 8, 3);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Casa Serena', 'Casa tradicional con huerto y chimenea', 125, 6, '/assets/img/catalogo/casa-serena.webp', 0, 6, 4);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Loft Mirador', 'Doble altura y grandes ventanales', 140, 3, '/assets/img/catalogo/loft-mirador.webp', 0, 3, 5);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Refugio Ribera', 'Cabaña junto al agua para dos', 112, 2, '/assets/img/catalogo/refugio-ribera.webp', 0, 5, 3);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Villa Olivar', 'Piedra contemporánea, piscina y olivos', 260, 8, '/assets/img/catalogo/villa-olivar.webp', 1, 6, 2);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Ático Central', 'Apartamento luminoso cerca del distrito cultural', 150, 4, '/assets/img/catalogo/atico-central.webp', 0, 3, 1);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Terraza del Sol', 'Villa escalonada sobre el Mediterráneo', 295, 6, '/assets/img/catalogo/terraza-sol.webp', 1, 7, 2);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Cabaña Granito', 'Refugio alpino con salón panorámico', 185, 5, '/assets/img/catalogo/cabana-granito.webp', 0, 4, 3);
INSERT INTO alojamiento (nombre, descripcion, precio_noche, capacidad, imagen, destacado, localidad_id, tipo_id) VALUES ('Casa del Fuego', 'Casa rural cálida para reuniones familiares', 160, 7, '/assets/img/catalogo/casa-fuego.webp', 0, 2, 4);

COMMIT;