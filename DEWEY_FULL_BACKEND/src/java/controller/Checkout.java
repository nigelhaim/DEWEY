/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.http.*;
import model.Borrowed_Book_Details;

/**
 *
 * @author nigel
 */
public class Checkout extends HttpServlet {

    /**
     * This servlet processes the checkout when the user clicks the checkout button 
     * in the view_cart.jsp
     * 
     * The servlet will loop the cart and generates a Borrowed_book data contains
     * the necessary information
     * 
     * The servlet also subtracts the quantity from the QUANTITY column of the table 
     * books from the database
     * 
     * This servlet also clears the cart upon checking out 
     */
    Connection conn;
    public void init(ServletConfig config) throws ServletException
    {
        try{
            Class.forName(config.getInitParameter("jdbcClassName"));
            String username = config.getInitParameter("dbUserName");
            String password = config.getInitParameter("dbPassword");
            
            StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(config.getInitParameter("dbHostName"))
                    .append(":")
                    .append(config.getInitParameter("dbPort"))
                    .append("/")
                    .append(config.getInitParameter("databaseName"));
                    //.append(config.getInitParameter(""));
                           
            
            conn = DriverManager.getConnection(url.toString(), username, password);
            
        }catch(SQLException sqle){
            System.out.print("An SQL Exception occur" + sqle.getMessage());
        }catch(ClassNotFoundException cnfe){
            System.out.println("ClassNotFound Exception occured: " + cnfe.getMessage());
        }
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try{
            if(conn != null){
                //Gets the cart and enters the for loop
                ArrayList <Borrowed_Book_Details> cart = (ArrayList) session.getAttribute("cart");
                int user_id = (int) session.getAttribute("user_id");
                //Creates a Borrowed_book data based from each book in the cart
                for(Borrowed_Book_Details b : cart){
                    String query = "INSERT INTO BORROWED_BOOKS (BOOK_ID, MEMBER_ID, QUANTITY, DUE_DATE) VALUES (?, ?, ? ,?)";
                    PreparedStatement stmt = conn.prepareStatement(query);
                    stmt.setInt(1, b.getId());
                    stmt.setInt(2, user_id);
                    stmt.setInt(3, b.getquantity());
                    stmt.setDate(4, b.getdue_date());
                    int row = stmt.executeUpdate();
                    if(row > 0){
                        System.out.print("Check out confirmed!");
                    }
                    //Updates the book quantity in the database
                    String query2 = "UPDATE BOOKS SET BOOK_QUANTITY = (BOOK_QUANTITY-?) WHERE BOOK_ID = ?";
                    PreparedStatement stmt2 = conn.prepareStatement(query2);
                    stmt2.setInt(1, b.getquantity());
                    stmt2.setInt(2, b.getId());
                    int row2 = stmt2.executeUpdate();
                    if(row2 > 0){
                        System.out.print("Success subtracted quantity!");
                    }
                }
                cart.clear();
                //Clears the cart
            }
        }catch(Exception e){
            System.out.print(e.getMessage());
        }
        response.sendRedirect("Success_Page.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Checkout.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Checkout.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
