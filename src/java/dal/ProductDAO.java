/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Item;
import model.User;
import model.category;
import model.product;

/**
 *
 * @author Admin
 */
public class ProductDAO extends DBContext {

    public List<product> getProducts() {
        List<product> products = new ArrayList<>();
        try {
            String sqlQuery = "select p.product_id,p.product_image,p.product_name,p.product_price,p.product_quantity,p.product_description,c.category_id,c.category_name from category c, product p where c.category_id = p.category_id";
            PreparedStatement stm = getConnection().prepareStatement(sqlQuery);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                product p = new product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_image(rs.getString("product_image"));
                p.setProduct_name(rs.getString("product_name"));
                p.setProduct_price(rs.getFloat("product_price"));
                p.setProduct_quantity(rs.getInt("product_quantity"));
                p.setProduct_description(rs.getString("product_description"));

                category c = new category();
                c.setCategory_id(rs.getInt("category_id"));
                c.setCateegory_name(rs.getString("category_name"));

                p.setCategory(c);
                products.add(p);
            }
        } catch (Exception e) {
        }
        return products;
    }

    public List<product> getAll() {
        List<product> products = new ArrayList<>();
        try {
            String sqlQuery = "select p.product_id,p.product_image,p.product_name,p.product_price,p.product_quantity,p.product_description,c.category_id,c.category_name from category c, product p where c.category_id = p.category_id";
            PreparedStatement stm = getConnection().prepareStatement(sqlQuery);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                product p = new product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_image(rs.getString("product_image"));
                p.setProduct_name(rs.getString("product_name"));
                p.setProduct_price(rs.getFloat("product_price"));
                p.setProduct_quantity(rs.getInt("product_quantity"));
                p.setProduct_description(rs.getString("product_description"));

                products.add(p);
            }
        } catch (Exception e) {
        }
        return products;
    }

    public List<product> getTop3NewestProducts() {
        List<product> products = new ArrayList<>();
        try {
            String sqlQuery = "SELECT TOP (3) *\n"
                    + "FROM [product]\n"
                    + "order by product_id desc";
            PreparedStatement stm = getConnection().prepareStatement(sqlQuery);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                product p = new product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_image(rs.getString("product_image"));
                p.setProduct_name(rs.getString("product_name"));
                p.setProduct_price(rs.getFloat("product_price"));
                p.setProduct_quantity(rs.getInt("product_quantity"));
                p.setProduct_description(rs.getString("product_description"));
                products.add(p);
            }
        } catch (Exception e) {
        }
        return products;
    }

    public void deleteProduct(int id) {
        try {

            String sqlQuery = "DELETE FROM [product] WHERE [product_id] = ?";
            PreparedStatement statement = getConnection().prepareStatement(sqlQuery);
            statement.setInt(1, id);

            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<product> getProductsSort(String Cot, String Flow) {
        List<product> products = new ArrayList<>();
        try {

            //   String sqlQuery = "SELECT s.RollCode, s.FullName, s.DoB, s.Gender, m.Major FROM Student s JOIN Major m ON s.RollCode = m.RollCode ORDER BY " + cot + " ASC;";
            String sqlQuery = "select p.product_id, c.category_id,c.category_name,p.product_name,p.product_image,p.product_quantity,p.product_price\n"
                    + "from [category] c join[product] p on c.category_id = p.category_id\n"
                    + "ORDER BY " + Cot + " " + Flow + ";";
            PreparedStatement stm = getConnection().prepareStatement(sqlQuery);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                product p = new product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_image(rs.getString("product_image"));
                p.setProduct_name(rs.getString("product_name"));
                p.setProduct_price(rs.getFloat("product_price"));
                p.setProduct_quantity(rs.getInt("product_quantity"));

                category c = new category();
                c.setCategory_id(rs.getInt("category_id"));
                c.setCateegory_name(rs.getString("category_name"));

                p.setCategory(c);
                products.add(p);
            }

        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public void updateProduct(product product) {
        try {

            String sqlQuery = "UPDATE [product] \n"
                    + "SET [category_id] = ?, [product_name] = ?, [product_quantity] = ?, [product_price] = ? , [product_image] = ?, [product_description] = ? \n"
                    + "WHERE [product_id] = ?";
            PreparedStatement statement = getConnection().prepareStatement(sqlQuery);

            statement.setInt(1, product.getCategory().getCategory_id());
            statement.setString(2, product.getProduct_name());
            statement.setInt(3, product.getProduct_quantity());
            statement.setFloat(4, product.getProduct_price());
            statement.setString(5, product.getProduct_image());
            statement.setString(6, product.getProduct_description());
            statement.setInt(7, product.getProduct_id());

            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertProduct(product p, int categoryID) throws Exception {
        try {
            String sqlQuery = "INSERT INTO [product] ([category_id], [product_name], [product_image], [product_quantity],[product_price],[product_description])\n"
                    + "VALUES (?, ?, ?, ?, ?,?);";
            PreparedStatement statement = getConnection().prepareStatement(sqlQuery);
            statement.setInt(1, categoryID);
            statement.setString(2, p.getProduct_name());
            statement.setString(3, p.getProduct_image());
            statement.setInt(4, p.getProduct_quantity());
            statement.setFloat(5, p.getProduct_price());
            statement.setString(6, p.getProduct_description());
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<product> searchProductsByName(String name) {
        List<product> products = new ArrayList<>();
        try {
            String sqlQuery = "select p.product_id,p.product_image,p.product_name,p.product_price,p.product_quantity,p.product_description,c.category_id,c.category_name \n"
                    + "from category c, product p \n"
                    + "where c.category_id = p.category_id and product_name LIKE ?;";
            PreparedStatement stm = getConnection().prepareStatement(sqlQuery);
            stm.setString(1, "%" + name + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                product p = new product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_image(rs.getString("product_image"));
                p.setProduct_name(rs.getString("product_name"));
                p.setProduct_price(rs.getFloat("product_price"));
                p.setProduct_quantity(rs.getInt("product_quantity"));
                p.setProduct_description(rs.getString("product_description"));

                category c = new category();
                c.setCategory_id(rs.getInt("category_id"));
                c.setCateegory_name(rs.getString("category_name"));

                p.setCategory(c);
                products.add(p);
            }
        } catch (Exception e) {
        }
        return products;
    }

    public List<product> searchProductsByCategoryName(String name) {
        List<product> products = new ArrayList<>();
        try {
            String sqlQuery = "select p.product_id,p.product_image,p.product_name,p.product_price,p.product_quantity,p.product_description,c.category_id,c.category_name \n"
                    + "from category c, product p \n"
                    + "where c.category_id = p.category_id and c.category_name = ?";
            PreparedStatement stm = getConnection().prepareStatement(sqlQuery);
            stm.setString(1,  name );
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                product p = new product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_image(rs.getString("product_image"));
                p.setProduct_name(rs.getString("product_name"));
                p.setProduct_price(rs.getFloat("product_price"));
                p.setProduct_quantity(rs.getInt("product_quantity"));
                p.setProduct_description(rs.getString("product_description"));

                category c = new category();
                c.setCategory_id(rs.getInt("category_id"));
                c.setCateegory_name(rs.getString("category_name"));

                p.setCategory(c);
                products.add(p);
            }
        } catch (Exception e) {
        }
        return products;
    }

    // without caategory
    public product getProductById(int id) {

        try {
            String sqlQuery = "select* from [product]\n"
                    + "where product_id = ?";
            PreparedStatement stm = getConnection().prepareStatement(sqlQuery);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                return new product(rs.getInt("product_id"), rs.getString("product_name"), rs.getString("product_image"), rs.getInt("product_quantity"), rs.getFloat("product_price"), rs.getString("product_description"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    // with caategory
    public product getProductByID(int id) {
        product p = null;
        try {
            String sqlQuery = "select p.product_id,p.product_image,p.product_name,p.product_price,p.product_quantity,p.product_description,c.category_id,c.category_name \n"
                    + "from category c, product p \n"
                    + "where c.category_id = p.category_id and product_id = ?";
            PreparedStatement statement = getConnection().prepareStatement(sqlQuery);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                p = new product();
                p.setProduct_id(rs.getInt("product_id"));
                p.setProduct_image(rs.getString("product_image"));
                p.setProduct_name(rs.getString("product_name"));
                p.setProduct_price(rs.getFloat("product_price"));
                p.setProduct_quantity(rs.getInt("product_quantity"));
                p.setProduct_description(rs.getString("product_description"));

                category c = new category();
                c.setCategory_id(rs.getInt("category_id"));
                c.setCateegory_name(rs.getString("category_name"));

                p.setCategory(c);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    public List<category> getCategorys() {
        List<category> categorys = new ArrayList<>();
        try {
            String sql = "SELECT c.category_id, c.category_name FROM category c";
            PreparedStatement statement = getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                category c = new category();
                c.setCategory_id(rs.getInt("category_id"));
                c.setCateegory_name(rs.getString("category_name"));
                categorys.add(c);
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return categorys;
    }

    public category getCategoryByName(String name) {
        category c = null;
        try {
            String sqlQuery = "SELECT [category_id], [category_name] FROM [category] WHERE [category_name] = ?";
            PreparedStatement statement = getConnection().prepareStatement(sqlQuery);
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                c = new category();
                c.setCategory_id(rs.getInt("category_id"));
                c.setCateegory_name(rs.getString("category_name"));
            }
        } catch (Exception ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }

    public void addOrder(User u, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            // add order
            String sql = "INSERT into [order] ( user_id, price, date) \n"
                    + "VALUES ( ?,?,? )";
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setInt(1, u.getUser_id());
            stm.setDouble(2, cart.getTotalMoney());
            stm.setString(3, date);
            stm.executeUpdate();
            // lay id cua order vua add vao
            String sql1 = "Select top 1 order_id from [order] order by order_id desc";
            PreparedStatement stm1 = getConnection().prepareStatement(sql1);
            ResultSet rs = stm1.executeQuery();
            // add vao bang OrderDetail
            if (rs.next()) {
                int oid = rs.getInt("order_id");
                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT [order_detail] ( order_id, product_name, product_image, product_price, quantity) \n"
                            + "VALUES ( ?, ?, ?, ?, ?)";
                    PreparedStatement stm2 = getConnection().prepareStatement(sql2);
                    stm2.setInt(1, oid);
                    stm2.setString(2, i.getProduct().getProduct_name());
                    stm2.setString(3, i.getProduct().getProduct_image());
                    stm2.setDouble(4, i.getPrice());
                    stm2.setInt(5, i.getQuantity());
                    stm2.executeUpdate();
                }
            }

            // cap nhat lai so luong san pham
            String sql3 = "update [product] \n"
                    + "set product_quantity = product_quantity-? \n"
                    + "where product_id =?";
            PreparedStatement stm3 = getConnection().prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                stm3.setInt(1, i.getQuantity());
                stm3.setInt(2, i.getProduct().getProduct_id());
                stm3.executeUpdate();
            }
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {

        ProductDAO pd = new ProductDAO();
        List<product> list = pd.searchProductsByCategoryName("Cars");
        for (product object : list) {
            System.out.println(object);
        }

    }

}
