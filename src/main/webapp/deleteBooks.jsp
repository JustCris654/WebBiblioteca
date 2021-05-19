<%@ page import="com.justcris.WebBiblioteca.AccessDatabase" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: CSCAPIN
  Date: 19/05/2021
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AccessDatabase accessDatabase = new AccessDatabase();
    Connection conn = accessDatabase.GetConnection();
    if (request.getParameter("submit") != null) {
        System.out.println("ora cancello");
        String[] isbns = request.getParameterValues("isbn_libri");
        boolean delete = accessDatabase.DeleteBooks(conn, isbns);
        if (delete) {
            out.println("<script> window.location.replace('lista-libri.jsp') </script>");
        } else {
            out.println("<script> alert('Problema con la cancellazione'); </script>");
        }
    }
%>

