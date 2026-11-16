package dao;

import conexion.ConnectionFactory;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Alojamiento;
import model.Localidad;
import model.Tipo;

public class AlojamientoDAO {
    private static final String SELECT_ALL = "SELECT e.id AS entity_id, e.nombre AS entity_nombre, e.descripcion AS entity_descripcion, e.precio_noche AS entity_precio_noche, e.capacidad AS entity_capacidad, e.imagen AS entity_imagen, e.destacado AS entity_destacado, r1.id AS localidad_id, r1.nombre AS localidad_nombre, r2.id AS tipo_id, r2.nombre AS tipo_nombre FROM alojamiento e JOIN localidad r1 ON r1.id = e.localidad_id JOIN tipo r2 ON r2.id = e.tipo_id ORDER BY e.id";
    private static final String SELECT_ONE = "SELECT e.id AS entity_id, e.nombre AS entity_nombre, e.descripcion AS entity_descripcion, e.precio_noche AS entity_precio_noche, e.capacidad AS entity_capacidad, e.imagen AS entity_imagen, e.destacado AS entity_destacado, r1.id AS localidad_id, r1.nombre AS localidad_nombre, r2.id AS tipo_id, r2.nombre AS tipo_nombre FROM alojamiento e JOIN localidad r1 ON r1.id = e.localidad_id JOIN tipo r2 ON r2.id = e.tipo_id WHERE e.id = ?";
    public List<Alojamiento> findAll() throws SQLException {
        // TODO 1: ejecuta el SELECT con JOIN, recorre ResultSet y utiliza mapearAlojamiento(...).
        throw new UnsupportedOperationException("Pendiente findAll");
    }
    public Optional<Alojamiento> findById(int id) throws SQLException {
        // TODO 2: consulta por id y devuelve Optional.empty() si no existe.
        throw new UnsupportedOperationException("Pendiente findById");
    }
    public void insert(Alojamiento alojamiento) throws SQLException {
        // TODO 3: prepara INSERT, asigna todos los parámetros en el mismo orden y ejecuta.
        throw new UnsupportedOperationException("Pendiente insert");
    }
    public void update(Alojamiento alojamiento) throws SQLException {
        // TODO 4: ejecuta UPDATE, conserva el id para la cláusula WHERE.
        throw new UnsupportedOperationException("Pendiente update");
    }
    public void delete(int id) throws SQLException {
        // TODO 5: elimina por id mediante PreparedStatement.
        throw new UnsupportedOperationException("Pendiente delete");
    }

private Alojamiento mapearAlojamiento(ResultSet rs) throws SQLException {
        Alojamiento alojamiento = new Alojamiento();
        alojamiento.setId(rs.getInt("entity_id"));
        // TODO 1: asigna la columna nombre a la propiedad nombre.
        // TODO 2: asigna la columna descripcion a la propiedad descripcion.
        // TODO 3: asigna la columna precio_noche a la propiedad precioNoche.
        // TODO 4: asigna la columna capacidad a la propiedad capacidad.
        // TODO 5: asigna la columna imagen a la propiedad imagen.
        // TODO 6: asigna la columna destacado a la propiedad destacado.
        // TODO 7: construye Localidad con los alias localidad_id y localidad_nombre.
        // TODO 8: construye Tipo con los alias tipo_id y tipo_nombre.
        return alojamiento;
    }
}
