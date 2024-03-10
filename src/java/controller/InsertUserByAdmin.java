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
@WebServlet(name = "InsertUser", urlPatterns = {"/insertUser"})
public class InsertUserByAdmin extends HttpServlet {

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
            out.println("<title>Servlet InsertUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertUser at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("AdminInsertUser.jsp").forward(request, response);
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

        Part part = request.getPart("photo");

        String name = request.getParameter("Name");
        String password = request.getParameter("Password");
        String email = request.getParameter("Email");
        String phone = request.getParameter("Phone");
        String fileName = new File(part.getSubmittedFileName()).getName();

        User u = new User(name, password, email, phone, fileName);
        String realPath = "D:\\Project_PRJ\\LegoShop\\web\\Image";

        try {
            // Thử chèn người dùng vào cơ sở dữ liệu
            ud.insertUser(u);

            // Lưu tệp ảnh vào thư mục
            part.write(realPath + File.separator + fileName);

            // Điều hướng đến trang "adminlist" sau khi thêm người dùng thành công
            response.sendRedirect("adminlist");
        } catch (Exception ex) {
            // Xử lý lỗi và điều hướng lại trang "adminlist" trong trường hợp lỗi
            Logger.getLogger(InsertUserByAdmin.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher("adminlist").forward(request, response);
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
