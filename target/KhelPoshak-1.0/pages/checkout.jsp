<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
</head>
<body>

<h2>Checkout</h2>

<c:if test="${not empty error}">
    <p>${error}</p>
</c:if>

<h3>Order Summary</h3>

<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>Product</th>
        <th>Size</th>
        <th>Qty</th>
        <th>Price</th>
        <th>Subtotal</th>
    </tr>

    <c:forEach var="item" items="${cartItems}">
        <tr>
            <td>${item.name}</td>
            <td>${item.size}</td>
            <td>${item.quantity}</td>
            <td>$${item.price}</td>
            <td>$${item.subtotal}</td>
        </tr>
    </c:forEach>
</table>

<h3>Total: $${total}</h3>

<hr>

<h3>Shipping Information</h3>

<form action="${pageContext.request.contextPath}/CheckoutS" method="post">

    <p>
        Shipping Address:<br>
        <textarea name="shippingAddress" rows="3" required></textarea>
    </p>

    <p>
        Phone Number:<br>
        <input type="tel" name="phone" required>
    </p>

    <p>
        Payment Method:<br>
        <select name="paymentMethod" required>
            <option value="">Select Payment Method</option>
            <option value="Cash on Delivery">Cash on Delivery</option>
            <option value="Credit Card">Credit Card</option>
            <option value="Esewa">Esewa</option>
            <option value="Khalti">Khalti</option>
        </select>
    </p>

    <button type="submit">Place Order</button>
</form>

<br>
<a href="${pageContext.request.contextPath}/CartS">← Back to Cart</a>

</body>
</html>