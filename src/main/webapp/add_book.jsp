<%@ page import="java.sql.Connection" %>
<%@ page import="com.justcris.WebBiblioteca.AccessDatabase" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: CSCAPIN
  Date: 19/05/2021
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if(request.getParameter("send") != null){
        AccessDatabase accessDatabase = new AccessDatabase();
        Connection conn = accessDatabase.GetConnection();
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String isbn = request.getParameter("isbn");
        int npag = Integer.parseInt(request.getParameter("npag"));
        try {
            boolean result = accessDatabase.AddBook(conn, title, author, isbn, npag);
            if(result){
                out.println("<script> window.location.replace('lista-libri.jsp') </script>");
            }
            else out.println("generic error");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
%>