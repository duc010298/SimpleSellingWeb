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
public class CustomerEntity {
    private String id;
    private String name;
    private String address;
    private String phone;
    private String username;
    private String password;
    private boolean status;

    public CustomerEntity(String id, String name, String address, String phone, String username, String password, boolean status) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.username = username;
        this.password = password;
        this.status = status;
    }

    public CustomerEntity(String id, String name, String address, String phone, String username, String password) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.username = username;
        this.password = password;
    }
    
    public CustomerEntity(String id, String name, String address, String phone, String username) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.username = username;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    
}
