<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Products - Khel Poshak</title>
    <link rel="stylesheet" href="">
</head>

<body>

<div class="admin-container">

    <h1>Manage Jerseys</h1>

    <div >
        <a href="add-product.jsp" class="btn">+ Add New Jersey</a>
        <a href="dashboard.jsp" class="btn">Back to Dashboard</a>
    </div>

    <table class="product-table" border="1" cellpadding="8" cellspacing="0">

        <thead>
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

            <tr>
                <td>1</td>
                <td>Team Jersey A</td>
                <td>Team X</td>
                <td>$100</td>
                <td>S:10 M:5 L:2</td>

                <td>
                    <a href="ProductServlet?action=edit&id=1">Edit</a>
                    |
                    <a href="ProductServlet?action=delete&id=1"
                       onclick="return confirm('Delete this jersey?')">
                        Delete
                    </a>
                </td>
            </tr>

            <tr>
                <td>2</td>
                <td>Team Jersey B</td>
                <td>Team Y</td>
                <td>$200</td>
                <td>S:8 M:4 L:3</td>

                <td>
                    <a href="ProductServlet?action=edit&id=2">Edit</a>
                    
                    <a href="ProductServlet?action=delete&id=2"
                       onclick="return confirm('Delete this jersey?')">
                        Delete
                    </a>
                </td>
            </tr>

        </tbody>

    </table>

</div>

</body>
</html>