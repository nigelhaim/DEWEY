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
            if(button.equals("Returned")){
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
            else if(button.equals("Delete")){
                String deleteBorrow = "DELETE FROM BORROWED_BOOKS WHERE BORROW_ID = ?";
                PreparedStatement stmt2 = conn.prepareStatement(deleteBorrow);
                stmt2.setInt(1, borrow_id);
                int row2 = stmt2.executeUpdate();
            }else{
                System.out.print("Error");
            }
            response.sendRedirect("Get_ORDERS");
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
