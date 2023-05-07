/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Borrowed_Book_Details;

/**
 *
 * @author nigel
 */
public class add_to_cart extends HttpServlet {

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
            out.println("<title>Servlet add_to_cart</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet add_to_cart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
        HttpSession session = request.getSession();
        ArrayList <Borrowed_Book_Details> cart = (ArrayList) session.getAttribute("cart");
        int id = Integer.parseInt(request.getParameter("book_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Borrowed_Book_Details detail;
        int book_id;
        String book_title;
        String book_author;
        Date due_date = new Date(System.currentTimeMillis() + 1209600000);
        try{
            if(conn != null){
                    String query = "SELECT * FROM BOOKS WHERE BOOK_ID = ?";
                    PreparedStatement stmt = conn.prepareStatement(query);
                    stmt.setInt(1, id);
                    ResultSet r = stmt.executeQuery();
                    if(r.next()){
                        book_id = Integer.parseInt(r.getString("BOOK_ID"));
                        book_title = r.getString("BOOK_TITLE");
                        book_author = r.getString("BOOK_AUTHOR");  
                        detail = new Borrowed_Book_Details(book_id, book_title, book_author, quantity, due_date); 
                        cart.add(detail);       
                        System.out.print("Addecd to list: "  + detail.getId());     
                        for(Borrowed_Book_Details b : cart){
                            System.out.print(b.getId());
                        }
                        request.getRequestDispatcher("View_cart.jsp").forward(request,response);
                    }
            }else{
                    System.out.print("Connection is null");
            }
            
        }catch(Exception e){
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
