/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
import model.Borrowed_Book_Details;

/**
 *
 * @author nigel
 */


/**
 * This servlet is used for when a user selects a book to be added
 * in the session's cart it creates a model of Borrowed_Book_Details 
 * and stores it in the cart
 */
public class add_to_cart extends HttpServlet {

    Connection conn;
    public void init(ServletConfig config) throws ServletException
    {
        super.init(config);

        ServletContext cont = config.getServletContext();
        try{
            Class.forName(cont.getInitParameter("jdbcClassName"));
            String username = cont.getInitParameter("dbUserName");
            String password = cont.getInitParameter("dbPassword");
            
            StringBuffer url = new StringBuffer(cont.getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(cont.getInitParameter("dbHostName"))
                    .append(":")
                    .append(cont.getInitParameter("dbPort"))
                    .append("/")
                    .append(cont.getInitParameter("databaseName"));
                    //.append(cont.getInitParameter(""));
                           
            
            conn = DriverManager.getConnection(url.toString(), username, password);
            
        }catch(SQLException sqle){
            System.out.print("An SQL Exception occur" + sqle.getMessage());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(add_to_cart.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //Gets the cart from the session
        HttpSession session = request.getSession();
        ArrayList <Borrowed_Book_Details> cart = (ArrayList) session.getAttribute("cart");
        
        //Gets the details from the selected book
        int id = Integer.parseInt(request.getParameter("book_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        //Renders the model Borrowed_Book_Details
        Borrowed_Book_Details detail;
        int book_id;
        String book_title;
        String book_author;
        //Gets the current date and adds two weeks for the due date
        Date due_date = new Date(System.currentTimeMillis() + 1209600000);
        try{
            if(conn != null){
                //Gets the book details based from the ID
                String query = "SELECT * FROM BOOKS WHERE BOOK_ID = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setInt(1, id);
                ResultSet r = stmt.executeQuery();
                boolean is_same = false;
                //If the selected book has the book ID in the cart then it overwrites the previous quantity to the new quantity 
                //else it just adds the book and quantity to the cart
                if(r.next()){
                    book_id = Integer.parseInt(r.getString("BOOK_ID"));
                    book_title = r.getString("BOOK_TITLE");
                    book_author = r.getString("BOOK_AUTHOR");  
                    detail = new Borrowed_Book_Details(book_id, book_title, book_author, quantity, due_date);
                    int array_count = 0;     
                    for(Borrowed_Book_Details b : cart){
                        if(b.getId() == book_id){
                            is_same = true;
                            cart.set(array_count, detail);
                        }   
                        array_count++;
                    }
                    if(!is_same){
                        cart.add(detail);       
                        System.out.print("Added to list: "  + detail.getId()); 
                    }
                    request.getRequestDispatcher("View_cart.jsp").forward(request,response);
                }
            }else{
                    System.out.print("Connection is null");
            }  
        }catch(Exception e){
            System.out.print(e.getMessage());
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
