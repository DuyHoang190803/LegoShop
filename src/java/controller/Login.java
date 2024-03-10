/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import model.product;

/**
 *
 * @author Hoang's LEGION
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        // processRequest(request, response);
        request.getRequestDispatcher("login.jsp").forward(request, response);
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

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        UserDAO ud = new UserDAO();

        String userName = request.getParameter("username");
        String passWord = request.getParameter("password");
        String r = request.getParameter("rem");

        // tao 3 cookies: user , pass, remember me
        Cookie c1 = new Cookie("cuser", userName);
        Cookie c2 = new Cookie("cpass", passWord);
        Cookie c3 = new Cookie("crem", r);

        if (r != null) {
            // co chon
            c1.setMaxAge(60 * 60 * 24 * 7);
            c2.setMaxAge(60 * 60 * 24 * 7);
            c3.setMaxAge(60 * 60 * 24 * 7);
        } else {
            // khong chon
            c1.setMaxAge(0);
            c2.setMaxAge(0);
            c3.setMaxAge(0);
        }
        // luu vao brower
        response.addCookie(c1);
        response.addCookie(c2);
        response.addCookie(c3);

        if (ud.getAccount(userName, passWord) != null) {
            if (userName.equals("HoangBDHE176159") && passWord.equals("HoangBDHE176159")) {
//                List<User> users = ud.getUser();
//                request.setAttribute("UserList", users);
                request.getRequestDispatcher("adminlist").forward(request, response);
            } else {
                session.setAttribute("account", ud.getAccount(userName, passWord));
                response.sendRedirect("home");
            }
        } else {
            String err = "Wrong UserName or PassWord!!!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

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
