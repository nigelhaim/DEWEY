/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.*;
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
public class login extends HttpServlet {

    /**
     * This is not an official servlet this is just only a temporary 
     * testing if the sign in user is a member or librarian 
     */

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");                    
        HttpSession session = request.getSession();
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        int user_id = 1;
        ArrayList<Object> search = new ArrayList();
        session.setAttribute("search", search);
        if(username.equals("Member1NealG") && password.equals("PassNeal")){
            session.setAttribute("uname", username);
            session.setAttribute("role", "member");
            session.setAttribute("cart", new ArrayList <Borrowed_Book_Details>());
            session.setAttribute("user_id", user_id);  
            response.sendRedirect("User_Home");
        }else if(username.equals("Lib1NathanielS") && password.equals("PassNathaniel")){
            session.setAttribute("uname", username);
            session.setAttribute("role", "librarian");
            response.sendRedirect("Get_ORDERS");
        }
        else{
            response.sendRedirect("WrongCredentials.jsp");
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
