<%@ page import="com.justcris.WebBiblioteca.AccessDatabase" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.justcris.WebBiblioteca.Book" %><%--
  Created by IntelliJ IDEA.
  User: CSCAPIN
  Date: 11/05/2021
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
          crossorigin="anonymous">
</head>
<body>
<%
    AccessDatabase accessDatabase = new AccessDatabase();
    Connection conn = accessDatabase.GetConnection();
    ArrayList<Book> books = accessDatabase.GetListaLibri(conn);
    if(books == null){
        out.println("caca");
    }
%>
<table class="table table-dark table-borderless">
    <thead>
    <tr>
        <th scope="col">ISBN</th>
        <th scope="col">Titolo</th>
        <th scope="col">Autore</th>
        <th scope="col">Numero Pagine</th>
    </tr>
    </thead>
    <tbody>=
    <%
        for (int i = 0; i < books.size(); i++) {
            out.println("<tr>" +
                    "<th scope='row'>" + (i + 1) + "</th>" +
                    "<td>" + books.get(i).getIsbn() + "</td>" +
                    "<td>" + books.get(i).getTitle() + "</td>" +
                    "<td>" + books.get(i).getAuthor() + "</td>" +
                    "<td>" + books.get(i).getN_pages() + "</td>" +
                    "</tr>"
            );
        }
    %>
    </tbody>
</table>


<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
        crossorigin="anonymous">
</script>
</body>
</html>
