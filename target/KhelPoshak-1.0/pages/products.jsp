<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Manage Products </title>
        <link rel="stylesheet" href="">
    </head>

    <body>

        <div class="admin-container">

            <h1>Manage Jerseys</h1>

            <div >
                <a href="pages/addproduct.jsp" class="btn">+ Add New Jersey</a>
                <a href="pages/Admindashboard.jsp" class="btn">Back to Dashboard</a>
            </div>

            <table class="product-table" border="1" >

                <thead >
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Team</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="p" items="${products}">
                        <tr>
                            <td>${p.productId}</td>
                            <td>${p.name}</td>
                            <td>${p.team}</td>
                            <td>${p.price}</td>
                            <td>
                                S:${p.stockS}
                                M:${p.stockM}
                                L:${p.stockL}
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/ProdS?action=edit&product_id=${p.productId}">
                                    Edit
                                </a>
                                <a href="${pageContext.request.contextPath}/ProdS?action=delete&product_id=${p.productId}"
                                   onclick="return confirm('Delete this product?')">
                                    Delete
                                </a>
                            </td>
                        </tr>

                    </c:forEach>

                </tbody>

            </table>

        </div>

    </body>
</html>