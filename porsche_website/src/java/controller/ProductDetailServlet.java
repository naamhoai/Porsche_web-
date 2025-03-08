/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import dal.ProductDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.CarSpec;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ProductDetailServlet", urlPatterns = {"/product-detail"})
public class ProductDetailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy tham số ID từ request
        String id_raw = request.getParameter("id");

        // Kiểm tra nếu ID không hợp lệ
        if (id_raw == null || id_raw.isEmpty()) {
            response.sendRedirect("error.jsp"); // Chuyển hướng đến trang lỗi
            return;
        }

        try {
            int id = Integer.parseInt(id_raw);
            ProductDetailDAO specdao = new ProductDetailDAO();
            CarSpec spec = specdao.getProductDetail(id);
            ProductDAO pdao = new ProductDAO();
            Product product = pdao.getSingleProduct(id);

            // Kiểm tra nếu không tìm thấy sản phẩm
            if (spec == null) {
                response.sendRedirect("error.jsp"); // Chuyển hướng nếu sản phẩm không tồn tại
                return;
            }

            // Lấy danh sách 3 sản phẩm cùng loại (loại bỏ sản phẩm hiện tại)
            List<Product> list = pdao.get3ProductsByCategory(product.getCategory(), product.getId());

            // Đặt dữ liệu vào request để gửi đến JSP
            request.setAttribute("product", product);
            request.setAttribute("spec", spec);
            request.setAttribute("list", list);

            // Chuyển tiếp sang productdetail.jsp
            request.getRequestDispatcher("productdetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            e.printStackTrace(); // Log lỗi
            response.sendRedirect("error.jsp"); // Chuyển hướng đến trang lỗi
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
