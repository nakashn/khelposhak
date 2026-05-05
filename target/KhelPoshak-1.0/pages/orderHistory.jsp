<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Khel Poshak - Bill</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .bill {
            width: 700px;
            margin: 20px auto;
            border: 1px solid #ccc;
            padding: 20px;
        }

        h2, h3 {
            text-align: center;
            margin: 5px 0;
        }

        .info {
            margin: 15px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            border-bottom: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        table th {
            background: #f2f2f2;
        }

        .total {
            text-align: right;
            font-weight: bold;
        }

        .footer {
            text-align: center;
            margin-top: 15px;
            color: #777;
        }
    </style>
</head>

<body>

<h2>My Orders</h2>

<c:if test="${empty orders}">
    <p style="text-align:center;">You haven't placed any orders yet.</p>
</c:if>

<c:if test="${not empty orders}">
    <c:forEach var="order" items="${orders}">
        
        <div class="bill">

            <h2>Khel Poshak</h2>
            <h3>Invoice</h3>

            <div class="info">
                <p><strong>Invoice No:</strong> ${order.orderNumber}</p>
                <p><strong>Date:</strong> ${order.orderDate.toString().replace('T', ' ')}</p>
                <p><strong>Status:</strong> ${order.orderStatus}</p>
            </div>

            <div class="info">
                <p><strong>Shipping Address:</strong> ${order.shippingAddress}</p>
                <p><strong>Phone:</strong> ${order.phone}</p>
                <p><strong>Payment Method:</strong> ${order.paymentMethod}</p>
            </div>

            <table>
                <tr>
                    <th>Product</th>
                    <th>Details</th>
                    <th>Amount</th>
                </tr>

                <c:forEach var="item" items="${order.items}">
                    <tr>
                        <td>Product #${item.productId}</td>
                        <td>
                            Size: ${item.size} <br>
                            Qty: ${item.quantity} x $${item.priceAtTime}
                        </td>
                        <td>$${item.subtotal}</td>
                    </tr>
                </c:forEach>

                <tr>
                    <td colspan="2" class="total">Total</td>
                    <td class="total">$${order.totalAmount}</td>
                </tr>
            </table>

            <div class="footer">
                Thank you for shopping with Khel Poshak!
            </div>

        </div>

    </c:forEach>
</c:if>

<div style="text-align:center;">
    <a href="${pageContext.request.contextPath}/homeS">Continue Shopping</a> |
    <a href="${pageContext.request.contextPath}/CartS">View Cart</a>
</div>
</body>
</html>