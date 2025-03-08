<%-- 
    Document   : orders
    Created on : Jan 20, 2024, 3:16:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page import="java.util.ArrayList" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth!=null) {
        request.setAttribute("auth", auth);
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
        <title>Đăng nhập khánh hàng</title>
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>

        <div class="container">
            <div class="card w-50 mx-auto my-5">
                <div class="card-header text-center">Đăng nhập &nbsp &nbsp | &nbsp &nbsp <a href="signup.jsp" target="target">Đăng ký</a></div>
                <div class="card-body">
                    <h2 style="color: red">${requestScope.error}</h2>
                    <form action="user-login" method="post">
                        <div class="form-group">
                            <label>Địa chỉ gmail: </label>
                            <input type="email" class="form-control" name="login-email" placeholder="Nhập tài khoản gmail vào đây" required/>
                        </div>
                        <div class="form-group">
                            <label>Mật khẩu: </label>
                            <input type="password" class="form-control" name="login-password" placeholder="********" required/>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Đăng nhập</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%@include file="includes/foot.jsp" %>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>
