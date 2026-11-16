package dao;

import conexion.ConnectionFactory;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Genero;

public class GeneroDAO {
    public List<Genero> findAll() throws SQLException {
        List<Genero> result = new ArrayList<>();
        try (Connection cn = ConnectionFactory.getConnection();
             PreparedStatement ps = cn.prepareStatement("SELECT id, nombre FROM genero ORDER BY nombre");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) result.add(mapearGenero(rs));
        }
        return result;
    }
    public Optional<Genero> findById(int id) throws SQLException {
        try (Connection cn = ConnectionFactory.getConnection();
             PreparedStatement ps = cn.prepareStatement("SELECT id, nombre FROM genero WHERE id = ?")) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? Optional.of(mapearGenero(rs)) : Optional.empty();
            }
        }
    }

private Genero mapearGenero(ResultSet rs) throws SQLException {
        return new Genero(rs.getInt("id"), rs.getString("nombre"));
    }
}
