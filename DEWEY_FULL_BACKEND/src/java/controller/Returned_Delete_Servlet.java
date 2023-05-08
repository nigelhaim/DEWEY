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
import java.sql.SQLException;
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
public class Returned_Delete_Servlet extends HttpServlet {

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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Returned_Delete_Servlet.class.getName()).log(Level.SEVERE, null, ex);
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
            out.println("<title>Servlet Returned_Delete_Servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Returned_Delete_Servlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
        try{
            int borrow_id = Integer.parseInt(request.getParameter("borrow_id"));
            int book_id = Integer.parseInt(request.getParameter("book_id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String button = request.getParameter("button").trim();
            if(button.equals("returned")){
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
            else if(button.equals("delete")){
                String deleteBorrow = "DELETE FROM BORROWED_BOOKS WHERE BORROW_ID = ?";
                PreparedStatement stmt2 = conn.prepareStatement(deleteBorrow);
                stmt2.setInt(1, borrow_id);
                int row2 = stmt2.executeUpdate();
            }else{
                System.out.print("Error");
            }
            response.sendRedirect("Librarian_Home.jsp");
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
