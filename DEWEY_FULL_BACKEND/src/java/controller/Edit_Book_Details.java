/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.ServletConfig;

/**
 *
 * @author nigel
 */
public class Edit_Book_Details extends HttpServlet {

    /**
     * This servlet updates the book quantity when the librarian presses the plus
     * or minus button in every book in the Edit_collections.jsp
     * 
     * It is also responsibe in deleting books through the checkbox and delete button
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
        //Deletes the books from the collections it can have multiple books 
        try{
            String button = request.getParameter("button").trim();
            if(button.equals("Delete")){
                System.out.print("Delete books");
                String books[] = request.getParameterValues("books");
                for (String book : books) {
                    int BOOK_ID = Integer.parseInt(book);
                    System.out.println("Book id to be Deleted: " + BOOK_ID);
                    if(conn != null){
                        String query = "DELETE FROM BOOKS WHERE BOOK_ID = ?";
                        PreparedStatement stmt = conn.prepareStatement(query);
                        stmt.setInt(1, BOOK_ID);
                        int row = stmt.executeUpdate();
                    }
                }
            }
            else{
                //Processes the incrementing and decrementing number of books in stock
                if(conn != null){
                    int id = Integer.parseInt(request.getParameter("BOOK_ID"));
                    int quantity = Integer.parseInt(request.getParameter("BOOK_QUANTITY"));
                    
                    switch(button){
                        case "":
                            System.out.print("Button is null");
                            break;
                        case "+":
                            System.out.print("Activated button: " + button);
                            String q = "UPDATE BOOKS SET BOOK_QUANTITY = BOOK_QUANTITY + 1 WHERE BOOK_ID = ?";
                            PreparedStatement s = conn.prepareStatement(q);
                            s.setInt(1, id);
                            int rstatement = s.executeUpdate();
                            System.out.print("Incremented");
                            break;
                        case "-":
                            String qry = "UPDATE BOOKS SET BOOK_QUANTITY = BOOK_QUANTITY - 1 WHERE BOOK_ID = ?";
                            PreparedStatement statement = conn.prepareStatement(qry);
                            statement.setInt(1, id);
                            int r = statement.executeUpdate();
                            break;
                    }
                }else{
                    System.out.print("Connection is null");
                }               
            }
        }catch(Exception e){
            System.out.print(e.getMessage());
        }
        response.sendRedirect(request.getContextPath() + "/Get_Books");
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
