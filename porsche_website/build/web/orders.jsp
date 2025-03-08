<%-- 
    Document   : orders
    Created on : Jan 20, 2024, 3:16:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page import="dal.*" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    if (auth!=null) {
        request.setAttribute("auth", auth);
        OrderDAO odao = new OrderDAO();
        orders = odao.userOrders(auth.getId());
    } else {
        response.sendRedirect("login.jsp");
    }
    
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="includes/head.jsp" %>
        <title>Đặt hàng</title>
        <%
            String message = (String) request.getSession().getAttribute("message");
            if (message!=null && message!="") {
        %>

        <script type="text/javascript">
            window.onload = function () {
                var message = '<%=message%>';
                if (message !== null && message !== '') {
                    alert(message, 3000);
                }
            };
        </script>
        <script src="includes/alert.js"></script>

        <%
            }
            request.getSession().removeAttribute("message");
        %>
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>

        <div class="container">
            <div class="card-header my-3">All orders</div>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Ngày đặt hàng</th>
                        <th scope="col">Tổng giá trị (dự kiến)</th>
                        <th scope="col">Địa chỉ</th>
                        <th scope="col">Ghi chú</th>
                        <th scope="col">Chi tiết đơn hàng</th>
                        <th scope="col">Hủy đơn hàng</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (orders!=null) {
                    %>
                    <c:forEach items="<%= orders %>" var="o">
                        <tr>
                            <td>${o.getOid()}</td>
                            <td>${o.getDate()}</td>
                            <td><fmt:formatNumber value="${o.getTotalprice()}" type="number" groupingUsed="true"/> VND </td>
                            <td>${o.getAddress()}</td>
                            <td>${o.getNote()}</td>
                            <td><a href="order-detail?id=${o.getOid()}">Chi tiết</a></td>
                            <td><a class="btn btn-sm btn-danger" href="cancel-order?id=${o.getOid()}">Hủy</a></td>
                        </tr> 
                    </c:forEach>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <%@include file="includes/foot.jsp" %>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>
