package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@SuppressWarnings("serial")
@WebServlet("/perfil")
public class PerfilDinamicoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("nombre");
        if (nombre == null || nombre.isBlank()) nombre = "Ana";

        request.setAttribute("rol", "Estudiante");
        request.setAttribute("nombre", nombre);
        request.setAttribute("edad", 20);
        request.setAttribute("correo", nombre.toLowerCase() + "@ies-azarquiel.es");
        request.setAttribute("grupo", "2º DAW");

        request.getRequestDispatcher("/WEB-INF/views/Practica3/perfil.jsp").forward(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
