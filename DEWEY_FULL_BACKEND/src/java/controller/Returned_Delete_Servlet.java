/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author nigel
 */
public class Returned_Delete_Servlet extends HttpServlet {

    /**
     * This servlet is responsive when the librarian declares if the set of books are returned
     * if lost the librarian will click delete to prevent adding the quantity back to the stock
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Returned_Delete_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            int borrow_id = Integer.parseInt(request.getParameter("borrow_id"));
            int book_id = Integer.parseInt(request.getParameter("book_id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String button = request.getParameter("button").trim();
            if(button.equals("returned")){
                String returnQuery = "UPDATE BOOKS SET BOOK_QUANTITY = (BOOK_QUANTITY + ?) WHERE BOOK_ID = ?";
                PreparedStatement stmt = conn.prepareStatement(returnQuery);
                stmt.setInt(1, quantity);
                stmt.setInt(2, book_id);
                int row = stmt.executeUpdate();

                String deleteBorrow = "DELETE FROM BORROWED_BOOKS WHERE BORROW_ID = ?";
                PreparedStatement stmt2 = conn.prepareStatement(deleteBorrow);
                stmt2.setInt(1, borrow_id);
                int row2 = stmt2.executeUpdate();

            }
            else if(button.equals("delete")){
                String deleteBorrow = "DELETE FROM BORROWED_BOOKS WHERE BORROW_ID = ?";
                PreparedStatement stmt2 = conn.prepareStatement(deleteBorrow);
                stmt2.setInt(1, borrow_id);
                int row2 = stmt2.executeUpdate();
            }else{
                System.out.print("Error");
            }
            response.sendRedirect("Librarian_Home.jsp");
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
