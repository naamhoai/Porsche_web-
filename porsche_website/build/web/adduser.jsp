<%-- 
    Document   : adduser
    Created on : Feb 19, 2024, 3:47:44 PM
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
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="includes/head.jsp" %>
    </head>
    <body>
        <div class="container container-fluid">
            <div class="card-header my-3 d-flex align-items-center justify-content-between">
                <a href="to-admin"><h5>Bảng điều khiển</h5></a>
                <a class="nav-link" href="logout">Log out</a>
            </div>
            <div class="row">
                <%@include file="includes/asideadmin.jsp" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="card mx-auto">
                        <div class="card-header text-center">Thêm tài khoản</div>
                        <div class="card-body">
                            <h2 style="color: red">${requestScope.error}</h2>
                            <form action="add-user" method="post">
                                <div class="form-group">
                                    <label>Tên tài khoản: </label>
                                    <input type="text" class="form-control" name="name" placeholder="Enter name" required/>
                                </div>
                                <div class="form-group">
                                    <label>Địa chỉ Email: </label>
                                    <input type="email" class="form-control" name="email" placeholder="Enter email" required/>
                                </div>
                                <div class="form-group">
                                    <label>Mật khẩu: </label>
                                    <input type="password" class="form-control" name="password" placeholder="********" required/>
                                </div>
                                <div class="form-group">
                                    <label>quyền truy cập Admin: </label>
                                    <input type="number" class="form-control" name="roleid" placeholder="1 for admin, 0 for user" required/>
                                </div>
                                <div class="form-group">
                                    <label>Số điện thoại: </label>
                                    <input type="text" class="form-control" name="phone" placeholder="Enter phone" required/>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Thêm tài khoản</button>
                                    <button type="reset" class="btn btn-primary">Làm mới</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>
