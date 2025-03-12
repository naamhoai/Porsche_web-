<%-- 
    Document   : addproduct
    Created on : Feb 19, 2024, 3:48:33 PM
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
                <a class="nav-link" href="logout">Đăng xuất</a>
            </div>
            <div class="row">
                <%@include file="includes/asideadmin.jsp" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="card mx-auto">
                        <div class="card-header text-center">Thêm sản phẩm</div>
                        <div class="card-body">
                            <h2 style="color: red">${requestScope.error}</h2>
                            <form action="add-product" method="post">
                                <div class="form-group">
                                    <label>Tên sản phẩm: </label>
                                    <input type="text" class="form-control" name="name" placeholder="Enter product name" required/>
                                </div>
                                <div class="form-group">
                                    <label>Mô tả: </label>
                                    <input type="text" class="form-control" name="description" placeholder="Enter description" required/>
                                </div>
                                <div class="form-group">
                                    <label>Dòng xe: </label>
                                    <input type="text" class="form-control" name="category" placeholder="Enter category" required/>
                                </div>
                                <div class="form-group">
                                    <label>Giá tiền: </label>
                                    <input type="number" class="form-control" name="price" placeholder="Enter role" required/>
                                </div>
                                <div class="form-group">
                                    <label>Hiện có: </label>
                                    <input type="number" class="form-control" name="stock" value="${c.stock}" required/>
                                </div>
                                <div class="form-group">
                                    <label>Ảnh: </label>
                                    <input type="file" class="form-control" name="image" required/>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Thêm vào hệ thống</button>
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
