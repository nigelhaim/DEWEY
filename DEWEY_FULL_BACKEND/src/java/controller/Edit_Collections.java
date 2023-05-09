/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
/**
 *
 * @author nigel
 */
@MultipartConfig(maxFileSize = 16177215)
public class Edit_Collections extends HttpServlet {

    /**
     * This servlet is responsible in adding books in the database
     * This can be accessed only by the librarian 
     * It completeley generates a new book in the database
     * The book cover is processed by converting the image to blob
     */
    Connection conn;
    String message = null;
    String key = null;
    int attempt = 0; 
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
                           
            System.out.println(url);
            conn = DriverManager.getConnection(url.toString(), username, password);
            key = config.getInitParameter("key");//Gets the string key from the web.xml
        }catch(SQLException sqle){
            System.out.print("An SQL Exception occur" + sqle.getMessage());
        }catch(ClassNotFoundException cnfe){
            System.out.println("ClassNotFound Exception occured: " + cnfe.getMessage());
        }
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.print("Uploading book");

        //Gets the book details
        String BOOK_TITLE = request.getParameter("title").trim();
        String BOOK_AUTHOR = request.getParameter("author").trim();
        String BOOK_TYPE = request.getParameter("type").trim();
        String BOOK_DESCRIPTION = request.getParameter("description").trim();
        int BOOK_QUANTITY = Integer.parseInt(request.getParameter("quantity").trim());
        InputStream inputStream = null;
        
        Part BOOK_COVER = request.getPart("cover");
        
        if(BOOK_COVER != null){
            System.out.println(BOOK_COVER.getName());
            System.out.println(BOOK_COVER.getSize());
            System.out.println(BOOK_COVER.getContentType());
            inputStream = BOOK_COVER.getInputStream();
        }
        
        try{
            if(conn != null){
                System.out.println("Conn is connected");
                String query = "INSERT INTO BOOKS (BOOK_TITLE, BOOK_AUTHOR, BOOK_TYPE, BOOK_DESCRIPTION, BOOK_QUANTITY, BOOK_COVER) values (?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(query); 
                stmt.setString(1, BOOK_TITLE);
                stmt.setString(2, BOOK_AUTHOR);
                stmt.setString(3, BOOK_TYPE);
                stmt.setString(4, BOOK_DESCRIPTION);
                stmt.setInt(5, BOOK_QUANTITY);
                if(inputStream != null){
                    stmt.setBlob(6, inputStream);
                }
                System.out.print(query);
                // sends the statement to the database server
                int row = stmt.executeUpdate();
                if (row > 0) {
                    message = "File uploaded and saved into database";
                }
            }
        }       
        catch(SQLException sqle){
            System.out.print(sqle.getMessage());
        }
        // sets the message in request scope
        request.setAttribute("Message", message);

        response.sendRedirect(request.getContextPath() + "/Get_Books");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
