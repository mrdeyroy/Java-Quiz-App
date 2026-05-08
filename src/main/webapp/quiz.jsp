<%-- 
    Document   : quiz
    Created on : 8 May 2026, 9:01:49 pm
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="db.jsp" %>
<%@ page import="java.sql.*" %>

<%
Integer qno = (Integer) session.getAttribute("qno");
Integer score = (Integer) session.getAttribute("score");
String level = (String) session.getAttribute("level");
String loggedInUser = (String) session.getAttribute("loggedInUser");

// FIRST TIME LOGIN OR RESTART
if(qno == null) {
    if(loggedInUser == null) {
        String username = request.getParameter("username");
        String userPassword = request.getParameter("password");

        if(conn == null) {
            out.println("<div class='container'><div class='glass-card'><p style='color:red'>Database connection failed.</p></div></div>");
            return;
        }

        PreparedStatement ps = conn.prepareStatement(
            "SELECT * FROM users WHERE username=? AND password=?"
        );
        ps.setString(1, username);
        ps.setString(2, userPassword);

        ResultSet rs = ps.executeQuery();

        if(!rs.next()) {
            response.sendRedirect("login.jsp?error=Invalid Credentials");
            return;
        }
        
        session.setAttribute("loggedInUser", username);
    }

    qno = 1;
    score = 0;
    level = "easy"; 
}

// CHECK PREVIOUS ANSWER
String userAns = request.getParameter("ans");
String correct = request.getParameter("correct");

if(userAns != null && correct != null) {
    if(userAns.equals(correct)) {
        score++;
        // LEVEL UP logic
        if(level.equals("easy")) level = "medium";
        else if(level.equals("medium")) level = "hard";
    }
    qno++;
} else if (request.getParameter("timeout") != null) {
    qno++;
}

// SAVE SESSION
session.setAttribute("qno", qno);
session.setAttribute("score", score);
session.setAttribute("level", level);

// STOP AFTER 12 QUESTIONS
if(qno > 12) {
    response.sendRedirect("result.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Quiz - Question <%= qno %> / 12</title>
    <link rel="stylesheet" href="css/style.css">
    <script>
        let timeLeft = 15;
        let timerInterval;

        function startTimer() {
            const timerElement = document.getElementById('timer');
            timerInterval = setInterval(() => {
                timeLeft--;
                timerElement.innerText = timeLeft;
                
                if (timeLeft <= 5) {
                    timerElement.classList.add('low-time');
                }
                
                if (timeLeft <= 0) {
                    handleTimeout();
                }
            }, 1000);
        }

        function handleTimeout() {
            clearInterval(timerInterval);
            
            // Reveal correct answer
            const correctValue = document.getElementById('correctAnswer').value;
            document.getElementById('label-' + correctValue).classList.add('correct');

            // Disable everything
            disableOptions();

            // Toggle buttons
            document.getElementById('submitBtn').classList.add('hidden');
            document.getElementById('nextBtn').classList.remove('hidden');
            
            // Mark as timeout
            const timeoutInput = document.createElement('input');
            timeoutInput.type = 'hidden';
            timeoutInput.name = 'timeout';
            timeoutInput.value = 'true';
            document.getElementById('quizForm').appendChild(timeoutInput);
        }

        function onOptionSelect() {
            document.getElementById('submitBtn').disabled = false;
        }

        function checkAnswer() {
            clearInterval(timerInterval);
            
            const selected = document.querySelector('input[name="ans"]:checked');
            const correctValue = document.getElementById('correctAnswer').value;
            
            if (selected) {
                const userVal = selected.value;
                const label = document.getElementById('label-' + userVal);
                
                if (userVal === correctValue) {
                    label.classList.add('correct');
                } else {
                    label.classList.add('wrong');
                    document.getElementById('label-' + correctValue).classList.add('correct');
                }
                
                // Add hidden input because disabled radio buttons are not submitted
                const hiddenAns = document.createElement('input');
                hiddenAns.type = 'hidden';
                hiddenAns.name = 'ans';
                hiddenAns.value = userVal;
                document.getElementById('quizForm').appendChild(hiddenAns);
            }

            disableOptions();

            // Toggle buttons
            document.getElementById('submitBtn').classList.add('hidden');
            document.getElementById('nextBtn').classList.remove('hidden');
        }

        function disableOptions() {
            const options = document.querySelectorAll('input[type="radio"][name="ans"]');
            options.forEach(opt => opt.disabled = true);
        }
    </script>
</head>
<body onload="startTimer()">

<div class="container">
    <div class="glass-card">
        <div class="meta">
            <span>Question <b><%= qno %></b> / 12</span>
        </div>

        <div id="timer">15</div>

        <%
        if(conn != null) {
            PreparedStatement q = conn.prepareStatement(
                "SELECT * FROM questions WHERE difficulty=? ORDER BY RAND() LIMIT 1"
            );
            q.setString(1, level);
            ResultSet qr = q.executeQuery();

            if(qr.next()) {
                String correctAns = qr.getString("answer");
        %>

        <form id="quizForm" action="quiz.jsp" method="post">
            <h2><%= qr.getString("question") %></h2>

            <div class="options-container">
                <label id="label-A" class="option-label">
                    <input type="radio" name="ans" value="A" onchange="onOptionSelect()"> <%= qr.getString("optA") %>
                </label>
                <label id="label-B" class="option-label">
                    <input type="radio" name="ans" value="B" onchange="onOptionSelect()"> <%= qr.getString("optB") %>
                </label>
                <label id="label-C" class="option-label">
                    <input type="radio" name="ans" value="C" onchange="onOptionSelect()"> <%= qr.getString("optC") %>
                </label>
                <label id="label-D" class="option-label">
                    <input type="radio" name="ans" value="D" onchange="onOptionSelect()"> <%= qr.getString("optD") %>
                </label>
            </div>

            <input type="hidden" id="correctAnswer" name="correct" value="<%= correctAns %>">

            <div class="button-group">
                <button type="button" id="submitBtn" class="btn" onclick="checkAnswer()" disabled>Submit Answer</button>
                <button type="submit" id="nextBtn" class="btn hidden">Next Question</button>
            </div>
        </form>

        <%
            } else {
                out.println("<p>No questions found for level: " + level + "</p>");
            }
        }
        %>
    </div>
</div>

</body>
</html>
