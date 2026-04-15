<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h2>All Products</h2>

        <a href="add-product.html">Add New Product</a>
        <br><br>

        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Team</th>
                <th>Price</th>
                <th>Action</th>
            </tr>

            <tr>
                <td>1</td>
                <td>Product A</td>
                <td>Team X</td>
                <td>100</td>
                <td>
                    <a href="#">Edit</a> |
                    <a href="#" onclick="return confirm('Delete?')">Delete</a>
                </td>
            </tr>

            <tr>
                <td>2</td>
                <td>Product B</td>
                <td>Team Y</td>
                <td>200</td>
                <td>
                    <a href="#">Edit</a> |
                    <a href="#" onclick="return confirm('Delete?')">Delete</a>
                </td>
            </tr>

        </table>

        <br>
        <a href="dashboard.html">Back to Dashboard</a>

    </body>
</html>
