package dao;

import conexion.ConnectionFactory;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Categoria;
import model.Marca;
import model.Producto;

public class ProductoDAO {
    private static final String SELECT_ALL = "SELECT e.id AS entity_id, e.nombre AS entity_nombre, e.descripcion AS entity_descripcion, e.precio AS entity_precio, e.stock AS entity_stock, e.imagen AS entity_imagen, r1.id AS marca_id, r1.nombre AS marca_nombre, r2.id AS categoria_id, r2.nombre AS categoria_nombre FROM producto e JOIN marca r1 ON r1.id = e.marca_id JOIN categoria r2 ON r2.id = e.categoria_id ORDER BY e.id";
    private static final String SELECT_ONE = "SELECT e.id AS entity_id, e.nombre AS entity_nombre, e.descripcion AS entity_descripcion, e.precio AS entity_precio, e.stock AS entity_stock, e.imagen AS entity_imagen, r1.id AS marca_id, r1.nombre AS marca_nombre, r2.id AS categoria_id, r2.nombre AS categoria_nombre FROM producto e JOIN marca r1 ON r1.id = e.marca_id JOIN categoria r2 ON r2.id = e.categoria_id WHERE e.id = ?";
    public List<Producto> findAll() throws SQLException {
        // TODO 1: ejecuta el SELECT con JOIN, recorre ResultSet y utiliza mapearProducto(...).
        throw new UnsupportedOperationException("Pendiente findAll");
    }
    public Optional<Producto> findById(int id) throws SQLException {
        // TODO 2: consulta por id y devuelve Optional.empty() si no existe.
        throw new UnsupportedOperationException("Pendiente findById");
    }
    public void insert(Producto producto) throws SQLException {
        // TODO 3: prepara INSERT, asigna todos los parámetros en el mismo orden y ejecuta.
        throw new UnsupportedOperationException("Pendiente insert");
    }
    public void update(Producto producto) throws SQLException {
        // TODO 4: ejecuta UPDATE, conserva el id para la cláusula WHERE.
        throw new UnsupportedOperationException("Pendiente update");
    }
    public void delete(int id) throws SQLException {
        // TODO 5: elimina por id mediante PreparedStatement.
        throw new UnsupportedOperationException("Pendiente delete");
    }

private Producto mapearProducto(ResultSet rs) throws SQLException {
        Producto producto = new Producto();
        producto.setId(rs.getInt("entity_id"));
        // TODO 1: asigna la columna nombre a la propiedad nombre.
        // TODO 2: asigna la columna descripcion a la propiedad descripcion.
        // TODO 3: asigna la columna precio a la propiedad precio.
        // TODO 4: asigna la columna stock a la propiedad stock.
        // TODO 5: asigna la columna imagen a la propiedad imagen.
        // TODO 6: construye Marca con los alias marca_id y marca_nombre.
        // TODO 7: construye Categoria con los alias categoria_id y categoria_nombre.
        return producto;
    }
}
