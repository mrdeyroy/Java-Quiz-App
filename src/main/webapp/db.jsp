<%-- 
    Document   : db
    Created on : 8 May 2026, 9:02:14 pm
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String url = "jdbc:mysql://localhost:3306/questionbank";
String user = "root";
String password = "root";

Connection conn = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);
} catch(Exception e) {
    out.println("Database connection failed: " + e.getMessage());
}
%>
