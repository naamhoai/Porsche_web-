<%-- 
    Document   : ordernow
    Created on : Feb 20, 2024, 11:06:16 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page import="dal.*" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth!=null) {
        request.setAttribute("auth", auth);
    }
    
    ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
    List<Cart> cartProduct = null;
    if (cart != null) {
            ProductDAO pDao = new ProductDAO();
            cartProduct = pDao.getCartProducts(cart);
            double total = pDao.getTotalCartPrice(cart);
            request.setAttribute("total", total);
            request.setAttribute("cart", cart);
    }
    
    ProductDAO pd = new ProductDAO();
    List<String> categories = pd.getCategories();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="includes/head.jsp" %>
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>

        <div class="container">
            <h1 class="text-center" style="color: black; background-color: #c8cbcf; margin: 20px 0px">Thanh toán</h1>
            <form action="order-now" method="post">
                <div class="row">
                    <div class="col-md-5">
                        <h2>Địa chỉ thanh toán</h2>
                        <div class="form-group">
                            <label for="name">Tên thanh toán</label>
                            <input type="text" class="form-control" id="name" name="name" value="<%= auth.getName()%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="<%= auth.getEmail()%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="address">Địa chỉ</label>
                            <input type="text" class="form-control" id="address" name="address" required>
                        </div>
                        <div class="form-group">
                            <label for="note">Ghi chú</label>
                            <input type="text" class="form-control" id="note" name="note" required>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <h2 class="text-center">Tổng đơn hàng.</h2>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Dòng xe</th>
                                            <th class="text-center">Giá tham khảo</th>
                                    <th class="text-center">Số lượng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                if (cart != null) {
                                    for (Cart c : cartProduct) {
                                %>
                                <tr>
                                    <td><%=c.getName()%></td>   
                                    <td><fmt:formatNumber  value="<%= c.getPrice() %>" type="number" groupingUsed="true" /> VND</td>
                                    <td>
                                        <form action="order-now" method="post" class="form-inline">
                                            <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                                            <div class="form-group d-flex justify-content-between">
                                                <a class="btn btn-sm btn-decre" href="quantity?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                                                <input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly> 
                                                <a class="btn bnt-sm btn-incre" href="quantity?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a> 
                                            </div>
                                        </form>
                                    </td>
                                </tr>

                                <%
				}}%>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="2">Dự kiến tổng giá tiền.</th>
                                    <td><fmt:formatNumber  value="${(total>0)?total:0}" type="number" groupingUsed="true" /> VND</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Đặt hàng</button>
                </div>
            </form>
        </div>

        <%@include file="includes/foot.jsp" %>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>
