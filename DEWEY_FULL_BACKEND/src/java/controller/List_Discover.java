/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nigel
 */
public class List_Discover extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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
         /*try ( PrintWriter out = response.getWriter()) {
            TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet List_Discover</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet List_Discover at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
        try{
            ArrayList<Object> Literature_books = new ArrayList();
            ArrayList<Object> Scifi_books = new ArrayList();
            ArrayList<Object> Programming_books = new ArrayList();
            if(conn != null){
                String query = "SELECT * FROM BOOKS";
                PreparedStatement stmt = conn.prepareStatement(query);
                ResultSet books = stmt.executeQuery();
                while(books.next()){
                    switch(books.getString("BOOK_TYPE")){
                        case "Literature":
                            System.out.print("Literature: " + books.getString("BOOK_ID"));
                            Literature_books.add(books.getObject(1));
                            break;
                        case "Sci-fi":
                            System.out.print("Sci-fi: " + books.getString("BOOK_ID"));
                            Scifi_books.add(books.getObject(1));
                            break;
                        case "Programming":
                            System.out.print("Programming: " + books.getString("BOOK_ID"));
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
