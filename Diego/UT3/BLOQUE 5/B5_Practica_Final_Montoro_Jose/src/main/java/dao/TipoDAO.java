package dao;

import conexion.ConnectionFactory;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Tipo;

public class TipoDAO {
    public List<Tipo> findAll() throws SQLException {
        List<Tipo> result = new ArrayList<>();
        try (Connection cn = ConnectionFactory.getConnection();
             PreparedStatement ps = cn.prepareStatement("SELECT id, nombre FROM tipo ORDER BY nombre");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) result.add(mapearTipo(rs));
        }
        return result;
    }
    public Optional<Tipo> findById(int id) throws SQLException {
        try (Connection cn = ConnectionFactory.getConnection();
             PreparedStatement ps = cn.prepareStatement("SELECT id, nombre FROM tipo WHERE id = ?")) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? Optional.of(mapearTipo(rs)) : Optional.empty();
            }
        }
    }

private Tipo mapearTipo(ResultSet rs) throws SQLException {
        return new Tipo(rs.getInt("id"), rs.getString("nombre"));
    }
}
