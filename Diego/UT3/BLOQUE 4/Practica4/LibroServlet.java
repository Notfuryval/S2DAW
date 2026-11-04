package controller;

import dao.AutorDAO;
import dao.CategoriaDAO;
import dao.LibroDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Autor;
import model.Categoria;
import model.Libro;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/libros")
public class LibroServlet extends HttpServlet {

    private LibroDAO libroDAO;
    private AutorDAO autorDAO;
    private CategoriaDAO categoriaDAO;

    @Override
    public void init() {
        libroDAO = new LibroDAO();
        autorDAO = new AutorDAO();
        categoriaDAO = new CategoriaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null || accion.isBlank()) {
            accion = "listar";
        }

        try {
            switch (accion) {
                case "listar" -> listar(request, response);
                case "detalle" -> detalle(request, response);
                case "nuevo" -> mostrarFormularioNuevo(request, response);
                case "editar" -> mostrarFormularioEditar(request, response);
                default -> response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Acción GET no reconocida"
                );
            }
        } catch (NumberFormatException e) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "El identificador debe ser numérico"
            );
        } catch (SQLException e) {
            mostrarError(request, response, e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if (accion == null || accion.isBlank()) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Falta el parámetro accion"
            );
            return;
        }

        try {
            switch (accion) {
                case "crear" -> crear(request, response);
                case "actualizar" -> actualizar(request, response);
                case "eliminar" -> eliminar(request, response);
                default -> response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Acción POST no reconocida"
                );
            }
        } catch (NumberFormatException e) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Los identificadores, el año y el precio deben ser numéricos"
            );
        } catch (SQLException e) {
            mostrarError(request, response, e);
        }
    }

    // C1: mostrar el listado de libros.
    private void listar(HttpServletRequest request,
                        HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        request.setAttribute("libros", libroDAO.findAll());

        forward(request, response, "/WEB-INF/views/libros.jsp");
    }

    // C2: mostrar el detalle de un libro.
    private void detalle(HttpServletRequest request,
                         HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        int id = leerId(request);
        Libro libro = libroDAO.findById(id);

        if (libro == null) {
            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "No se encontró el libro con id: " + id
            );
            return;
        }

        request.setAttribute("libro", libro);

        forward(request, response, "/WEB-INF/views/libro-detalle.jsp");
    }

    // C3: mostrar el formulario de creación.
    private void mostrarFormularioNuevo(HttpServletRequest request,
                                        HttpServletResponse response)
            throws SQLException, ServletException, IOException {

        prepararCatalogos(request);
        request.setAttribute("modo", "crear");

        forward(request, response, "/WEB-INF/views/libro-formulario.jsp");
    }

    // C4: mostrar el formulario de edición.
    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        int id = leerId(request);
        Libro libro = libroDAO.findById(id);

        if (libro == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontró el libro con id: " + id);
            return;
        }

        prepararCatalogos(request);
        request.setAttribute("libro", libro);
        request.setAttribute("modo", "actualizar");

        forward(request, response, "/WEB-INF/views/libro-formulario.jsp");
    }

    // C5: insertar un libro.
    private void crear(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        Libro libro = leerLibroDelFormulario(request, false);
        libroDAO.insertWithId(libro);

        redirectListado(request, response);
    }

    // C6: actualizar un libro.
    private void actualizar(HttpServletRequest request,HttpServletResponse response) throws SQLException, IOException {

        Libro libro = leerLibroDelFormulario(request, true);
        int filas = libroDAO.update(libro);

        if (filas == 0) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontró el libro con id: " + libro.getIdLibro());
            return;
        }

        redirectListado(request, response);
    }

    // C7: eliminar un libro.
    private void eliminar(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {

        int id = leerId(request);
        int filas = libroDAO.delete(id);

        if (filas == 0) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "No se encontró el libro con id: " + id);
            return;
        }

        redirectListado(request, response);
    }

    // C8: cargar autores y categorías para los desplegables.
    private void prepararCatalogos(HttpServletRequest request)
            throws SQLException {

        request.setAttribute("autores", autorDAO.findAll());
        request.setAttribute("categorias", categoriaDAO.findAll());
    }

    // C9: construir el libro a partir de los datos del formulario.
    private Libro leerLibroDelFormulario(HttpServletRequest request, boolean incluyeId) {

        Libro libro = new Libro();

        if (incluyeId) {
            libro.setIdLibro(leerId(request));
        }

        libro.setTitulo(request.getParameter("titulo"));
        libro.setPrecio(Double.parseDouble(request.getParameter("precio")));
        libro.setAnioPublicacion(Integer.parseInt(request.getParameter("anioPublicacion")));
        libro.setDisponible(request.getParameter("disponible"));

        Autor autor = new Autor();
        autor.setIdAutor(Integer.parseInt(request.getParameter("idAutor")));
        libro.setAutor(autor);

        Categoria categoria = new Categoria();
        categoria.setIdCategoria(Integer.parseInt(request.getParameter("idCategoria")));
        libro.setCategoria(categoria);

        return libro;
    }
    
    private int leerId(HttpServletRequest request) {
        return Integer.parseInt(request.getParameter("id"));
    }

    private void redirectListado(HttpServletRequest request,
                                 HttpServletResponse response)
            throws IOException {

        response.sendRedirect(request.getContextPath() + "/libros");
    }

    private void forward(HttpServletRequest request,
                         HttpServletResponse response,
                         String vista)
            throws ServletException, IOException {

        request.getRequestDispatcher(vista).forward(request, response);
    }

    private void mostrarError(HttpServletRequest request,
                              HttpServletResponse response,
                              SQLException e)
            throws ServletException, IOException {

        getServletContext().log("Error al acceder a Oracle", e);

        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

        request.setAttribute(
                "mensajeError",
                "No ha sido posible completar la operación con la base de datos."
        );

        forward(request, response, "/WEB-INF/views/error.jsp");
    }
}