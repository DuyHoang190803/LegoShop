/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;

/**
 *
 * @author Admin
 */
public class OderDetailDAO extends DBContext {

    public List<OrderDetail> OrderDetailByUserName(String name) {
        List<OrderDetail> OrderDetails = new ArrayList<>();
        try {
            String sqlQuery = "select od.od_id, od.product_name,od.product_image ,od.product_price,od.quantity\n"
                    + "from [user] u, [order] o, [order_detail] od\n"
                    + "where u.user_id = o.user_id and o.order_id = od.order_id and u.user_name = ? ";
            PreparedStatement stm = getConnection().prepareStatement(sqlQuery);
            stm.setString(1, name);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                OrderDetail od = new OrderDetail();
                od.setOd_id(rs.getInt("od_id"));
                od.setOd_name(rs.getString("product_name"));
                od.setOd_image(rs.getString("product_image"));
                od.setOd_price(rs.getFloat("product_price"));
                od.setOd_quantity(rs.getInt("quantity"));

                OrderDetails.add(od);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return OrderDetails;
    }

    public static void main(String[] args) {
        OderDetailDAO od = new OderDetailDAO();
        System.out.println(od.OrderDetailByUserName("Snowball"));

    }

}
