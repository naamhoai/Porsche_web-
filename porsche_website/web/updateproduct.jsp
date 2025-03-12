<%-- 
    Document   : updateproducts
    Created on : Feb 19, 2024, 3:48:58 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*" %>
<%@page import="dal.*" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
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
                <a href="#"><h5>Bảng điều khiển</h5></a>
                <a class="nav-link" href="logout">Đăng xuất</a>
            </div>
            <div class="row">
                <%@include file="includes/asideadmin.jsp" %>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="card mx-auto">
                        <div class="card-header text-center">Thay đổi thông tin sản phẩm</div>
                        <div class="card-body">
                            <h2 style="color: red">${requestScope.msg}</h2>
                            <form action="update-product">
                                <div class="form-group">
                                    <label>Mã sản phẩm: </label>
                                    <input type="number" class="form-control" id="product-id" name="id" placeholder="Enter id" required min="1" max="15"/>
                                    <small id="id-error" style="color: red;"></small>
                                </div>

                                <script>
                                    document.getElementById("product-id").addEventListener("input", function () {
                                        this.value = (this.value < 1 || this.value > 15) ? "" : this.value;
                                        document.getElementById("id-error").innerText = this.value ? "" : "❌ Chỉ nhập số từ 1 đến 15!";
                                    });
                                </script>
                                
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                                </div>
                            </form>
                        </div>
                        <div class="card-body">
                            <h2 style="color: red">${requestScope.error}</h2>
                            <c:set var="c" value="${requestScope.product}"/>
                            <form action="update-product" method="post">
                                <div class="form-group">
                                    <label>Product ID: </label>
                                    <input type="number" class="form-control" name="id" value="${c.id}" readonly/>
                                </div>
                                <div class="form-group">
                                    <label>Tên sản phẩm: </label>
                                    <input type="text" class="form-control" name="name" value="${c.name}" required/>
                                </div>
                                <div class="form-group">
                                    <label>Mô tả: </label>
                                    <input type="text" class="form-control" name="description" value="${c.description}" required/>
                                </div>
                                <div class="form-group">
                                    <label>Dòng xe: </label>
                                    <input type="text" class="form-control" name="category" value="${c.category}" required/>
                                </div>
                                <div class="form-group">
                                    <label>Giá tiền: <fmt:formatNumber value="${c.price}" type="number" groupingUsed="true"/> </label>
                                    <input type="number" class="form-control" name="price" value="Nhập giá tiền mới." required/>
                                </div>
                                <div class="form-group">
                                    <label>Kho: </label>
                                    <input type="number" class="form-control" name="stock" value="${c.stock}" required/>
                                </div>
                                <div class="form-group">
                                    <label>Image: </label>
                                    <input type="file" class="form-control" name="image" value="${c.image}" required/>
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">Thay đổi</button>
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
