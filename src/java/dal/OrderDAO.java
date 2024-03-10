/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Order;
import model.OrderDetail;
import model.category;
import model.product;

/**
 *
 * @author Admin
 */
public class OrderDAO extends DBContext {

//    public List<product> getProducts() {
//        List<product> products = new ArrayList<>();
//        try {
//            String sqlQuery = "select p.product_id,p.product_image,p.product_name,p.product_price,p.product_quantity,p.product_description,c.category_id,c.category_name from category c, product p where c.category_id = p.category_id";
//            PreparedStatement stm = getConnection().prepareStatement(sqlQuery);
//            ResultSet rs = stm.executeQuery();
//
//            while (rs.next()) {
//                product p = new product();
//                p.setProduct_id(rs.getInt("product_id"));
//                p.setProduct_image(rs.getString("product_image"));
//                p.setProduct_name(rs.getString("product_name"));
//                p.setProduct_price(rs.getFloat("product_price"));
//                p.setProduct_quantity(rs.getInt("product_quantity"));
//                p.setProduct_description(rs.getString("product_description"));
//
//                category c = new category();
//                c.setCategory_id(rs.getInt("category_id"));
//                c.setCateegory_name(rs.getString("category_name"));
//
//                p.setCategory(c);
//                products.add(p);
//            }
//        } catch (Exception e) {
//        }
//        return products;
//    }
    public List<Order> AllOrder() {
        List<Order> Orders = new ArrayList<>();
        try {
            String sqlQuery = "select u.user_id,u.user_name, o.price, o.date \n"
                    + "from [user] u, [order] o\n"
                    + "where u.user_id = o.user_id";
            PreparedStatement stm = getConnection().prepareStatement(sqlQuery);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("user_id"));
                o.setName(rs.getString("user_name"));

                o.setPrice(rs.getFloat("price"));
                o.setDate(rs.getString("date"));

                Orders.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Orders;
    }

    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        System.out.println(o.AllOrder());

    }

}
