<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="col-md-2 d-none d-md-block bg-light sidebar">
    <div class="sidebar-sticky">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="to-admin">Trang chủ</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#userMenu" role="button" aria-expanded="false" aria-controls="userMenu">
                    Tài khoản
                </a>
                <div class="collapse" id="userMenu">
                    <ul class="nav flex-column ml-3">
                        <li class="nav-item">
                            <a class="nav-link" href="adduser.jsp">Thêm tài khoản</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="updateuser.jsp">Thay đổi thông tin tài khoản</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="delete-users">Xóa tài khoản</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="show-users">Hiện thông tin tài khoản</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#productMenu" role="button" aria-expanded="false" aria-controls="productMenu">
                    Sản phẩm
                </a>
                <div class="collapse" id="productMenu">
                    <ul class="nav flex-column ml-3">
                        <li class="nav-item">
                            <a class="nav-link" href="addproduct.jsp">Thêm sản phẩm</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="updateproduct.jsp">Chỉnh sửa sản phẩm</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="delete-products">Xóa sản phẩm</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="show-products">Hiển thị sản phẩm</a>
                        </li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</nav>