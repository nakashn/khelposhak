<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>All Products - Khel Poshak</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>
    <body>

        <div class="navbar">
            <h2>Khel Poshak</h2>
            <a href="${pageContext.request.contextPath}/homeS">Home</a>
            <a href="${pageContext.request.contextPath}/products">All Products</a>
            <a href="#">About</a>
            <a href="#">Contact</a>

            <c:if test="${not empty sessionScope.user}">
                Welcome, ${sessionScope.user.fullName}
                <a href="${pageContext.request.contextPath}/CartS">Cart</a>
                <a href="${pageContext.request.contextPath}/OrderHistoryS">My Orders</a>
                <a href="${pageContext.request.contextPath}/LogoutS">Logout</a>
            </c:if>

            <c:if test="${empty sessionScope.user}">
                <a href="${pageContext.request.contextPath}/pages/login.jsp">Login</a>
                <a href="${pageContext.request.contextPath}/pages/register.jsp">Register</a>
            </c:if>
        </div>
        <hr>

        <h2>All Products</h2>

        <!-- Search Form -->
        <form action="${pageContext.request.contextPath}/products" method="get">
            <input type="text" name="search" placeholder="Search products..." value="${param.search}">
            <button type="submit">Search</button>
        </form>

        <!-- Category and Sort Form -->
        <form action="${pageContext.request.contextPath}/products" method="get">
            <select name="category">
                <option value="">All Categories</option>
                <c:forEach var="cat" items="${categories}">
                    <option value="${cat.categoryId}" ${selectedCategory == cat.categoryId ? 'selected' : ''}>
                        ${cat.name}
                    </option>
                </c:forEach>
            </select>

            <select name="sort">
                <option value="">Sort By</option>
                <option value="price" ${sortType == 'price' ? 'selected' : ''}>Lowest Price</option>
                <option value="price_desc" ${sortType == 'price_desc' ? 'selected' : ''}>Highest Price</option>
            </select>

            <button type="submit">Filter</button>

            <!-- Preserve search if exists -->
            <c:if test="${not empty param.search}">
                <input type="hidden" name="search" value="${param.search}">
            </c:if>
        </form>

        <hr>

        <!-- Product Grid -->
        <div class="product-container">
            <div class="product-grid">
                <c:forEach var="p" items="${products}">
                    <div class="product-card">
                        <h3>${p.name}</h3>
                        <p>${p.team} | ${p.sport}</p>
                        <p>Price: $${p.price}</p>

                        <form action="${pageContext.request.contextPath}/CartS" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="product_id" value="${p.productId}">

                            Size: 
                            <select name="size" required>
                                <option value="">Select Size</option>
                                <option value="S">S</option>
                                <option value="M">M</option>
                                <option value="L">L</option>
                                <option value="XL">XL</option>
                                <option value="XXL">XXL</option>
                            </select>

                            Quantity: 
                            <input type="number" name="quantity" value="1" min="1" max="10" style="width:50px;" required>

                            <button type="submit">Add to Cart</button>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>

        <c:if test="${empty products}">
            <p style="text-align:center;">No products found.</p>
        </c:if>

        <br>
        <a href="${pageContext.request.contextPath}/homeS">Back to Home</a>

    </body>
</html>