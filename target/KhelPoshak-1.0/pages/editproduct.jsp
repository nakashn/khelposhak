<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
</head>

<body>

<h2>Edit Product</h2>

<form action="ProdS" method="post">

    <input type="hidden" name="action" value="update">
    <input type="hidden" name="productId" value="${product.productId}">

    Name:
    <input type="text" name="name" value="${product.name}"><br><br>

    Description:
    <input type="text" name="description" value="${product.description}"><br><br>

    Price:
    <input type="text" name="price" value="${product.price}"><br><br>

    Team:
    <input type="text" name="team" value="${product.team}"><br><br>

    Sport:
    <input type="text" name="sport" value="${product.sport}"><br><br>

    Player:
    <input type="text" name="playerName" value="${product.playerName}"><br><br>
    
    Category:
    <input type="hidden" name="categoryId" value="${product.categoryId}"><br><br>

    Stock S:
    <input type="text" name="stockS" value="${product.stockS}"><br><br>

    Stock M:
    <input type="text" name="stockM" value="${product.stockM}"><br><br>

    Stock L:
    <input type="text" name="stockL" value="${product.stockL}"><br><br>

    Stock XL:
    <input type="text" name="stockXl" value="${product.stockXl}"><br><br>

    Stock XXL:
    <input type="text" name="stockXxl" value="${product.stockXxl}"><br><br>

    <button type="submit">Update</button>

</form>
<a href="ProdS?action=list">Back</a>

</body>
</html>