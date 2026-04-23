<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Khel Poshak - Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <h2>Khel Poshak</h2>

    <a href="${pageContext.request.contextPath}/homeS">Home</a>
    <a href="#">About</a>
    <a href="#">Contact</a>
    <a href="${pageContext.request.contextPath}/pages/login.jsp">Login</a>
    <a href="${pageContext.request.contextPath}/pages/register.jsp">Register</a>
</div>

<hr>

<!-- SEARCH -->
<form action="${pageContext.request.contextPath}/homeS" method="get">
    <input type="text" name="search" placeholder="Search products." value="${param.search}">
    <button type="submit">Search</button>
</form>

<!-- FILTER -->
<form action="${pageContext.request.contextPath}/homeS" method="get">

    <select name="category">
        <option value="">All Categories</option>

        <c:forEach var="cat" items="${categories}">
            <option value="${cat.categoryId}">
                ${cat.name}
            </option>
        </c:forEach>
    </select>

    <select name="sort">
        <option value="">Sort By</option>
        <option value="price">Highest Price</option>
    </select>

    <button type="submit">Filter</button>
</form>

<hr>

<!-- PRODUCTS -->
<div class="product-container">

    <c:if test="${not empty searchKeyword}">
        <p>Search result: ${searchKeyword}</p>
    </c:if>

    <c:if test="${not empty sortType}">
        <p>Sorted by: ${sortType}</p>
    </c:if>

    <div class="product-grid">

        <c:forEach var="p" items="${products}">
            <div class="product-card">

                <h3>${p.name}</h3>
                <p>${p.team} | ${p.sport}</p>
                <p>Price: $${p.price}</p>

                <a href="${pageContext.request.contextPath}/pages/login.jsp">
                    Login to Buy
                </a>

            </div>
        </c:forEach>

    </div>

    <c:if test="${empty products}">
        <p>No products found</p>
    </c:if>

</div>

</body>
</html>