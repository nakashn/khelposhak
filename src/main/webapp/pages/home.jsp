<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Khel Poshak - Home</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>

    <body>

        <div class="navbar">
            <h2>Khel Poshak</h2>

            <a href="${pageContext.request.contextPath}/homeS">Home</a>
            <a href="${pageContext.request.contextPath}/products">All Products</a>
            <a href="${pageContext.request.contextPath}/OrderHistoryS">My Orders</a>
            <a href="#">About</a>
            <a href="#">Contact</a>

            <c:if test="${not empty sessionScope.user}">
                Welcome, ${sessionScope.user.fullName}
                <a href="${pageContext.request.contextPath}/CartS">Cart</a>
                <a href="${pageContext.request.contextPath}/LogoutS">Logout</a>
            </c:if>

            <c:if test="${empty sessionScope.user}">
                <a href="${pageContext.request.contextPath}/pages/login.jsp">Login</a>
                <a href="${pageContext.request.contextPath}/pages/register.jsp">Register</a>
            </c:if>
        </div>

        <hr>

        <div class="center-content">
            <h1>Welcome to Khel Poshak</h1>
            <p>Your one-stop shop for sports jerseys and equipment!</p>
            <a href="${pageContext.request.contextPath}/products">Browse All Products →</a>
        </div>

        <h2 class="section-title">Featured Jerseys</h2>

        <div class="product-container">
            <c:forEach var="product" items="${featuredProducts}">
                <div class="product-card">
                    <h3>${product.name}</h3>
                    <p>${product.team}</p>
                    <p>#${product.playerName}</p>
                    <p><strong>$${product.price}</strong></p>

                    <form action="${pageContext.request.contextPath}/CartS" method="post">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="product_id" value="${product.productId}">

                        <select name="size" required>
                            <option value="">Select Size</option>
                            <option value="S">S</option>
                            <option value="M">M</option>
                            <option value="L">L</option>
                            <option value="XL">XL</option>
                            <option value="XXL">XXL</option>
                        </select>

                        <input type="hidden" name="quantity" value="1">
                        <button type="submit">Add to Cart</button>
                    </form>
                </div>
            </c:forEach>
        </div>

        <c:if test="${empty featuredProducts}">
            <p class="no-products">No featured products available at the moment.</p>
        </c:if>

    </body>
</html>