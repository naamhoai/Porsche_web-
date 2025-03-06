<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Car" %>

<%
    // L?y danh sách xe t? request ho?c session
    List<Car> products = (List<Car>) request.getAttribute("products");

    // T?o HashSet ?? l?u tên xe duy nh?t
    HashSet<String> uniqueCars = new HashSet<>();
%>

<div class="row">
    <% if (products != null) { %>
        <% for (Car c : products) { %>
            <% if (!uniqueCars.contains(c.getName())) { %>
                <% uniqueCars.add(c.getName()); %>
                <div class="col-md-4 pb-3">
                    <div class="card w-100" style="width: 1px; position: relative; margin-bottom: 50px">
                        <img class="card-img-top" src="images/<%= c.getImage() %>" alt="<%= c.getImage() %>"
                             style="height: 35%; width: auto;" onclick="doImage('<%= c.getId() %>')"/>
                        <div class="card-body">
                            <h5 class="card-title" style="text-align: center"><%= c.getName() %></h5>
                        </div>
                    </div>
                </div>
            <% } %>
        <% } %>
    <% } else { %>
        <p>Không có xe nào ?? hi?n th?.</p>
    <% } %>
</div>
