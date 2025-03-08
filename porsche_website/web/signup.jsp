<%-- 
    Document   : signup
    Created on : Feb 18, 2024, 10:01:57 PM
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
        <title>Đăng ký thành viên</title>
        <%@include file="includes/head.jsp" %>
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>

        <div class="container">
            <div class="card w-50 mx-auto my-5">
                <div class="card-header text-center"><a href="login.jsp" target="target">Đăng nhập</a> &nbsp &nbsp | &nbsp &nbsp Đăng ký</div>
                <div class="card-body">
                    <h2 style="color: red">${requestScope.error}</h2>
                    <form action="sign-up" method="post">
                        <div class="form-group">
                            <label>Họ và tên: </label>
                            <input type="text" class="form-control" name="name" placeholder="Tên đầy đủ của bạn" required/>
                        </div>
                        <div class="form-group">
                            <label>Số điện thoại: </label>
                            <input type="text" class="form-control" name="phone" placeholder="Nhập số điện thoại của bạn" required/>
                        </div>
                        <div class="form-group">
                            <label>Địa chỉ Gmail: </label>
                            <input type="email" class="form-control" name="email" placeholder="Nhập địa chỉ Gmail của bạn" required/>
                        </div>
                        <div class="form-group">
                            <label>Mật khẩu: </label>
                            <input type="password" class="form-control" name="password" placeholder="********" required/>
                        </div>
                        <div class="form-group">
                            <label>Nhập lại mật khẩu: </label>
                            <input type="password" class="form-control" name="repassword" placeholder="********" required/>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Đăng ký</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%@include file="includes/foot.jsp" %>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>
