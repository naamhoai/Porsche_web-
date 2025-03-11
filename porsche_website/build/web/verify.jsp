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
            <title>Verify account</title>
            <%@include file="includes/head.jsp" %>
        </head>
        <body>a
            <%@include file="includes/navbar.jsp" %>

            <div class="container">
                <div class="card w-50 mx-auto my-5">
                    <div class="card-body">
                        <h2 style="color: red">${requestScope.error}</h2>
                        <form action="verify" method="post">
                            <div class="form-group">
                                <label> Mã Xác Thực </label>
                                <input type="text" class="form-control" name="code" placeholder="Enter code" required/>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <%@include file="includes/foot.jsp" %>

            <%@include file="includes/footer.jsp" %>
        </body>
    </html>