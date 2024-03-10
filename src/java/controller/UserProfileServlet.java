/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import model.User;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "UserProfileServlet", urlPatterns = {"/profile"})
public class UserProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet UserProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserProfileServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User u;
        if ((u = (User) session.getAttribute("account")) == null) {
            response.sendRedirect("login.jsp");
        } else {
            u = (User) session.getAttribute("account");
            request.setAttribute("user", u);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
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
        //  processRequest(request, response);
        HttpSession ss = request.getSession();
        PrintWriter out = response.getWriter();
        UserDAO ud = new UserDAO();

        Part part = request.getPart("photo");

        String btn = request.getParameter("btn");

        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String email = request.getParameter("mail");
        String phone = request.getParameter("phone");
        String image = request.getParameter("image");
        String image_raw = new File(part.getSubmittedFileName()).getName();
        int id = Integer.parseInt(request.getParameter("id"));
        String realPath = "D:\\Project_PRJ\\LegoShop\\web\\Image";

        if (btn.equals("Edit")) {

            if (image_raw.isEmpty() || image_raw == null) {

                User u = new User(id, name, pass, email, phone, image);
                ud.updateUserProfile(u);
                request.getRequestDispatcher("login").forward(request, response);
            } else {
                User u = new User(id, name, pass, email, phone, image_raw);
                ud.updateUserProfile(u);
                try {
                    part.write(realPath + "/" + image_raw);
                } catch (Exception e) {
                    ss.setAttribute("image_raw", image_raw);

                    request.getRequestDispatcher("login").forward(request, response);
                } finally {

                    request.getRequestDispatcher("login").forward(request, response);
                }
            }

        } else if (btn.equals("Cancel")) {
            response.sendRedirect("home");
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
