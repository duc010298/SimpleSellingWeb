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
}
