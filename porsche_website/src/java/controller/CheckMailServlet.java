package controller;

import dal.ValidDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CheckEmailServlet", urlPatterns = {"/check-email"})
public class CheckMailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        ValidDAO validDAO = new ValidDAO();

        if (validDAO.isEmailExists(email)) {
            response.getWriter().write("exists");
        } else {
            response.getWriter().write("available");
        }
    }
}
