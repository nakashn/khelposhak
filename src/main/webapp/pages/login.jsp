
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>loginjsp</h2>
        <form action="${pageContext.request.contextPath}/LogServ" method="post">  
            <input type="email" name="email" placeholder="Email" >
            <input type="password" name="password" placeholder="Password" >
            <button type="submit">Login</button>
        </form>
        <p>No account? <a href="register.jsp">Register</a></p>
    </body>
</html>
