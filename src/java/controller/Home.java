/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Item;
import model.User;
import model.category;
import model.product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Home", urlPatterns = {"/home"})
public class Home extends HttpServlet {

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

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        ProductDAO pd = new ProductDAO();

        User u;
        if ((u = (User) session.getAttribute("account")) == null) {
            response.sendRedirect("login.jsp");
        } else {
            String usercart = "cart" + u.getUser_id();
            ProductDAO d = new ProductDAO();
            List<product> list = d.getAll();
            Cookie[] arr = request.getCookies();
            String txt = "";
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals(usercart)) {
                        txt += o.getValue();
                    }
                }
            }
            Cart cart = new Cart(txt, list);
            List<Item> listItem = cart.getItems();

            int n;
            if (listItem != null) {
                n = listItem.size();
            } else {
                n = 0;
            }

            
            List<product> products = pd.getProducts();
            List<product> top3Products = pd.getTop3NewestProducts();
            List<category> cate = pd.getCategorys();

            session.setAttribute("cate", cate);
            session.setAttribute("Top3ProductList", top3Products);
            session.setAttribute("ProductList", products);
            request.setAttribute("size", n);
            //  request.setAttribute("data", list);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }

//        HttpSession session = request.getSession();
//        ProductDAO pd = new ProductDAO();
//        List<product> products = pd.getProducts();
//
//        session.setAttribute("ProductList", products);
//        response.sendRedirect("home.jsp");
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
