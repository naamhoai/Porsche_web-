<%-- 
    Document   : index
    Created on : Feb 18, 2024, 6:20:44 PM
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
    
    ProductDAO pd = new ProductDAO();
    List<Product> products = pd.getProducts1Category();
    List<Product> products4 = pd.get4Products();
    
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
            request.setAttribute("cart_list", cart_list);
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRJ301-Chan de chan manh len--+</title>
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
            <div id="carouselExampleIndicators" class="carousel slide mt-3" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="images/slider1.jpg" alt="First slide" style="height: 550px; width: 100%">
                        <div class="carousel-caption d-none d-md-block text-lg-left" style="left: 5%">
                            <h2>Bản Sắc. Thời Thượng.</h2>
                            <h5>Macan thuần điện mới.</h5>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images/slider2.jpg" alt="Second slide"  style="height: 550px; width: 100%">
                        <div class="carousel-caption d-none d-md-block text-lg-left"  style="left: 5%">
                            <h2>Xa hơn cùng nhau.</h2>
                            <h5>Dòng xe Cayenne.</h5>
                        </div>
                    </div>                    
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images/slider3.jpg" alt="Second slide"  style="height: 550px; width: 100%">
                        <div class="carousel-caption d-none d-md-block text-lg-left"  style="left: 5%">
                            <h2>Cam đảm dẫn đầu</h2>
                            <h5>Macan S mới.</h5>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images/slider4.jpg" alt="Second slide"  style="height: 550px; width: 100%">
                        <div class="carousel-caption d-none d-md-block text-lg-left"  style="left: 5%">
                            <h2>Cỗ Máy Kinh Điển</h2>
                            <h5>911 Turbo S.</h5>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="images/slider5.jpg" alt="Third slide"  style="height: 550px; width: 100%">
                        <div class="carousel-caption d-none d-md-block text-lg-right position-absolute" style="bottom: 75%; right: 10%">
                            <h2  style="color: black">Thể thao thuần khiết</h2>
                            <h5  style="color: black">Dòng xe 718 Boxster và 718 Cayman.</h5>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <br/>
            <br/>
            <h2 class="text-center mb-5">Thế giới Porsche</h2>

            <form action="search-name" method="post" style="margin: 0px 500px 80px 500px">
                <div class="form-group d-flex align-items-center">
                    <input type="text" class="form-control me-2" name="name" placeholder="🔍 Tìm kiếm" required/>
                    <button type="reset" class="btn btn-secondary">Delete</button>
                </div>
            </form>

            <div class="row">
                <c:forEach items="<%= products%>" var="c">
                    <div class="col-md-4 pb-3">
                        <div class="card w-100" style="width: 1px; position: relative; margin-bottom: 50px">
                            <image class="card-img-top" src="images/${c.getImage()}" alt="${c.getImage()}" style="height: 35%; width: auto;"
                                   onclick="doImage('${c.getId()}')"/>
                            <div class="card-body">
                                <h5 class="card-title" style="text-align: center">${c.getName()}</h5>
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
