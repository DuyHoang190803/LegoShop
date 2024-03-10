/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class product {
    
    private int product_id;
    private String product_name;
    private String product_image;
    private int product_quantity;
    private float product_price;
    private String product_description;
    private category category;

    public product() {
    }

    
    
    
    
    public product(String product_name, String product_image, int product_quantity, float product_price, String product_description) {
        this.product_name = product_name;
        this.product_image = product_image;
        this.product_quantity = product_quantity;
        this.product_price = product_price;
        this.product_description = product_description;
    }

 

    public product(int product_id, String product_name, String product_image, int product_quantity, float product_price, String product_description) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_image = product_image;
        this.product_quantity = product_quantity;
        this.product_price = product_price;
        this.product_description = product_description;
    }

    public product(int product_id, String product_name, String product_image, int product_quantity, float product_price, category category) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_image = product_image;
        this.product_quantity = product_quantity;
        this.product_price = product_price;
        this.category = category;
    }

    public product(int product_id, String product_name, String product_image, int product_quantity, float product_price) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_image = product_image;
        this.product_quantity = product_quantity;
        this.product_price = product_price;
    }

    public product(int product_id, String product_name, String product_image, int product_quantity, float product_price, String product_description, category category) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_image = product_image;
        this.product_quantity = product_quantity;
        this.product_price = product_price;
        this.product_description = product_description;
        this.category = category;
    }

    
    public String getProduct_description() {
        return product_description;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_image() {
        return product_image;
    }

    public void setProduct_image(String product_image) {
        this.product_image = product_image;
    }

    public int getProduct_quantity() {
        return product_quantity;
    }

    public void setProduct_quantity(int product_quantity) {
        this.product_quantity = product_quantity;
    }

    public float getProduct_price() {
        return product_price;
    }

    public void setProduct_price(float product_price) {
        this.product_price = product_price;
    }

    public category getCategory() {
        return category;
    }

    public void setCategory(category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "product{" + "product_id=" + product_id + ", product_name=" + product_name + ", product_image=" + product_image + ", product_quantity=" + product_quantity + ", product_price=" + product_price + ", product_description=" + product_description + ", category=" + category + '}';
    }

    
    
    
}
