/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package views;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nigel
 */
public class Borrow_Books_Categories extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Borrow_Books_Categories</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Borrow_Books_Categories at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
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
