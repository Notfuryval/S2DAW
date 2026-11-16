-- Oracle. Ejecutar con el usuario de la práctica.
CREATE SEQUENCE seq_marca_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_categoria_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_producto_id START WITH 1 INCREMENT BY 1;

CREATE TABLE marca (
    id NUMBER,
    nombre VARCHAR2(120) NOT NULL,
    CONSTRAINT pk_marca PRIMARY KEY (id),
    CONSTRAINT uk_marca_nombre UNIQUE (nombre)
);

CREATE OR REPLACE TRIGGER seq_marca_id
BEFORE INSERT ON marca
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT seq_marca_id.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

CREATE TABLE categoria (
    id NUMBER,
    nombre VARCHAR2(120) NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (id),
    CONSTRAINT uk_categoria_nombre UNIQUE (nombre)
);


CREATE OR REPLACE TRIGGER seq_categoria_id
BEFORE INSERT ON categoria
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT seq_categoria_id.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

CREATE TABLE producto (
    id NUMBER,
    nombre VARCHAR2(180) NOT NULL,
    descripcion VARCHAR2(1200),
    precio NUMBER(10,2) NOT NULL,
    stock NUMBER(6) NOT NULL,
    imagen VARCHAR2(300) NOT NULL,
    marca_id NUMBER NOT NULL,
    categoria_id NUMBER NOT NULL,
    CONSTRAINT pk_producto PRIMARY KEY (id),
    CONSTRAINT ck_producto_precio CHECK (precio >= 0),
    CONSTRAINT ck_producto_stock CHECK (stock >= 0),
    CONSTRAINT fk_producto_marca FOREIGN KEY (marca_id) REFERENCES marca(id),
    CONSTRAINT fk_producto_categoria FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE OR REPLACE TRIGGER seq_producto_id
BEFORE INSERT ON producto
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT seq_producto_id.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Datos coherentes con las imágenes locales de assets/img/catalogo.
INSERT INTO marca (nombre) VALUES ('NovaTek');
INSERT INTO marca (nombre) VALUES ('Axion');
INSERT INTO marca (nombre) VALUES ('Luma');
INSERT INTO marca (nombre) VALUES ('Orbit');
INSERT INTO marca (nombre) VALUES ('Kairo');
INSERT INTO marca (nombre) VALUES ('Vertex');
INSERT INTO categoria (nombre) VALUES ('Ordenadores');
INSERT INTO categoria (nombre) VALUES ('Periféricos');
INSERT INTO categoria (nombre) VALUES ('Audio');
INSERT INTO categoria (nombre) VALUES ('Imagen');
INSERT INTO categoria (nombre) VALUES ('Redes y almacenamiento');
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('NovaBook Air 14', 'Portátil ligero para trabajo y estudio', 899.0, 12, '/assets/img/catalogo/novabook-air.webp', 1, 1);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('Axion Keys 75', 'Teclado mecánico compacto y silencioso', 109.9, 34, '/assets/img/catalogo/axion-keys.webp', 2, 2);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('Orbit Glide', 'Ratón ergonómico inalámbrico', 64.9, 41, '/assets/img/catalogo/orbit-glide.webp', 4, 2);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('LumaView 34', 'Monitor panorámico de alta resolución', 499.0, 9, '/assets/img/catalogo/lumaview-34.webp', 3, 4);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('Kairo Studio', 'Auriculares con cancelación activa', 189.0, 20, '/assets/img/catalogo/kairo-studio.webp', 5, 3);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('Vertex Cam Pro', 'Webcam 4K con encuadre automático', 139.0, 15, '/assets/img/catalogo/vertex-cam.webp', 6, 4);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('NovaTab 11', 'Tablet versátil con soporte magnético', 429.0, 17, '/assets/img/catalogo/novatab-11.webp', 1, 1);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('Axion Mini', 'Mini PC compacto para escritorio', 549.0, 11, '/assets/img/catalogo/axion-mini.webp', 2, 1);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('Luma Sound Pair', 'Altavoces activos de escritorio', 159.0, 22, '/assets/img/catalogo/luma-sound.webp', 3, 3);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('Orbit Voice', 'Micrófono USB para streaming', 119.0, 28, '/assets/img/catalogo/orbit-voice.webp', 4, 3);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('Kairo Mesh 6', 'Router WiFi de cobertura ampliada', 179.0, 19, '/assets/img/catalogo/kairo-mesh.webp', 5, 5);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('Vertex Pocket SSD', 'SSD externo resistente de 2 TB', 169.0, 30, '/assets/img/catalogo/vertex-ssd.webp', 6, 5);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('NovaView 27', 'Monitor IPS para productividad', 329.0, 14, '/assets/img/catalogo/novaview-27.webp', 1, 4);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('Axion Control', 'Mando inalámbrico multiplataforma', 79.0, 25, '/assets/img/catalogo/axion-control.webp', 2, 2);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('LumaVault 4', 'NAS doméstico de cuatro bahías', 599.0, 6, '/assets/img/catalogo/lumavault.webp', 3, 5);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('Orbit Vision', 'Visor de realidad virtual', 459.0, 8, '/assets/img/catalogo/orbit-vision.webp', 4, 4);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('Kairo Buds', 'Auriculares compactos con estuche', 99.0, 38, '/assets/img/catalogo/kairo-buds.webp', 5, 3);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('Vertex Lens', 'Cámara híbrida para creación de contenido', 749.0, 7, '/assets/img/catalogo/vertex-lens.webp', 6, 4);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('NovaBeam', 'Proyector compacto Full HD', 389.0, 10, '/assets/img/catalogo/novabeam.webp', 1, 4);
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, marca_id, categoria_id) VALUES ('Axion Watch', 'Reloj inteligente de autonomía extendida', 229.0, 24, '/assets/img/catalogo/axion-watch.webp', 2, 2);

COMMIT;