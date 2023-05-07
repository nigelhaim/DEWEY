/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author nigel
 */
public class Borrowed_Book_Details {
    private int book_id;
    private String book_title;
    private String book_author;
    private int quantity;
    private Date due_date;

    public Borrowed_Book_Details(int id, String title, String author, int quantity, Date due_date){
        this.book_id = id;
        this.book_title = title;
        this.book_author = author;
        this.quantity = quantity;
        this.due_date = due_date;
    }

    public int getId(){
        return book_id;
    }
    public String getTitle(){
        return book_title;
    }
    public String getauthor(){
        return book_author;
    }
    public int getquantity(){
        return quantity;
    }
    public Date getdue_date(){
        return due_date;
    }
}

