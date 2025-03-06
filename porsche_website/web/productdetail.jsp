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
            <div class="car-details-container">
                <div class="text-container" style="margin-left: 100px">
                    <h1 class="car-title">${p.getName()}</h1>
                    <p class="car-price">Standard price: ${p.getPrice()} VND*</p>
                </div>

                <div class="specifications d-flex align-items-center">
                    <!-- Hiển thị ảnh dựa vào ID của xe -->
                    <img style="width: 600px; margin-left: 100px" src="images/${p.getImage()}" alt="${p.getName()}">

                    <div class="specs-container">
                        
                        <%@include file="includes/style.jsp"%>
                        
                        <div class="front-text"> 
                            <div class="specs-item"><span class="specs-label">Capacity</span><span class="specs-value"></span></div>
                            <div class="specs-item"><span class="specs-label">Maximum torque</span><span class="specs-value"></span></div>
                            <div class="specs-item"><span class="specs-label">Acceleration</span><span class="specs-value"></span></div>
                            <div class="specs-item"><span class="specs-label">Maximum speed</span><span class="specs-value"> km/h</span></div>
                        </div>
                    </div>
                </div>
            </div>


            <h4 style="text-align: center; margin: 40px;">Related Products</h4>

            <div class="row">
                <c:forEach var="c" items="${requestScope.list}">
                    <div class="col-md-4 pb-3">
                        <div class="card w-100" style="width: 18rem; position: relative;">
                            <image class="card-img-top" src="images/${c.getImage()}" alt="${c.getImage()}" 
                                   style="height: 200px; width: 100%;" onclick="doImage('${c.getId()}')"/>
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
