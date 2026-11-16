package dao;

import conexion.ConnectionFactory;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Marca;

public class MarcaDAO {
    public List<Marca> findAll() throws SQLException {
        List<Marca> result = new ArrayList<>();
        try (Connection cn = ConnectionFactory.getConnection();
             PreparedStatement ps = cn.prepareStatement("SELECT id, nombre FROM marca ORDER BY nombre");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) result.add(mapearMarca(rs));
        }
        return result;
    }
    public Optional<Marca> findById(int id) throws SQLException {
        try (Connection cn = ConnectionFactory.getConnection();
             PreparedStatement ps = cn.prepareStatement("SELECT id, nombre FROM marca WHERE id = ?")) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? Optional.of(mapearMarca(rs)) : Optional.empty();
            }
        }
    }

private Marca mapearMarca(ResultSet rs) throws SQLException {
        return new Marca(rs.getInt("id"), rs.getString("nombre"));
    }
}
