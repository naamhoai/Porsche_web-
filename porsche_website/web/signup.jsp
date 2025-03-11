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
                <div class="card-header text-center">
                    <a href="login.jsp">Đăng nhập</a> &nbsp;&nbsp;|&nbsp;&nbsp; Đăng ký
                </div>
                <div class="card-body">
                    <h2 style="color: red; text-align: center;">
                        <% if (request.getAttribute("error") != null) { %>
                        <%= request.getAttribute("error") %>
                        <% } %>
                    </h2>

                    <form action="sign-up" method="post" onsubmit="return validateForm()">
                        <div class="form-group">
                            <label>Họ và tên: </label>
                            <input type="text" class="form-control" name="name"
                                   value="<%= (request.getAttribute("name") != null) ? request.getAttribute("name") : "" %>"
                                   placeholder="Tên đầy đủ của bạn" required/>
                        </div>

                        <div class="form-group">
                            <label>Số điện thoại: </label>
                            <input type="text" class="form-control" name="phone"
                                   value="<%= (request.getAttribute("phone") != null) ? request.getAttribute("phone") : "" %>"
                                   placeholder="Nhập số điện thoại của bạn" required/>
                        </div>

                        <div class="form-group">
                            <label>Địa chỉ Gmail: </label>
                            <input type="email" class="form-control" name="email" id="email"
                                   value="<%= (request.getAttribute("email") != null) ? request.getAttribute("email") : "" %>"
                                   placeholder="Nhập địa chỉ Gmail của bạn" required/>
                            <small id="email-error" style="color: red;"></small>
                        </div>

                        <div class="form-group">
                            <label>Mật khẩu: </label>
                            <input type="password" class="form-control" name="password" id="password"
                                   placeholder="********" required/>
                        </div>

                        <div class="form-group">
                            <label>Nhập lại mật khẩu: </label>
                            <input type="password" class="form-control" name="repassword" id="confirm-password"
                                   placeholder="********" required/>
                            <small id="password-error" style="color: red;"></small>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Đăng ký</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            function validatePassword() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirm-password").value;
                var errorText = document.getElementById("password-error");

                if (password !== confirmPassword) {
                    errorText.innerText = "Mật khẩu nhập lại không khớp!";
                    document.getElementById("confirm-password").value = ""; // Chỉ xóa ô nhập lại mật khẩu
                    return false;
                }

                errorText.innerText = ""; // Xóa lỗi nếu đúng
                return true;
            }

            function validateForm() {
                return validatePassword();
            }

        </script>    

        <script>
            function validateEmail() {
                var email = document.getElementById("email").value;
                var emailError = document.getElementById("email-error");

                fetch("check-email?email=" + email)
                        .then(response => response.text())
                        .then(data => {
                            if (data === "exists") {
                                emailError.innerText = "❌ Email này đã tồn tại, vui lòng nhập email khác.";
                            } else {
                                emailError.innerText = "";
                            }
                        });
            }

            document.getElementById("email").addEventListener("input", validateEmail);
        </script>


        <%@include file="includes/foot.jsp" %>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
