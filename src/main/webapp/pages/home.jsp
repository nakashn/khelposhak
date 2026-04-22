<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>KhelPoshak-Shop</title>
</head>
<body>

<!-- Navbar -->
<div>
    <h2>🛒 E-Shop</h2>
    <a href="#">Home</a> |
    <a href="#">About</a> |
    <a href="#">Products</a> |
    <a href="#">Contact</a> |
    <button>Login</button>
</div>

<hr>

<!-- Search Section -->
<div>
    <input type="text" placeholder="Search products..." size="100">
</div>

<br>

<!-- Filter Section -->
<div>
    <select>
        <option>Category</option>
    </select>

    <select>
        <option>Brand</option>
    </select>

    <select>
        <option>Sort By</option>
    </select>
</div>

<hr>

<!-- Product Section -->
<div>

    <!-- Product Card -->
    <div>
        <img src="" alt="Product Image" width="200">
        <h3>Product Name</h3>
        <p>Brand</p>
        <p>Rating</p>
        <p>Price</p>
        <p>Stock</p>
        <button>Add to Cart</button>
    </div>

    <!-- Repeat this block later dynamically -->

</div>

</body>
</html>