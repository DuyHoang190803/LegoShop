/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hoang's LEGION
 */
public class User {

    private int user_id;
    private String user_name;
    private String user_password;
    private String user_email;
    private String user_phone;
    private String user_image;

    public User() {
    }

    public User(String user_name, String user_password, String user_email, String user_phone, String user_image) {
        this.user_name = user_name;
        this.user_password = user_password;
        this.user_email = user_email;
        this.user_phone = user_phone;
        this.user_image = user_image;
    }

    public User(int user_id, String user_name, String user_password, String user_email, String user_phone, String user_image) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_password = user_password;
        this.user_email = user_email;
        this.user_phone = user_phone;
        this.user_image = user_image;
    }
    
    

    public User(int user_id, String user_name, String user_password, String user_email, String user_phone) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.user_password = user_password;
        this.user_email = user_email;
        this.user_phone = user_phone;
    }

    @Override
    public String toString() {
        return "User{" + "user_id=" + user_id + ", user_name=" + user_name + ", user_password=" + user_password + ", user_email=" + user_email + ", user_phone=" + user_phone + ", user_image=" + user_image + '}';
    }

    public String getUser_image() {
        return user_image;
    }

    public void setUser_image(String user_image) {
        this.user_image = user_image;
    }

 
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public User(String user_name, String user_password, String user_email, String user_phone) {
        this.user_name = user_name;
        this.user_password = user_password;
        this.user_email = user_email;
        this.user_phone = user_phone;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    

}
