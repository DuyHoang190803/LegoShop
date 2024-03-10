/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ProductDAO;
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
import java.util.List;
import model.category;
import model.product;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "InsertProductByAdmin", urlPatterns = {"/insertProductByAdmin"})
public class InsertProductByAdmin extends HttpServlet {

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
            out.println("<title>Servlet InsertProductByAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertProductByAdmin at " + request.getContextPath() + "</h1>");
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
        //   processRequest(request, response);
        ProductDAO pd = new ProductDAO();
        List<category> categorys = pd.getCategorys();
        request.setAttribute("categorys", categorys);
        request.getRequestDispatcher("admininsertproduct.jsp").forward(request, response);
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
        // processRequest(request, response);
        PrintWriter out = response.getWriter();
        Part part = request.getPart("photo");
        ProductDAO pd = new ProductDAO();

        String realPath = "D:\\Project_PRJ\\LegoShop\\web\\Image";
        String category_name = request.getParameter("category_name");
        String product_image = new File(part.getSubmittedFileName()).getName();
        int category_id = pd.getCategoryByName(category_name).getCategory_id();
        String product_name = request.getParameter("product_name");

        try {
            int product_quantity = Integer.parseInt(request.getParameter("product_quantity"));
            float product_price = Float.parseFloat(request.getParameter("product_price"));

            String product_des = request.getParameter("product_description");

            product p = new product(product_name, product_image, product_quantity, product_price, product_des);
            category c = new category(category_id, category_name);
            p.setCategory(c);

            pd.insertProduct(p, category_id);

            // Lưu tệp ảnh vào thư mục
            part.write(realPath + "/" + product_image);

            // Điều hướng đến trang "adminlist" sau khi thêm sản phẩm thành công
            response.sendRedirect("adminlist");
        } catch (Exception e) {
            // Xử lý lỗi và điều hướng lại trang "admininsertproduct" trong trường hợp lỗi
            List<category> categorys = pd.getCategorys();
            request.setAttribute("categorys", categorys);
            String msg = "Please input valid information to create a product.";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("admininsertproduct.jsp").forward(request, response);
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
