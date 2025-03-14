<%-- 
    Document   : deleteuser
    Created on : Feb 19, 2024, 3:48:03 PM
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
    
UserDAO udao = new UserDAO();
List<User> users = udao.getAllUsers();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="includes/head.jsp" %>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Bạn có muốn xóa tài khoản có ID = " + id)) {
                    window.location = "delete-user?id=" + id;
                }
            }
        </script>
        <%
            String message = (String) request.getSession().getAttribute("message");
            if (message!=null && message!="") {
        %>

        <script type="text/javascript">
            window.onload = function () {
                var message = '<%=message%>';
                if (message !== null && message !== '') {
                    alert(message, 3000);
                }
            };
        </script>
        <script src="includes/alert.js"></script>

        <%
            }
            request.getSession().removeAttribute("message");
        %>
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
                    <table class="table table-light">
                        <thead>
                            <tr>
                                <th scope="col">User name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Password</th>
                                <th scope="col">Role</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="o">
                                <tr>
                                    <td>${o.getName()}</td>
                                    <td>${o.getEmail()}</td>
                                    <td>${o.getPassword()}</td>
                                    <td>${(o.getRoleid() eq 0)?"User" : "Admin"}</td>
                                    <td>${o.getPhone()}</td>
                                    <td><a href="#" onclick="doDelete('${o.getId()}')">Delete</a></td>
                                </tr> 
                            </c:forEach>
                        </tbody>
                    </table>
                    <div style="text-align: center;" class="clearfix">
                        <div class="hint-text">Hiển thị <b>${requestScope.tag}</b> trong số <b>${requestScope.endP}</b> trang</div>
                        <ul class="pagination" style="display: flex; align-items: center; justify-content: center;">
                            <c:if test="${requestScope.tag>1}">
                                <li class="page-item">
                                    <a href="delete-users?index=${requestScope.tag-1}" class="page-link" aria-label="Go to previous page">Trước đó</a>
                                </li>
                            </c:if>
                            <c:forEach begin="1" end="${requestScope.endP}" var="i">
                                <li class="page-item ${requestScope.tag == i?"active":""}">
                                    <a href="delete-users?index=${i}" class="page-link">${i}</a>
                                </li> 
                            </c:forEach>
                            <c:if test="${requestScope.tag < requestScope.endP}">
                                <li class="page-item">
                                    <a href="delete-users?index=${requestScope.tag+1}" class="page-link" aria-label="Go to next page">Tiếp theo</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </main>
            </div>
        </div>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>
