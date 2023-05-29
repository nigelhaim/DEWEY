/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package views;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author nigel
 */
public class Search extends HttpServlet {
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
            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("book_id"));
        String author = request.getParameter("author");
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        try{
            HttpSession session = request.getSession();
            ArrayList<Object> search = (ArrayList) session.getAttribute("search");
            search.clear();
            String query = "SELECT * FROM BOOKS WHERE BOOK_ID = ? OR BOOK_AUTHOR = ? OR BOOK_TYPE = ? OR BOOK_TITLE = ?";
            //Selects books from the database based from the given parameters
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);
            stmt.setString(2, author);
            stmt.setString(3, category);
            stmt.setString(4, title);
            ResultSet books = stmt.executeQuery();
            while(books.next()){
                System.out.print("Searched book");
                search.add(books.getObject(1));
            }
            session.setAttribute("search", search);
            request.getRequestDispatcher("Search.jsp").forward(request,response);
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
