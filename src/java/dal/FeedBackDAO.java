/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.FeedBack;

/**
 *
 * @author Admin
 */
public class FeedBackDAO extends DBContext {

    public List<FeedBack> getFeedBacks() {
        List<FeedBack> FeedBacks = new ArrayList<>();
        try {
            String sqlQuery = "select * from [feedback]";
            PreparedStatement stm = getConnection().prepareStatement(sqlQuery);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                FeedBack fb = new FeedBack();
                fb.setFeedback_id(rs.getInt("feedback_id"));
                fb.setFeedback_name(rs.getString("feedback_name"));
                fb.setFeedback_content(rs.getString("feedback_content"));
                FeedBacks.add(fb);
            }
        } catch (Exception e) {
        }
        return FeedBacks;
    }

    public void insertUser(String name, String content)  {
        try {

            String sqlQuery = "INSERT INTO [dbo].[feedback]([feedback_name],[feedback_content])\n"
                    + "VALUES(?,?)";
            PreparedStatement statement = getConnection().prepareStatement(sqlQuery);
            statement.setString(1, name);
            statement.setString(2, content);
            statement.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {

        FeedBackDAO fbd = new FeedBackDAO();
//        List<FeedBack> list = fbd.getFeedBacks();
//        System.out.println(list);

fbd.insertUser("huy","hjehehehe");


    }

}
