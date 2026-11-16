package controller;

import dao.DestinoDAO;
import dao.TipoDestinoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import model.Destino;
import model.TipoDestino;

@WebServlet("/destinos")
public class DestinoServlet extends HttpServlet {
    private DestinoDAO destinoDAO;
    private TipoDestinoDAO tipoDAO;

    @Override
    public void init() {
        destinoDAO = new DestinoDAO();
        tipoDAO = new TipoDestinoDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion == null || accion.isBlank()) accion = "listar";
        try {
            switch (accion) {
            case "listar" -> listar(request, response);
            case "detalle" -> detalle(request, response);
            case "nuevo" -> mostrarNuevo(request, response);
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
            case "crear" -> crear(request, response);
                default -> response.sendError(400, "Acción POST desconocida");
            }
        } catch (SQLException | IllegalArgumentException ex) {
            throw new ServletException("No se pudo procesar la operación", ex);
        }
    }

    private void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        request.setAttribute("destinos", destinoDAO.findAll());
        forward(request, response, "listado.jsp");
    }

    private void detalle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = requiredInt(request, "id");
        Destino destino = destinoDAO.findById(id).orElse(null);
        if (destino == null) { response.sendError(404, "Destino no encontrado"); return; }
        request.setAttribute("destino", destino);
        forward(request, response, "detalle.jsp");
    }

    private void mostrarNuevo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        request.setAttribute("tipos", tipoDAO.findAll());
        request.setAttribute("modo", "crear");
        forward(request, response, "formulario.jsp");
    }

    private void crear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        // TODO 3: lee y valida el formulario, crea Destino, llama a insert y aplica Post Redirect Get.
        throw new UnsupportedOperationException("Pendiente crear");
    }

    private Destino readForm(HttpServletRequest request) throws SQLException {
        Destino destino = new Destino();
        destino.setNombre(required(request, "nombre"));
        destino.setPais(required(request, "pais"));
        destino.setDescripcion(request.getParameter("descripcion"));
        destino.setPrecioDesde(new BigDecimal(required(request, "precioDesde")));
        destino.setDias(requiredInt(request, "dias"));
        destino.setImagen(required(request, "imagen"));
        destino.setDestacado(request.getParameter("destacado") != null);
        TipoDestino tipo = tipoDAO.findById(requiredInt(request, "tipoId")).orElseThrow(() -> new IllegalArgumentException("Tipo no válido"));
        destino.setTipo(tipo);
        return destino;
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
