<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
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

<h2>Your Shopping Cart</h2>

<c:if test="${empty cartItems}">
    <p>Your cart is empty</p>
    <a href="${pageContext.request.contextPath}/homeS">Continue Shopping</a>
</c:if>

<c:if test="${not empty cartItems}">
    <table border="1">
        <tr>
            <th>Product</th>
            <th>Size</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Subtotal</th>
            <th>Action</th>
        </tr>
        <c:forEach var="item" items="${cartItems}">
            <tr>
                <td>${item.name}</td>
                <td>${item.size}</td>
                <td>$${item.price}</td>
                <td>
                    <form action="${pageContext.request.contextPath}/CartS" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="product_id" value="${item.productId}">
                        <input type="hidden" name="size" value="${item.size}">
                        <input type="number" name="quantity" value="${item.quantity}" min="1" style="width:60px;">
                        <button type="submit">Update</button>
                    </form>
                </td>
                <td>$${item.subtotal}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/CartS?action=remove&product_id=${item.productId}&size=${item.size}" 
                       onclick="return confirm('Remove this item?')">Remove</a>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4" align="right"><strong>Total:</strong></td>
            <td><strong>$${total}</strong></td>
            <td></td>
        </tr>
    </table>
    
    <br>
    
    <a href="${pageContext.request.contextPath}/CheckoutS" class="checkout-btn">
        Proceed to Checkout
    </a>
    
    <br><br>
    <a href="${pageContext.request.contextPath}/homeS">Continue Shopping</a>
</c:if>

<br>
<a href="${pageContext.request.contextPath}/homeS">Back to Home</a>

</body>
</html>