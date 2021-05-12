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
            System.out.println("Array creato");
            while (resultSet.next()) {
                books.add(
                        new Book(
                                resultSet.getString("isbn"),
                                resultSet.getString("titolo"),
                                resultSet.getString("autore"),
                                resultSet.getInt("npagine")
                        )
                );
                System.out.println("Valore aggiunto");
            }
            System.out.println(Arrays.toString(books.toArray()));
            return books;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}