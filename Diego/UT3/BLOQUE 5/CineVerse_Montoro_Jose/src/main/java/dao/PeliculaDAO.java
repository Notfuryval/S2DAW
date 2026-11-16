package dao;

import conexion.ConnectionFactory;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import model.Genero;
import model.Pelicula;

public class PeliculaDAO {
    private static final String SELECT_ALL = "SELECT e.id AS entity_id, e.titulo AS entity_titulo, e.sinopsis AS entity_sinopsis, e.duracion AS entity_duracion, e.anio AS entity_anio, e.clasificacion AS entity_clasificacion, e.imagen AS entity_imagen, r1.id AS genero_id, r1.nombre AS genero_nombre FROM pelicula e JOIN genero r1 ON r1.id = e.genero_id ORDER BY e.id";
    private static final String SELECT_ONE = "SELECT e.id AS entity_id, e.titulo AS entity_titulo, e.sinopsis AS entity_sinopsis, e.duracion AS entity_duracion, e.anio AS entity_anio, e.clasificacion AS entity_clasificacion, e.imagen AS entity_imagen, r1.id AS genero_id, r1.nombre AS genero_nombre FROM pelicula e JOIN genero r1 ON r1.id = e.genero_id WHERE e.id = ?";
    public List<Pelicula> findAll() throws SQLException {
        List<Pelicula> result = new ArrayList<>();
        try (Connection cn = ConnectionFactory.getConnection();
             PreparedStatement ps = cn.prepareStatement(SELECT_ALL);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) result.add(mapearPelicula(rs));
        }
        return result;
    }
    public Optional<Pelicula> findById(int id) throws SQLException {
        try (Connection cn = ConnectionFactory.getConnection();
             PreparedStatement ps = cn.prepareStatement(SELECT_ONE)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? Optional.of(mapearPelicula(rs)) : Optional.empty();
            }
        }
    }
    public void update(Pelicula pelicula) throws SQLException {
        // TODO 4: ejecuta UPDATE, conserva el id para la cláusula WHERE.
        throw new UnsupportedOperationException("Pendiente update");
    }

private Pelicula mapearPelicula(ResultSet rs) throws SQLException {
        Pelicula pelicula = new Pelicula();
        pelicula.setId(rs.getInt("entity_id"));
        // TODO 1: asigna la columna titulo a la propiedad titulo.
        // TODO 2: asigna la columna sinopsis a la propiedad sinopsis.
        // TODO 3: asigna la columna duracion a la propiedad duracion.
        // TODO 4: asigna la columna anio a la propiedad anio.
        // TODO 5: asigna la columna clasificacion a la propiedad clasificacion.
        // TODO 6: asigna la columna imagen a la propiedad imagen.
        Genero genero = new Genero();
        genero.setId(rs.getInt("genero_id"));
        genero.setNombre(rs.getString("genero_nombre"));
        pelicula.setGenero(genero);
        return pelicula;
    }
}
