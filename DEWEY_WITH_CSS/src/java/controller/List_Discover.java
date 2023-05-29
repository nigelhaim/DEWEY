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
public class List_Discover extends HttpServlet {

    /**
     * This servlet gets all the books from the database
     * and sorts them in ArrayLists depending on their book type 
     * it will be forwarded to discover.sql
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
            Logger.getLogger(List_Discover.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        response.setContentType("text/html;charset=UTF-8");
        try{
            ArrayList<Object> Literature_books = new ArrayList();
            ArrayList<Object> Scifi_books = new ArrayList();
            ArrayList<Object> Programming_books = new ArrayList();
            if(conn != null){
                String query = "SELECT * FROM BOOKS";//Selects all the books from the database 
                PreparedStatement stmt = conn.prepareStatement(query);
                ResultSet books = stmt.executeQuery();
                while(books.next()){
                    //Sorts their respective ArrayList based their book type
                    switch(books.getString("BOOK_TYPE")){
                        case "Literature":
                            //System.out.print("Literature: " + books.getString("BOOK_ID"));
                            Literature_books.add(books.getObject(1));
                            break;
                        case "Sci-fi":
                            //System.out.print("Sci-fi: " + books.getString("BOOK_ID"));
                            Scifi_books.add(books.getObject(1));
                            break;
                        case "Programming":
                            //System.out.print("Programming: " + books.getString("BOOK_ID"));
                            Programming_books.add(books.getObject(1));
                            break;
                    }       
                }
                request.setAttribute("books_Literature", Literature_books);
                request.setAttribute("books_Scifi", Scifi_books);
                request.setAttribute("books_Programming", Programming_books);
                request.getRequestDispatcher("Discover.jsp").forward(request,response);
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
