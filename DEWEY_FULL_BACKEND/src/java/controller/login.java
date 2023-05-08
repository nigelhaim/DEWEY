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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // Connection conn;
    // public void init(ServletConfig config) throws ServletException
    // {
          
    //     try{
    //         Class.forName(config.getInitParameter("jdbcClassName"));
    //         String username = config.getInitParameter("dbUserName");
    //         String password = config.getInitParameter("dbPassword");
            
    //         StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriverURL"))
    //                 .append("://")
    //                 .append(config.getInitParameter("dbHostName"))
    //                 .append(":")
    //                 .append(config.getInitParameter("dbPort"))
    //                 .append("/")
    //                 .append(config.getInitParameter("databaseName"));
    //                 //.append(config.getInitParameter(""));
                           
            
    //         conn = DriverManager.getConnection(url.toString(), username, password);
            
    //     }catch(SQLException sqle){
    //         System.out.print("An SQL Exception occur" + sqle.getMessage());
    //     } catch (ClassNotFoundException ex) {
    //         Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
    //     }
    // }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        /*try ( PrintWriter out = response.getWriter()) {
             TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/                        
        HttpSession session = request.getSession();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        int user_id = 1;
        // try{
            // ResultSet result = null;
            //     if(conn != null){
            //     String query = "SELECT * FROM MEMBER WHERE  MEMBER_UNAME = ?";
            //     PreparedStatement stmt = conn.prepareStatement(query);
            //     stmt.setString(1, username);
            //     result = stmt.executeQuery(query);
            //     if(result.wasNull()){
            //         query = "SELECT * FROM LIBRARIAN WHERE LIB_UNAME = ?";
            //         stmt = conn.prepareStatement(query);
            //         stmt.setString(1, username);
            //         result = stmt.executeQuery(query);
            //     }
            //     while(result.next()){
            //         if(username.equals(result.getString("MEMBER_UNAME")) && password.equals(result.getString("MEMBER_PASS"))){
            //             session.setAttribute("user", username);
            //             session.setAttribute("role", "member");
            //             response.sendRedirect("index.jsp");
            //         }
            //     }


        //     }
        // }catch(Exception e){
        //     System.out.print(e);
        // }

        if(username.equals("Member1NealG") && password.equals("PassNeal")){
            session.setAttribute("uname", username);
            session.setAttribute("role", "member");
            session.setAttribute("cart", new ArrayList <Borrowed_Book_Details>());
            session.setAttribute("user_id", user_id);  
            response.sendRedirect("index.jsp");
        }else if(username.equals("Lib1NathanielS") && password.equals("PassNatheniel")){
            session.setAttribute("uname", username);
            session.setAttribute("role", "librarian");
            response.sendRedirect("index.jsp");
        }
        else{
            response.sendRedirect("WrongCredentials.jsp");
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
