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

            <div class="card-header my-3">Product Detail</div>

            <c:set value="${requestScope.product}" var="p"/>
            <div>

                <div class="car-details-container">
                    <div class="text-container">
                        <h1 class="car-title">718 Cayman</h1>
                        <p class="car-price">Standard price: 3,850,000,000 VND*</p>
                    </div>

                    <div class="specifications d-flex align-items-center">
                        <img src="https://porsche-vietnam.vn/wp-content/uploads/2018/07/model-718-cayman.png" 
                             alt="Porsche Side View" class="car-image">

                        <div class="specs-container">
                            <div class="specs-item"><span class="specs-label">Capacity</span><span class="specs-value">300hp (220 kW)</span></div>
                            <div class="specs-item"><span class="specs-label">Maximum torque</span><span class="specs-value">380 Nm</span></div>
                            <div class="specs-item"><span class="specs-label">Acceleration</span><span class="specs-value">4.9 seconds (4.7s with Sport Chrono Package)</span></div>
                            <div class="specs-item"><span class="specs-label">Maximum speed</span><span class="specs-value">275 km/h</span></div>
                            <div class="specs-item"><span class="specs-label">Standard price</span><span class="specs-value">4.380.000.000 VNĐ</span></div>
                        </div>
                    </div>
                </div>
cc
                <style>
                    .car-details-container {
                        flex-direction: column;
                        align-items: center;
                        text-align: center;
                        padding: 20px;
                    }
                    .car-title {
                        font-size: 32px;
                        font-weight: bold;
                        margin-bottom: 10px;
                    }
                    .car-price {
                        font-size: 20px;
                        font-weight: bold;
                        color: #d32f2f;
                    }
                    .specifications {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        gap: 20px;
                        max-width: 900px;
                    }
                    .car-image {
                        width: 600px;
                        height: auto;
                    }
                    .specs-container {
                        text-align: right;
                        margin-left: 100px;
                    }
                    .specs-item {
                        justify-content: space-between;
                        font-size: 18px;
                        padding: 5px 0;
                    }
                    .specs-label {
                        font-weight: bold;
                        color: #333;
                    }
                    .specs-value {
                        color: #d32f2f;
                    }
                    .price-note {
                        font-size: 14px;
                        max-width: 700px;
                        margin-top: 20px;
                        color: #666;
                    }
                </style>



                <h4 style="text-align: center; padding: 20px 0;">Related Products</h4>

                <div class="row">
                    <c:forEach var="c" items="${requestScope.list}">
                        <div class="col-md-4 pb-3">
                            <div class="card w-100" style="width: 18rem; position: relative;">
                                <image class="card-img-top" src="images/${c.getImage()}" alt="${c.getImage()}" style="height: 240px; width: auto;" onclick="doImage('${c.getId()}')"/>
                                <div class="card-body">
                                    <h5 class="card-title">${c.getName()}</h5>

                                    <div class="mt-3 d-flex justify-content-between">
                                        <a href="add-to-cart?id=${c.getId()}" class="btn btn-dark">Add to cart</a>
                                        <a href="order-now?quantity=1&id=${c.getId()}" class="btn btn-primary">Buy now</a>
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
