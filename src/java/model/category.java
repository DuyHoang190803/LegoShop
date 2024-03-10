/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class category {
    private int category_id;
    private String cateegory_name;

    public category() {
    }

    public category(int category_id, String cateegory_name) {
        this.category_id = category_id;
        this.cateegory_name = cateegory_name;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getCateegory_name() {
        return cateegory_name;
    }

    public void setCateegory_name(String cateegory_name) {
        this.cateegory_name = cateegory_name;
    }

    @Override
    public String toString() {
        return "category{" + "category_id=" + category_id + ", cateegory_name=" + cateegory_name + '}';
    }
    
}
