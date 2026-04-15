<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

<h2>Edit Product</h2>

<form action="ProductServlet" method="post">

    <input type="hidden" name="action" value="update">
    <input type="hidden" name="productId" value="1">

    Name: <input type="text" name="name" value="Sample Product"><br><br>
    Price: <input type="text" name="price" value="100"><br><br>
    Team: <input type="text" name="team" value="Team A"><br><br>

    <button type="submit">Update</button>

</form>

<br>
<a href="ProductServlet">Back</a>

</body>
</html>
