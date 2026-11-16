package dao;

import conexion.ConnectionFactory;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Localidad;

public class LocalidadDAO {
    public List<Localidad> findAll() throws SQLException {
        List<Localidad> result = new ArrayList<>();
        try (Connection cn = ConnectionFactory.getConnection();
             PreparedStatement ps = cn.prepareStatement("SELECT id, nombre FROM localidad ORDER BY nombre");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) result.add(mapearLocalidad(rs));
        }
        return result;
    }
    public Optional<Localidad> findById(int id) throws SQLException {
        try (Connection cn = ConnectionFactory.getConnection();
             PreparedStatement ps = cn.prepareStatement("SELECT id, nombre FROM localidad WHERE id = ?")) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? Optional.of(mapearLocalidad(rs)) : Optional.empty();
            }
        }
    }

private Localidad mapearLocalidad(ResultSet rs) throws SQLException {
        return new Localidad(rs.getInt("id"), rs.getString("nombre"));
    }
}
