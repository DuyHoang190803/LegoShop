/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.spi.DirStateFactory;
import model.User;

/**
 *
 * @author Hoang's LEGION
 */
public class UserDAO extends DBContext {

    public List<User> getUser() {
        List<User> user = new ArrayList<>();
        try {
            String sqlQuery = "select * from [user]";
            PreparedStatement stm = getConnection().prepareStatement(sqlQuery);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                User u = new User();
                u.setUser_id(rs.getInt("user_id"));
                u.setUser_name(rs.getString("user_name"));
                u.setUser_password(rs.getString("user_password"));
                u.setUser_email(rs.getString("user_email"));
                u.setUser_phone(rs.getString("user_phone"));
                u.setUser_image(rs.getString("user_image"));
                user.add(u);
            }
        } catch (Exception e) {

        }
        return user;
    }

    public void insertUser(User user) throws Exception {
        try {

            String sqlQuery = "INSERT INTO [User] ([user_name], [user_password], [user_email], [user_phone],[user_image])\n"
                    + "VALUES (?, ?, ?, ?, ?);";
            PreparedStatement statement = getConnection().prepareStatement(sqlQuery);
            statement.setString(1, user.getUser_name());
            statement.setString(2, user.getUser_password());
            statement.setString(3, user.getUser_email());
            statement.setString(4, user.getUser_phone());
            statement.setString(5, user.getUser_image());
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateUser(User user) {
        try {

            String sqlQuery = "UPDATE [user] SET [user_name] = ?, [user_password] = ?, [user_email] = ?, [user_phone] = ?, [user_image] = ? WHERE [user_id] = ?";

            PreparedStatement statement = getConnection().prepareStatement(sqlQuery);

            statement.setString(1, user.getUser_name());
            statement.setString(2, user.getUser_password());
            statement.setString(3, user.getUser_email());
            statement.setString(4, user.getUser_phone());
            statement.setString(5, user.getUser_image());
            statement.setInt(6, user.getUser_id());

            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changePassUser(String newPass, String currentPass) {
        try {

            String sqlQuery = "UPDATE [user] SET [user_password] = ? WHERE [user_password] = ?";
            PreparedStatement statement = getConnection().prepareStatement(sqlQuery);

            statement.setString(1, newPass);
            statement.setString(2, currentPass);

            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteUser(int id) {
        try {

//            -- Xóa từ bảng order_detail trước
//DELETE FROM order_detail WHERE order_id IN (SELECT order_id FROM [order] WHERE user_id = 40);
//
//-- Tiếp theo, xóa từ bảng order
//DELETE FROM [order] WHERE user_id = 40;
//
//-- Cuối cùng, xóa từ bảng user
//DELETE FROM [user] WHERE user_id = 40;
            String sql1 = "DELETE FROM order_detail WHERE order_id IN (SELECT order_id FROM [order] WHERE user_id = ?);";
            String sql2 = "DELETE FROM [order] WHERE user_id = ?;";
            String sql3 = "DELETE FROM [user] WHERE user_id = ?;";

            
            PreparedStatement stm1 = getConnection().prepareStatement(sql1);
            PreparedStatement stm2 = getConnection().prepareStatement(sql2);
            PreparedStatement stm3 = getConnection().prepareStatement(sql3);
            
            stm1.setInt(1, id);
            stm2.setInt(1, id);
            stm3.setInt(1, id);

            stm1.executeUpdate();
            stm2.executeUpdate();
            stm3.executeUpdate();
            
            
//            String sql2 = "DELETE FROM [order_detail] WHERE [order_id] = ?";
//            String sqlQuery = "DELETE FROM [order] WHERE [user_id] = ?";
//            String sqlQuery1 = "DELETE FROM [user] WHERE [user_id] = ?";
//
//            PreparedStatement stm3 = getConnection().prepareStatement(sql2);
//            PreparedStatement stm = getConnection().prepareStatement(sqlQuery);
//            PreparedStatement stm1 = getConnection().prepareStatement(sqlQuery1);
//
//            stm3.setInt(1, order_id);
//            stm.setInt(1, id);
//            stm1.setInt(1, id);
//
//            stm3.executeUpdate();
//            stm.executeUpdate();
//            stm1.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getAccount(String user, String pass) {
        String sql = "select * from [user]\n"
                + "where user_name = ?  and user_password = ?";
        try {
            PreparedStatement stm = getConnection().prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("user_id"),
                        user,
                        pass,
                        rs.getString("user_email"),
                        rs.getString("user_phone"),
                        rs.getString("user_image"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUserById(int id) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "select * from [user]\n"
                    + "where [user_id] = ?";
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //  User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getBoolean(7));
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                return user;
            }

        } catch (Exception e) {
        }
        return null;
    }

    public void updateUserProfile(User user) {
        try {

            String sqlQuery = "UPDATE [user] SET [user_name] = ?, [user_email] = ?, [user_phone] = ?, [user_image] = ? \n"
                    + "WHERE [user_id] = ?";

            PreparedStatement statement = getConnection().prepareStatement(sqlQuery);
            statement.setString(1, user.getUser_name());
            statement.setString(2, user.getUser_email());
            statement.setString(3, user.getUser_phone());
            statement.setString(4, user.getUser_image());
            statement.setInt(5, user.getUser_id());
            statement.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
//        User user = new User(2, "Rick", "Rick", "Rick", "Rick", "Rick");
//        ud.updateUserProfile(user);

        ud.deleteUser(40);

//       a.changePassUser("Snowball", "Snowball1");
//        try {
//        UserDAO a = new UserDAO();
//        List<User> u = a.getUser();
//        for (User user : u) {
//            System.out.println(user);
//        }
//        } catch (Exception ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
    }

}
