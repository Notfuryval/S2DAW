package dao;

import conexion.ConnectionFactory;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Destino;
import model.TipoDestino;

public class DestinoDAO {
    private static final String SELECT_ALL = "SELECT e.id AS entity_id, e.nombre AS entity_nombre, e.pais AS entity_pais, e.descripcion AS entity_descripcion, e.precio_desde AS entity_precio_desde, e.dias AS entity_dias, e.imagen AS entity_imagen, e.destacado AS entity_destacado, r1.id AS tipo_id, r1.nombre AS tipo_nombre FROM destino e JOIN tipo_destino r1 ON r1.id = e.tipo_id ORDER BY e.id";
    private static final String SELECT_ONE = "SELECT e.id AS entity_id, e.nombre AS entity_nombre, e.pais AS entity_pais, e.descripcion AS entity_descripcion, e.precio_desde AS entity_precio_desde, e.dias AS entity_dias, e.imagen AS entity_imagen, e.destacado AS entity_destacado, r1.id AS tipo_id, r1.nombre AS tipo_nombre FROM destino e JOIN tipo_destino r1 ON r1.id = e.tipo_id WHERE e.id = ?";
    public List<Destino> findAll() throws SQLException {
        List<Destino> result = new ArrayList<>();
        try (Connection cn = ConnectionFactory.getConnection();
             PreparedStatement ps = cn.prepareStatement(SELECT_ALL);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) result.add(mapearDestino(rs));
        }
        return result;
    }
    public Optional<Destino> findById(int id) throws SQLException {
        try (Connection cn = ConnectionFactory.getConnection();
             PreparedStatement ps = cn.prepareStatement(SELECT_ONE)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? Optional.of(mapearDestino(rs)) : Optional.empty();
            }
        }
    }
    public void insert(Destino destino) throws SQLException {
        // TODO 3: prepara INSERT, asigna todos los parámetros en el mismo orden y ejecuta.
        throw new UnsupportedOperationException("Pendiente insert");
    }

private Destino mapearDestino(ResultSet rs) throws SQLException {
        Destino destino = new Destino();
        destino.setId(rs.getInt("entity_id"));
        // TODO 1: asigna la columna nombre a la propiedad nombre.
        // TODO 2: asigna la columna pais a la propiedad pais.
        // TODO 3: asigna la columna descripcion a la propiedad descripcion.
        // TODO 4: asigna la columna precio_desde a la propiedad precioDesde.
        // TODO 5: asigna la columna dias a la propiedad dias.
        // TODO 6: asigna la columna imagen a la propiedad imagen.
        // TODO 7: asigna la columna destacado a la propiedad destacado.
        TipoDestino tipo = new TipoDestino();
        tipo.setId(rs.getInt("tipo_id"));
        tipo.setNombre(rs.getString("tipo_nombre"));
        destino.setTipo(tipo);
        return destino;
    }
}
