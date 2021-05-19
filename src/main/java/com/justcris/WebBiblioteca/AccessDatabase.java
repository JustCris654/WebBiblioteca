package com.justcris.WebBiblioteca;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;

public class AccessDatabase {

    final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    final String DB_URL = "jdbc:mysql://127.0.0.1/biblioteca";

    //  Database credentials
    final String USER = "root";
    final String PASS = "";


    public AccessDatabase() {
    }

    public ArrayList<Book> GetListaLibri(Connection conn) {
        try {
            String sql = "select * from libri";
            Statement stmt = conn.createStatement();

            ResultSet resultSet = stmt.executeQuery(sql);

            ArrayList<Book> books = new ArrayList<>();
            while (resultSet.next()) {
                books.add(
                        new Book(
                                resultSet.getString("isbn"),
                                resultSet.getString("titolo"),
                                resultSet.getString("autore"),
                                resultSet.getInt("npagine")
                        )
                );
            }
            System.out.println(Arrays.toString(books.toArray()));
            return books;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public Connection GetConnection() {
        Connection conn = null;
        try {
            //Load dbms drivers
            Class.forName(JDBC_DRIVER);

            //Open database connection
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            return conn;
        } catch (Exception e) {
            //Handle errors for JDBC
            e.printStackTrace();
            return null;
        }
    }

    public boolean DeleteBooks(Connection conn, String[] isbn_list) {
        try {
            StringBuilder sql = new StringBuilder("delete  from libri\n" +
                    "where Isbn='" + isbn_list[0] + "'");
            for (int i = 1; i < isbn_list.length; i++) {
                sql.append(" or Isbn='").append(isbn_list[i]).append("'");
            }

            Statement stmt = conn.createStatement();

            stmt.executeUpdate(sql.toString());

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean AddBook(Connection conn, String title, String author, String isbn, int npag) throws SQLException {
        PreparedStatement statement = conn.prepareStatement("insert into biblioteca.libri(isbn, titolo, autore, npagine) \n" +
                "values (?,?,?,?)");
        statement.setString(1, isbn);
        statement.setString(2, title);
        statement.setString(3, author);
        statement.setInt(4,npag);

        int row = statement.executeUpdate();
        System.out.println("row: "+row);
        return row==1;
    }
}