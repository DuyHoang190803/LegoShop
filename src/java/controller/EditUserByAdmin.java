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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import model.product;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "EditUser", urlPatterns = {"/editUser"})
public class EditUserByAdmin extends HttpServlet {

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
            out.println("<title>Servlet EditUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditUser at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();

        int id = Integer.parseInt(request.getParameter("user_id"));

//        out.print(out);
        UserDAO a = new UserDAO();

        User u = a.getUserById(id);
        //out.print(u);

        request.setAttribute("u", u);
        request.getRequestDispatcher("AdminEditUser.jsp").forward(request, response);

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
        PrintWriter out = response.getWriter();
        UserDAO ud = new UserDAO();
        ProductDAO pd = new ProductDAO();
        List<User> users = ud.getUser();

        Part part = request.getPart("photo");

        int id = Integer.parseInt(request.getParameter("ID"));

        String name = request.getParameter("Name");
        String password = request.getParameter("Password");
        String email = request.getParameter("Email");
        String phone = request.getParameter("Phone");
        String fileName = new File(part.getSubmittedFileName()).getName();
        String realPath = "D:\\Project_PRJ\\LegoShop\\web\\Image";

        
        if (fileName.isEmpty() || fileName == null) {
            String fileName1 = ud.getUserById(id).getUser_image();
            User u = new User(id, name, password, email, phone, fileName1);
            ud.updateUser(u);
            request.getRequestDispatcher("adminlist").forward(request, response);

        } else {
            User u = new User(id, name, password, email, phone, fileName);
            ud.updateUser(u);
            try {
                part.write(realPath + "/" + fileName);
            } catch (Exception e) {
                request.getRequestDispatcher("adminlist").forward(request, response);
            } finally {
                request.getRequestDispatcher("adminlist").forward(request, response);
            }
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
