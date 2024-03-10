/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class OrderDetail {
    int od_id;
    String od_name;
    String od_image;
    float od_price;
    int od_quantity;

    public OrderDetail() {
    }

    public OrderDetail(int od_id, String od_name, String od_image, float od_price, int od_quantity) {
        this.od_id = od_id;
        this.od_name = od_name;
        this.od_image = od_image;
        this.od_price = od_price;
        this.od_quantity = od_quantity;
    }

    public int getOd_id() {
        return od_id;
    }

    public void setOd_id(int od_id) {
        this.od_id = od_id;
    }

    public String getOd_name() {
        return od_name;
    }

    public void setOd_name(String od_name) {
        this.od_name = od_name;
    }

    public String getOd_image() {
        return od_image;
    }

    public void setOd_image(String od_image) {
        this.od_image = od_image;
    }

    public float getOd_price() {
        return od_price;
    }

    public void setOd_price(float od_price) {
        this.od_price = od_price;
    }

    public int getOd_quantity() {
        return od_quantity;
    }

    public void setOd_quantity(int od_quantity) {
        this.od_quantity = od_quantity;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "od_id=" + od_id + ", od_name=" + od_name + ", od_image=" + od_image + ", od_price=" + od_price + ", od_quantity=" + od_quantity + '}';
    }
    
    
}
