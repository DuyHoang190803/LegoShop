/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBContext;
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
import model.category;
import model.product;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "EditProductByAdmin", urlPatterns = {"/editProductByAdmin"})
public class EditProductByAdmin extends HttpServlet {

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
            out.println("<title>Servlet EditProductByAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductByAdmin at " + request.getContextPath() + "</h1>");
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
        try {
            PrintWriter out = response.getWriter();
            ProductDAO pd = new ProductDAO();

            int id = Integer.parseInt(request.getParameter("product_id"));

            product p = pd.getProductByID(id);

            List<category> categorys = pd.getCategorys();

            request.setAttribute("p", p);
            request.setAttribute("categorys", categorys);

            request.getRequestDispatcher("AdminEditProduct.jsp").forward(request, response);

        } catch (Exception ex) {
            Logger.getLogger(EditProductByAdmin.class.getName()).log(Level.SEVERE, null, ex);
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

        PrintWriter out = response.getWriter();
        ProductDAO pd = new ProductDAO();

        Part part = request.getPart("photo");

        int product_id = Integer.parseInt(request.getParameter("product_id"));

        String product_name = request.getParameter("product_name");
        int product_quantity = Integer.parseInt(request.getParameter("product_quantity"));
        float product_price = Float.parseFloat(request.getParameter("product_price"));
        String product_description = request.getParameter("product_description");
        String fileName = new File(part.getSubmittedFileName()).getName();
        String category_name = request.getParameter("category_name");

        category c = pd.getCategoryByName(category_name);
        int category_id = c.getCategory_id();

        if (fileName.isEmpty() || fileName == null) {
            String fileName1 = pd.getProductByID(product_id).getProduct_image();
            
            product p = new product(product_id, product_name, fileName1, product_quantity, product_price, product_description);
            category ct = new category(category_id, category_name);

            p.setCategory(ct);
            pd.updateProduct(p);
        } else {
            product p = new product(product_id, product_name, fileName, product_quantity, product_price, product_description);
            category ct = new category(category_id, category_name);

            p.setCategory(ct);
            pd.updateProduct(p);
        }

        String realPath = "D:\\Project_PRJ\\LegoShop\\web\\Image";

        File directory = new File(realPath);
        try {
            if (!directory.exists()) {
                boolean created = directory.mkdirs();
                if (created) {
                    out.println("thu muc da dc tao");
                    part.write(realPath + "/" + fileName);
                } else {
                    out.println("khong the tao thu muc");
                }
            } else {

                part.write(realPath + "/" + fileName);
            }

        } catch (Exception e) {

            List<product> products = pd.getProducts();
            request.setAttribute("ProductList", products);
            request.getRequestDispatcher("adminlist?name=product").forward(request, response);

        } finally {
            List<product> products = pd.getProducts();
            request.setAttribute("ProductList", products);
            request.getRequestDispatcher("adminlist?name=product").forward(request, response);

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
