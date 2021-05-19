<%@ page import="com.justcris.WebBiblioteca.AccessDatabase" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.justcris.WebBiblioteca.Book" %>
<%--
  Created by IntelliJ IDEA.
  User: CSCAPIN
  Date: 11/05/2021
  Time: 11:38
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
%>
<div style="width: 60%; margin: auto">
    <h1 style="text-align: center">Aggiungi libro</h1>
    <form action="add_book.jsp" method="post">
        <div class="row">
            <div class="col">
                <input type="text" class="form-control" name="title" id="title" placeholder="Titolo" aria-label="Titolo">
            </div>
            <div class="col">
                <input type="text" class="form-control" name="author" id="author" placeholder="Autore" aria-label="Autore">
            </div>
        </div>

        <div class="row">
            <div class="col">
                <input type="number" class="form-control" name="isbn" id="isbn" placeholder="isbn" aria-label="isbn">
            </div>
            <div class="col">
                <input type="number" class="form-control" name="npag" id="npag" placeholder="Numero pagine" aria-label="Numero pagine">
            </div>
        </div>
        <input type="submit" value="Send" name="send" id="send" class="btn btn-primary">
    </form>
</div>
<div style="width: 60%; margin: auto">
    <form action="deleteBooks.jsp" method="post">
        <table class="table table-dark table-borderless">
            <thead>
            <tr>
                <th scope="col">N</th>
                <th scope="col">ISBN</th>
                <th scope="col">Titolo</th>
                <th scope="col">Autore</th>
                <th scope="col">Numero Pagine</th>
                <th scope="col">Seleziona per cancellare</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (int i = 0; i < books.size(); i++) {
                    out.println("<tr>" +
                            "<th scope='row'>" + (i + 1) + "</th>" +
                            "<td    >" + books.get(i).getIsbn() + "</td>" +
                            "<td>" + books.get(i).getTitle() + "</td>" +
                            "<td>" + books.get(i).getAuthor() + "</td>" +
                            "<td>" + books.get(i).getN_pages() + "</td>" +
                            "<td><div class=\"form-check\">\n" +
                            "  <input class=\"form-check-input\" " +
                            "type=\"checkbox\" value=\"" + books.get(i).getIsbn() + "\" " +
                            "name=\"isbn_libri\" " +
                            "id=\"" + books.get(i).getIsbn() + "\">\n" +
                            "  <label class=\"form-check-label\" " +
                            "for=\"" + books.get(i).getIsbn() + "\">\n" +
                            "    Cancella\n" +
                            "  </label>\n" +
                            "</div></td>" +
                            "</tr>"
                    );
                }
            %>
            </tbody>
        </table>
        <input type="submit" value="Cancella libri selezionati" name="submit" id="submit">
    </form>
</div>


<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
        crossorigin="anonymous">
</script>
</body>
</html>
