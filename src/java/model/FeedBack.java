/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class FeedBack {

    int feedback_id;
    String feedback_name;
    String feedback_content;

    public FeedBack(int feedback_id, String feedback_name, String feedback_content) {
        this.feedback_id = feedback_id;
        this.feedback_name = feedback_name;
        this.feedback_content = feedback_content;
    }

    public FeedBack() {
    }

    public int getFeedback_id() {
        return feedback_id;
    }

    public void setFeedback_id(int feedback_id) {
        this.feedback_id = feedback_id;
    }

    public String getFeedback_name() {
        return feedback_name;
    }

    public void setFeedback_name(String feedback_name) {
        this.feedback_name = feedback_name;
    }

    public String getFeedback_content() {
        return feedback_content;
    }

    public void setFeedback_content(String feedback_content) {
        this.feedback_content = feedback_content;
    }

    @Override
    public String toString() {
        return "FeedBack{" + "feedback_id=" + feedback_id + ", feedback_name=" + feedback_name + ", feedback_content=" + feedback_content + '}';
    }

}
