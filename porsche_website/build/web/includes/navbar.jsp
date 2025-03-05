<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid" style="background-color: white"> 
        
        <img style="width: 110px; height: 60px" 
                 src="https://porsche-vietnam.vn/wp-content/themes/porsche-2018/images/porsche-logo.jpg" alt="Porsche Logo">
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="pagination">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">Cart<span class="badge badge-danger">${(cart_list.size()>0)?cart_list.size():0}</span></a>
                </li>
                <%
                    if (auth!=null) {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="orders.jsp">Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Log out</a>
                </li>
                <%
                    } else {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="signup.jsp">Sign up</a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>