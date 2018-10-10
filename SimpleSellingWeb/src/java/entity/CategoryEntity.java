/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Đỗ Trung Đức
 */
public class CategoryEntity {
    private int id;
    private String name;
    private int parent;
    private boolean  status;

    public CategoryEntity(int id, String name, int parent, boolean status) {
        this.id = id;
        this.name = name;
        this.parent = parent;
        this.status = status;
    }

    public CategoryEntity(int id, String name, int parent) {
        this.id = id;
        this.name = name;
        this.parent = parent;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParent() {
        return parent;
    }

    public void setParent(int parent) {
        this.parent = parent;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    
    
    
}
