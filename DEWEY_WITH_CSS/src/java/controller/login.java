/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.http.*;
import model.Borrowed_Book_Details;

/**
 *
 * @author nigel
 */
public class login extends HttpServlet {

    Connection conn;
    private int marcher = 0;
    PreparedStatement ps;
    Statement stmt;
    ResultSet rs, records;
    int user_id = 1;

    public void init() throws ServletException {
        try {
            Class.forName(getServletContext().getInitParameter("jdbcClassName"));
            //System.out.println("jdbcClassName: " + config.getInitParameter("jdbcClassName"));
            String username = getServletContext().getInitParameter("dbUserName");
            String password = getServletContext().getInitParameter("dbPassword");
            StringBuffer url = new StringBuffer(getServletContext().getInitParameter("jdbcDriverURL"))
                    .append("://")
                    .append(getServletContext().getInitParameter("dbHostName"))
                    .append(":")
                    .append(getServletContext().getInitParameter("dbPort"))
                    .append("/")
                    .append(getServletContext().getInitParameter("databaseName"));
            conn = DriverManager.getConnection(url.toString(), username, password);
        } catch (SQLException sqle) {
            System.out.println("SQLException error occured - "
                    + sqle.getMessage());
        } catch (ClassNotFoundException nfe) {
            System.out.println("ClassNotFoundException error occured - "
                    + nfe.getMessage());
        }

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Member Access

        //Librarian Access
        try {
            HttpSession session = request.getSession();

            String username = request.getParameter("username").trim();
            String password = request.getParameter("password").trim();

            String query = "SELECT * FROM LIBRARIAN WHERE LIB_UNAME = ? AND LIB_PASS = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, username); //for first value --> email/username
            ps.setString(2, password); //for second value --> password

            rs = ps.executeQuery();
            
            session.setAttribute("search", new ArrayList<Borrowed_Book_Details>());
            
            if (conn != null && rs.next()) {
                stmt = conn.createStatement();
                session.setAttribute("uname", username);
                session.setAttribute("role", "librarian");
                response.sendRedirect("Get_ORDERS");
            } else {

                String query1 = "SELECT * FROM MEMBER WHERE MEMBER_UNAME = ? AND MEMBER_PASS = ?";
                ps = conn.prepareStatement(query1);
                ps.setString(1, username); //for first value --> email/username
                ps.setString(2, "PassNathaniel"); //for second value --> password

                rs = ps.executeQuery();

                if (conn != null && rs.next()) {
                    stmt = conn.createStatement();
                    session.setAttribute("uname", username);
                    session.setAttribute("role", "member");
                    session.setAttribute("cart", new ArrayList<Borrowed_Book_Details>());
                    session.setAttribute("user_id", user_id);
                    response.sendRedirect("User_Home");
                } else {
                    marcher++;
                    if (marcher < 3) {
                        response.sendRedirect("./WrongCredentials.jsp"); //when wrong credentials are inputted
                    } else if (marcher >= 3) {
                        response.sendRedirect("MaxAttempts.jsp"); //when attempt 3 has been maximized and wrong credentials are still used
                        marcher = 0; //resets the counter back to 0
                    }
                }
            }
        } catch (SQLException sqle) {
            response.sendRedirect("ConnError.jsp");
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
