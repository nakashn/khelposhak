<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h2>Add Product</h2>

        <form action="${pageContext.request.contextPath}/ProdS" method="post">
            <input type="hidden" name="action" value="add">

            Name: <input type="text" name="name"><br><br>
            Description: <input type="text" name="description"><br><br>
            Price: <input type="number" name="price"><br><br>
            Team: <input type="text" name="team"><br><br>
            Sport: <input type="text" name="sport"><br><br>
            Player Name: <input type="text" name="playerName"><br><br>
            Sizes Available: <input type="text" name="sizesAvailable"><br><br>
            Image URL: <input type="text" name="imageUrl"><br><br>
            Category ID: <input type="number" name="categoryId"><br><br>


            Stock S: <input type="number" name="stockS"><br><br>
            Stock M: <input type="number" name="stockM"><br><br>
            Stock L: <input type="number" name="stockL"><br><br>
            Stock XL: <input type="number" name="stockXl"><br><br>
            Stock XXL: <input type="number" name="stockXxl"><br><br>

            <button type="submit">Add Product</button>

        </form>

        <br>
        <a href="dashboard.html">Back</a>
    </body>
</html>
