package com.justcris.WebBiblioteca;

import java.sql.*;
import java.util.ArrayList;

public class AccessDatabase {

    final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    final String DB_URL = "jdbc:mysql://127.0.0.1/patente";

    //  Database credentials
    final String USER = "root";
    final String PASS = "";


    public AccessDatabase() {
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
            return books;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}