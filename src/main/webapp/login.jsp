<%-- 
    Document   : login
    Created on : 8 May 2026, 9:01:13 pm
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
    <div class="glass-card">
        <h2>Login</h2>
        <p class="info">Please enter your credentials to begin.</p>

        <form action="quiz.jsp" method="post">
            <div class="input-group">
                <input type="text" name="username" placeholder="Username" required>
            </div>
            <div class="input-group">
                <input type="password" name="password" placeholder="Password" required>
            </div>
            <button type="submit" class="btn">Start Quiz</button>
        </form>
    </div>
</div>

</body>
</html>
