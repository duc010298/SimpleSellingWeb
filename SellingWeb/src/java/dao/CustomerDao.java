/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import config.DBConnect;
import entity.CustomerEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Đỗ Trung Đức
 */
public class CustomerDao {

    private Connection conn = null;

    public CustomerDao() {
        conn = new DBConnect().getConnection();
    }
    
    public CustomerEntity login(String username, String password) {
        CustomerEntity customerEntity = null;
        String sql = "select id, name, address, phone from Customer where status=1 and username=? and password=?";
        try {
            PreparedStatement pre = conn.prepareCall(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            ResultSet rs = pre.executeQuery();
            while(rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getNString("name");
                String address = rs.getNString("address");
                String phone = rs.getString("phone");
                customerEntity = new CustomerEntity(id, name, address, phone, username, password);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return customerEntity;
    }
    
    public boolean isDuplicateUsername(String username) {
        String sql = "select count(id) as count from Customer where username=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if(rs.next()) {
                int count = rs.getInt("count");
                return count == 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public int registerCustomer(String name, String address, String phone, String username, String password) {
        String sql = "insert into Customer values(?,?,?,?,?,1)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setNString(1, name);
            pre.setNString(2, address);
            pre.setString(3, phone);
            pre.setString(4, username);
            pre.setString(5, password);
            int n = pre.executeUpdate();
            return n;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
