/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
public class RenderImage extends HttpServlet {

    /**
     * This is responsible for rendering the book covers it needs improvement since
     * it sometimes does not render well on the browser I will explain it soon 
     * 
     * P.S honestly I have no idea how this works I just copy paste it from the internet
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
            Logger.getLogger(RenderImage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String id = request.getParameter("BOOK_ID");
        System.out.print("Book id: " + id);
        
        try{
            if(conn != null){
                String query = "SELECT BOOK_COVER FROM BOOKS WHERE BOOK_ID = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, id);  
                ResultSet cover = stmt.executeQuery();
                String imglen = "";
                if (cover.next()){
                    imglen = cover.getString(1);
                    //System.out.println("Image length: " + imglen.length());
                    int len = imglen.length();
                    byte [] r = new byte[len];
                    InputStream readImg = cover.getBinaryStream(1);
                    int index=readImg.read(r, 0, len); 
                    stmt.close();
                    response.reset();
                    response.setContentType("image/jpg");
                    response.getOutputStream().write(r,0,len);
                    response.getOutputStream().flush(); 
                }
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
