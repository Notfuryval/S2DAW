package dao;

import conexion.ConnectionFactory;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.TipoDestino;

public class TipoDestinoDAO {
    public List<TipoDestino> findAll() throws SQLException {
        List<TipoDestino> result = new ArrayList<>();
        try (Connection cn = ConnectionFactory.getConnection();
             PreparedStatement ps = cn.prepareStatement("SELECT id, nombre FROM tipo_destino ORDER BY nombre");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) result.add(mapearTipoDestino(rs));
        }
        return result;
    }
    public Optional<TipoDestino> findById(int id) throws SQLException {
        try (Connection cn = ConnectionFactory.getConnection();
             PreparedStatement ps = cn.prepareStatement("SELECT id, nombre FROM tipo_destino WHERE id = ?")) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? Optional.of(mapearTipoDestino(rs)) : Optional.empty();
            }
        }
    }

private TipoDestino mapearTipoDestino(ResultSet rs) throws SQLException {
        return new TipoDestino(rs.getInt("id"), rs.getString("nombre"));
    }
}
