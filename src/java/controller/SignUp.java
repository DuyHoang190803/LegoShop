/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.User;

/**
 *
 * @author Hoang's LEGION
 */
public class SignUp extends HttpServlet {

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
            out.println("<title>Servlet LoginSignUp</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginSignUp at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();

        try {
            UserDAO ud = new UserDAO();
            List<User> user = ud.getUser();
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            boolean error = true;
            if ((username.trim() == "") || username == null) {
                error = false;
            }
            if (!isValidPassword(password) || password == null) {
                error = false;
            }
            if (email.trim() != "") {
                if (!isValidEmail(email)) {
                    error = false;
                }
            }
            if (!phone.matches("[0-9]+") || phone == null) {
                error = false;
            }

            if (username.equals("HoangBDHE176159") && password.equals("BDHoang1908")) {

            }

            boolean found = true;
            for (User user1 : user) {
                if (username.equals(user1.getUser_name()) && password.equals(user1.getUser_password())) {
                    found = false;
                    String msg2 = "Tai Khoan Nay Da Ton Tai";
                    request.setAttribute("data3", msg2);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }

            if (found) {
                if (error) {
                    User u = new User(username, password, email, phone);
                    String msg1 = "Dang ky thanh cong";
                    request.setAttribute("data2", msg1);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    try {
                        ud.insertUser(u);
                    } catch (SQLException ex) {
                        Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    String msg = "Thong tin dang ky khong hop le";
                    request.setAttribute("data1", msg);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static boolean isValidEmail(String email) {
        String regex = "^[A-Z0-9a-z]+@[A-Za-z0-9]+\\.[A-Za-z]{2,4}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public static boolean isValidPassword(String password) {
        String regex = "^(?=.*[0-9]).{8,}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
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
