package controller;

import dao.GeneroDAO;
import dao.PeliculaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import model.Genero;
import model.Pelicula;

@WebServlet("/peliculas")
public class PeliculaServlet extends HttpServlet {
    private PeliculaDAO peliculaDAO;
    private GeneroDAO generoDAO;

    @Override
    public void init() {
        peliculaDAO = new PeliculaDAO();
        generoDAO = new GeneroDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null || accion.isBlank()) accion = "listar";
        try {
            switch (accion) {
            case "listar" -> listar(request, response);
            case "detalle" -> detalle(request, response);
            case "editar" -> mostrarEditar(request, response);
                default -> response.sendError(400, "Acción GET desconocida");
            }
        } catch (SQLException | IllegalArgumentException ex) {
            throw new ServletException("No se pudo atender la petición", ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        try {
            if (accion == null) { response.sendError(400, "Falta accion"); return; }
            switch (accion) {
            case "actualizar" -> actualizar(request, response);
                default -> response.sendError(400, "Acción POST desconocida");
            }
        } catch (SQLException | IllegalArgumentException ex) {
            throw new ServletException("No se pudo procesar la operación", ex);
        }
    }

    private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        request.setAttribute("peliculas", peliculaDAO.findAll());
        forward(request, response, "listado.jsp");
    }

    private void detalle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = requiredInt(request, "id");
        Pelicula pelicula = peliculaDAO.findById(id).orElse(null);
        if (pelicula == null) { response.sendError(404, "Pelicula no encontrado"); return; }
        request.setAttribute("pelicula", pelicula);
        forward(request, response, "detalle.jsp");
    }

    private void mostrarEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = requiredInt(request, "id");
        Pelicula pelicula = peliculaDAO.findById(id).orElse(null);
        if (pelicula == null) { response.sendError(404, "Pelicula no encontrado"); return; }
        request.setAttribute("pelicula", pelicula);
        request.setAttribute("generos", generoDAO.findAll());
        request.setAttribute("modo", "actualizar");
        forward(request, response, "formulario.jsp");
    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        // TODO 4: conserva el id oculto, reconstruye Pelicula, llama a update y redirige.
        throw new UnsupportedOperationException("Pendiente actualizar");
    }

    private Pelicula readForm(HttpServletRequest request) throws SQLException {
        Pelicula pelicula = new Pelicula();
        pelicula.setTitulo(required(request, "titulo"));
        pelicula.setSinopsis(request.getParameter("sinopsis"));
        pelicula.setDuracion(requiredInt(request, "duracion"));
        pelicula.setAnio(requiredInt(request, "anio"));
        pelicula.setClasificacion(required(request, "clasificacion"));
        pelicula.setImagen(required(request, "imagen"));
        Genero genero = generoDAO.findById(requiredInt(request, "generoId")).orElseThrow(() -> new IllegalArgumentException("Género no válido"));
        pelicula.setGenero(genero);
        return pelicula;
    }

    private static int requiredInt(HttpServletRequest request, String name) {
        return Integer.parseInt(required(request, name));
    }

    private static String required(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        if (value == null || value.isBlank()) throw new IllegalArgumentException("Falta " + name);
        return value.trim();
    }

    private static void forward(HttpServletRequest request, HttpServletResponse response, String view) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/" + view).forward(request, response);
    }
}
