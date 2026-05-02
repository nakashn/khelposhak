<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin dashboard Page</title>
    </head>
    <body>
        <h1>Admin Dashboard</h1>

        <p>Welcome${sessionScope.user.fullName}</p>
        <hr>

        <h3>Menu</h3>

        <ul>
            <li><a href="${pageContext.request.contextPath}/ProdS?action=list">
                    Manage Products
                </a></li>

            <li><a href="${pageContext.request.contextPath}/ProdS?action=add">Add Product</a></li>
            <li><a href="orders.jsp">Manage Orders</a></li>
            <li><a href="users.jsp">Manage Users</a></li>
            <li><a href="${pageContext.request.contextPath}/LogoutS">Logout</a></li>
        </ul>
    </body>
</html>
