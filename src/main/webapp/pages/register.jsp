<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register User</title>
    </head>
    <body>
        <h2>Create Account</h2>
        <p style="color:red">${error}</p>

        <form action="${pageContext.request.contextPath}/regServ" method="post">  
            <label>Full Name:</label><br>
            <input type="text" name="fullName" value="${param.fullName}" required ><br><br>

            <label>Email:</label><br>
            <input type="email" name="email" value="${param.email}" required ><br><br>

            <label>Password:</label><br>
            <input type="password" name="password" ><br><br>
             <label>Confirm Password:</label><br>
            <input type="password" name="cfpassword" ><br><br>

            <label>Phone:</label><br>
            <input type="tel" name="phone" value="${param.phone}" ><br><br>

            <label>Address:</label><br>
            <textarea name="address">${param.address}</textarea><br><br>

            <button type="submit">Register</button>
        </form>
        <p>Have account?? <a href="login.jsp">Login</a></p>
    </body>
</html>
