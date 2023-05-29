/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package views;

import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author nigel
 */
public class Get_Books extends HttpServlet {
  
    Connection conn;
    public void init(ServletConfig config) throws ServletException
    {
        /**
         * A simple servlet that gets all the books
         */
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
            Logger.getLogger(Get_Books.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try{
            if(conn != null){
                String query = "SELECT * FROM BOOKS";
                PreparedStatement stmt = conn.prepareStatement(query);
                ResultSet books = stmt.executeQuery();
                request.setAttribute("books", books);
                request.getRequestDispatcher("Edit_collections.jsp").forward(request,response);
            }else{
                System.out.print("Connection is null");
            }
        }catch(SQLException sqle){
            System.out.print("Exception:" + sqle);
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
