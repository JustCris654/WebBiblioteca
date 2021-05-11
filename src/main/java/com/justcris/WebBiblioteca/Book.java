package com.justcris.WebBiblioteca;

public class Book {
    private String isbn;
    private String title;
    private String author;
    private int n_pages;

    public Book(String isbn, String title, String author, int n_pages) {
        this.isbn = isbn;
        this.title = title;
        this.author = author;
        this.n_pages = n_pages;
    }

    public Book() {
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getN_pages() {
        return n_pages;
    }

    public void setN_pages(int n_pages) {
        this.n_pages = n_pages;
    }
}
