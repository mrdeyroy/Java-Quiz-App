<%-- 
    Document   : result
    Created on : 8 May 2026, 9:02:01 pm
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
Integer score = (Integer) session.getAttribute("score");

if(score == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<head>
    <title>Quiz Results</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

<div class="container">
    <div class="glass-card">
        <h2>Quiz Completed!</h2>
        <p class="info">Here is your performance summary.</p>
        
        <div style="font-size: 3rem; font-weight: 600; color: var(--accent-color); margin: 2rem 0;">
            <%= score %> <span style="font-size: 1.5rem; color: var(--text-secondary);">/ 12</span>
        </div>

        <p class="info">
            <% if(score >= 10) { %>
                Excellent! You're a Java Pro.
            <% } else if(score >= 7) { %>
                Good job! Keep practicing.
            <% } else { %>
                Better luck next time!
            <% } %>
        </p>

        <a href="quiz.jsp">
            <button class="btn">Play Again</button>
        </a>
    </div>
</div>

<%
session.removeAttribute("qno");
session.removeAttribute("score");
session.removeAttribute("level");
%>

</body>