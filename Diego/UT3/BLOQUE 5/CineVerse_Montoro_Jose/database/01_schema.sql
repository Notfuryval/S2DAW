-- Oracle. Ejecutar con el usuario de la práctica.
CREATE SEQUENCE seq_genero_id START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_pelicula_id START WITH 1 INCREMENT BY 1;

CREATE TABLE genero (
    id NUMBER,
    nombre VARCHAR2(120) NOT NULL,
    CONSTRAINT pk_genero PRIMARY KEY (id),
    CONSTRAINT uk_genero_nombre UNIQUE (nombre)
);

CREATE OR REPLACE TRIGGER seq_genero_id
BEFORE INSERT ON genero
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT seq_genero_id.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

CREATE TABLE pelicula (
    id NUMBER,
    titulo VARCHAR2(180) NOT NULL,
    sinopsis VARCHAR2(1200),
    duracion NUMBER(4) NOT NULL,
    anio NUMBER(4) NOT NULL,
    clasificacion VARCHAR2(20) NOT NULL,
    imagen VARCHAR2(300) NOT NULL,
    genero_id NUMBER NOT NULL,
    CONSTRAINT pk_pelicula PRIMARY KEY (id),
    CONSTRAINT ck_pelicula_duracion CHECK (duracion >= 0),
    CONSTRAINT ck_pelicula_anio CHECK (anio >= 0),
    CONSTRAINT fk_pelicula_genero FOREIGN KEY (genero_id) REFERENCES genero(id)
);

CREATE OR REPLACE TRIGGER seq_pelicula_id
BEFORE INSERT ON pelicula
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT seq_pelicula_id.NEXTVAL INTO :NEW.id FROM DUAL;
    END IF;
END;
/

-- Datos coherentes con las imágenes locales de assets/img/catalogo.
INSERT INTO genero (nombre) VALUES ('Ciencia ficción');
INSERT INTO genero (nombre) VALUES ('Drama');
INSERT INTO genero (nombre) VALUES ('Comedia');
INSERT INTO genero (nombre) VALUES ('Animación');
INSERT INTO genero (nombre) VALUES ('Thriller');
INSERT INTO genero (nombre) VALUES ('Aventura');
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('Órbita Cero', 'Una estación escucha una señal imposible', 128, 2026, '+12', '/assets/img/catalogo/orbita-cero.webp', 1);
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('El Lago Quieto', 'Dos desconocidos comparten un verano decisivo', 112, 2025, '+7', '/assets/img/catalogo/lago-quieto.webp', 2);
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('Kilómetros de Alegría', 'Un perro convierte un viaje familiar en una aventura', 98, 2026, 'TP', '/assets/img/catalogo/kilometros-alegria.webp', 3);
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('Islas del Cielo', 'Una aprendiz busca una ciudad suspendida', 105, 2025, 'TP', '/assets/img/catalogo/islas-cielo.webp', 4);
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('La Puerta', 'Una luz al final de la escalera cambia cada noche', 101, 2026, '+16', '/assets/img/catalogo/la-puerta.webp', 5);
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('Bajo el Abismo', 'Una expedición descubre vida en una fosa oceánica', 119, 2024, '+12', '/assets/img/catalogo/bajo-abismo.webp', 1);
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('Ciudad de Lluvia', 'Un detective sigue una pista entre neones', 116, 2025, '+16', '/assets/img/catalogo/ciudad-lluvia.webp', 5);
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('Arena del Tiempo', 'Una viajera cruza un desierto que altera los recuerdos', 124, 2026, '+12', '/assets/img/catalogo/arena-tiempo.webp', 6);
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('Templos de Niebla', 'Un cartógrafo busca un valle borrado de los mapas', 132, 2025, '+12', '/assets/img/catalogo/templos-niebla.webp', 6);
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('Planeta Rojo', 'La primera colonia debe elegir entre partir o resistir', 137, 2026, '+12', '/assets/img/catalogo/planeta-rojo.webp', 1);
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('Último Paso', 'Una bailarina vuelve al escenario tras una lesión', 109, 2024, 'TP', '/assets/img/catalogo/ultimo-paso.webp', 2);
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('Lumi', 'Una niña conoce a una criatura nacida de la luz', 96, 2026, 'TP', '/assets/img/catalogo/lumi.webp', 4);
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('Después del Puente', 'Supervivientes recorren una ciudad recuperada por la naturaleza', 121, 2025, '+16', '/assets/img/catalogo/despues-puente.webp', 5);
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('Atardecer en Liria', 'Dos vidas coinciden durante una sola tarde', 103, 2024, '+7', '/assets/img/catalogo/atardecer-liria.webp', 2);
INSERT INTO pelicula (titulo, sinopsis, duracion, anio, clasificacion, imagen, genero_id) VALUES ('Cumbre Norte', 'Un montañero afronta su ruta más difícil', 114, 2025, '+12', '/assets/img/catalogo/cumbre-norte.webp', 6);

COMMIT;