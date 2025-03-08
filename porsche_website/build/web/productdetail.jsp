<%-- 
    Document   : productdetail
    Created on : Feb 13, 2024, 9:58:07 PM
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
    
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
            request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <%@include file="includes/head.jsp" %>
        <script type="text/javascript">
            function doImage(id) {
                window.location = "product-detail?id=" + id;
            }
        </script>
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>

        <div class="container-fluid">

            <div class="card-header my-3">Thông tin sản phẩm.</div>

            <c:set value="${requestScope.product}" var="p"/>
            <div class="car-details-container">
                <div class="text-container" style="margin-left: 100px">
                    <h1 class="car-title">${p.getName()}</h1>
                    <p class="car-price">Giá tham khảo từ: 
                        <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true" /> VND
                    </p>
                </div>

                <div class="specifications d-flex align-items-center">
                    <!-- Hiển thị ảnh dựa vào ID của xe -->
                    <img style="width: 600px; margin-left: 100px" src="images/${p.getImage()}" alt="${p.getName()}">

                    <div class="specs-container">

                        <%@include file="includes/style.jsp"%>
                        <%
                               CarSpec spec = (CarSpec) request.getAttribute("spec");
                        %>
                        <div class="front-text"> 
                            <div class="specs-item">
                                <span class="specs-label">Công suất</span>
                                <span class="specs-value"><%= (spec != null) ? spec.getHorsepower() : "N/A" %></span>
                            </div>
                            <div class="specs-item">
                                <span class="specs-label">Dung tích</span>
                                <span class="specs-value"><%= (spec != null) ? spec.getEngineCapacity() : "N/A" %></span>
                            </div>
                            <div class="specs-item">
                                <span class="specs-label">Mô men xoắn cực đại</span>
                                <span class="specs-value"><%= (spec != null) ? spec.getMaxTorque() : "N/A" %></span>
                            </div>
                            <div class="specs-item">
                                <span class="specs-label">Tăng tốc từ 0 - 100 km/giờ</span>
                                <span class="specs-value"><%= (spec != null) ? spec.getAcceleration() : "N/A" %></span>
                            </div>
                            <div class="specs-item">
                                <span class="specs-label">Tốc độ tối đa</span>
                                <span class="specs-value"><%= (spec != null) ? spec.getMaxSpeed() : "N/A" %></span>
                            </div>
                            <div class="d-flex justify-content-end">
                                <a href="add-to-cart?id=${spec.getId()}" class="btn btn-dark" style="margin: 5px 15px 0px 0px">Quan tâm</a>
                                <a href="order-now?quantity=1&id=${spec.getId()}" class="btn btn-primary" style="margin-top: 5px">Mua ngay</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <h4 style="text-align: center; margin: 40px;">Các dòng xe khác</h4>

            <div class="row">
                <c:forEach var="c" items="${requestScope.list}">
                    <div class="col-md-4 pb-3">
                        <div class="card w-100" style="width: 18rem; position: relative;">
                            <image class="card-img-top" src="images/${c.getImage()}" alt="${c.getImage()}" 
                                   style="height: 200px; width: 100%;" onclick="doImage('${c.getId()}')"/>
                            <div class="card-body">
                                <h5 class="card-title" style="display: flex; justify-content: center">${c.getName()}</h5>
                                <h6 class="card-title" style="display: flex; justify-content: center">Giá tiêu chuẩn: <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true" /> VND</h6>

                                <div class="mt-3 d-flex justify-content-center">
                                    <a href="product-detail?id=${c.getId()}" class="btn btn-primary">xem ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>

        <%@include file="includes/foot.jsp" %>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>
