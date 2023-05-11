/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package views;

import java.io.*;
import java.sql.*;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author nigel
 */
public class Borrow_Books_Categories extends HttpServlet {

    /**
     * This servlet is responsible for getting the books based on categories 
     * The default is all of the books but the user can also select the category based on
     * the drop down selection in the Borrow_page.jsp
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try{
            String category = request.getParameter("category");
            //System.out.print(category);
            if(category.equals("all")){
                if(conn != null){
                    String query = "SELECT * FROM BOOKS";
                    PreparedStatement stmt = conn.prepareStatement(query);
                    ResultSet books = stmt.executeQuery();
                    request.setAttribute("categorized_books", books);
                    request.getRequestDispatcher("Borrow_Page.jsp").forward(request,response);
                }else{
                    System.out.print("Connection is null");
                }
            }else{
                 String query = "SELECT * FROM BOOKS WHERE BOOK_TYPE = ?";
                    PreparedStatement stmt = conn.prepareStatement(query);
                    stmt.setString(1, category);
                    ResultSet books = stmt.executeQuery();
                    request.setAttribute("categorized_books", books);
                    request.getRequestDispatcher("Borrow_Page.jsp").forward(request,response);
            }
        }
        catch(Exception e){
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
