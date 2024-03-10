/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ChangePass", urlPatterns = {"/changePass"})
public class ChangePass extends HttpServlet {

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
            out.println("<title>Servlet ChangePass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePass at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        String CurrentPass = request.getParameter("user_password");

        session.setAttribute("CurrentPass", CurrentPass);
        request.getRequestDispatcher("changepass.jsp").forward(request, response);

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

        //processRequest(request, response);
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String CurrentPassword1 = request.getParameter("CurrentPassword1");
        String CurrentPassword2 = request.getParameter("CurrentPassword2");
        String NewPassword = request.getParameter("NewPassword");
        String ConfirmPassword = request.getParameter("ConfirmPassword");
        String err = "Invalid Information";

        if (CurrentPassword1.equals(CurrentPassword2)) {
            if (NewPassword.trim() != "" && ConfirmPassword.trim() != "") {
                if (NewPassword.equals(ConfirmPassword)) {
                    UserDAO a = new UserDAO();
                    a.changePassUser(ConfirmPassword, CurrentPassword1);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("changepass.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("err", err);
                request.getRequestDispatcher("changepass.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("err", err);
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        }
        // request.setAttribute("CurrentPass", CurrentPass);
//        session.setAttribute("CurrentPass", CurrentPass);
//        request.getRequestDispatcher("changepass.jsp").forward(request, response);
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
