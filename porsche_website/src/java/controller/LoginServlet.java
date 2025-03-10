package controller;

import dal.UserDAO;
import dal.ValidDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet(name = "LoginServlet", urlPatterns = {"/user-login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String email = request.getParameter("login-email");
            String password = request.getParameter("login-password");

            UserDAO udao = new UserDAO();
            ValidDAO valid = new ValidDAO();

            // Kiểm tra nếu email chưa tồn tại trong DB
            if (!valid.isEmailExists(email)) {
                request.setAttribute("error", "❌ Email chưa được đăng ký! Vui lòng kiểm tra lại.");
                request.setAttribute("loginEmail", email); // Giữ lại email đã nhập
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // Kiểm tra nếu email đúng nhưng sai mật khẩu
            User user = udao.userLogin(email, password);
            if (user == null) {
                request.setAttribute("error", "❌ Mật khẩu không đúng! Vui lòng nhập lại.");
                request.setAttribute("loginEmail", email);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // Nếu đăng nhập thành công
            HttpSession session = request.getSession();
            session.setAttribute("auth", user);

            if (user.getRoleid() == 0) {
                response.sendRedirect("index.jsp"); // Người dùng bình thường
            } else if (user.getRoleid() == 1) {
                response.sendRedirect("to-admin"); // Admin
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "⚠ Tài khoản và mật khẩu không hợp lệ");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Login Servlet";
    }
}
