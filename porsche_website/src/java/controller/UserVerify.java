package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.SendEmail;
import model.User;
import dal.ValidDAO;

@WebServlet(name = "UserVerifyServlet", urlPatterns = {"/verify"})
public class UserVerify extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        if (email == null || email.isEmpty()) {
            request.setAttribute("error", "Email không được để trống.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        ValidDAO validDAO = new ValidDAO();

        if (validDAO.isEmailExists(email)) {
            request.setAttribute("error", "Email đã tồn tại, vui lòng nhập email khác.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        User user = new User();
        user.setEmail(email);

        SendEmail.process(request, user);

        HttpSession session = request.getSession();
        session.setAttribute("UserEmail", email);

        request.getRequestDispatcher("enter_code.jsp").forward(request, response);
    }

}
