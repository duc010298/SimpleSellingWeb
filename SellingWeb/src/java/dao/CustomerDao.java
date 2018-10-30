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
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 *
 * @author Đỗ Trung Đức
 */
public class CustomerDao {

    private Connection conn = null;

    public CustomerDao() {
        conn = new DBConnect().getConnection();
    }
    
    public boolean authentication(String customerId, String password) {
        String encodedPassword = null;
        String sqlGetPassword = "select password from Customer where id=? and status=1";
        try {
            PreparedStatement pre = conn.prepareStatement(sqlGetPassword);
            pre.setString(1, customerId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                encodedPassword = rs.getString("password");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (encodedPassword == null) {
            return false;
        }
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.matches(password, encodedPassword);
    }
    
    public boolean updateInfor(String id, String name, String address, String phone) {
        String sql = "update Customer set name=?, address=?, phone=? where id=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setNString(1, name);
            pre.setNString(2, address);
            pre.setString(3, phone);
            pre.setString(4, id);
            return pre.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public CustomerEntity login(String username, String password) {
        //get encoded password
        String encodedPassword = null;
        String sqlGetPassword = "select password from Customer where username=? and status=1";
        try {
            PreparedStatement pre = conn.prepareStatement(sqlGetPassword);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                encodedPassword = rs.getString("password");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (encodedPassword == null) {
            return null;
        }

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        if (!encoder.matches(password, encodedPassword)) {
            return null;
        }

        CustomerEntity customerEntity = null;
        String sql = "select id, name, address, phone from Customer where status=1 and username=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getNString("name");
                String address = rs.getNString("address");
                String phone = rs.getString("phone");
                customerEntity = new CustomerEntity(id, name, address, phone, username, encodedPassword);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return customerEntity;
    }

    public CustomerEntity loginFromRemeberMe(String username, String encodedPassword) {
        CustomerEntity customerEntity = null;
        String sql = "select id, name, address, phone from Customer where status=1 and username=? and password=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, encodedPassword);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getNString("name");
                String address = rs.getNString("address");
                String phone = rs.getString("phone");
                customerEntity = new CustomerEntity(id, name, address, phone, username, encodedPassword);
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
            if (rs.next()) {
                int count = rs.getInt("count");
                return count == 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int registerCustomer(String name, String address, String phone, String username, String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        password = encoder.encode(password);
        String randomId = UUID.randomUUID().toString().replace("-", "");
        String sql = "insert into Customer values(?,?,?,?,?,?,1)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, randomId);
            pre.setNString(2, name);
            pre.setNString(3, address);
            pre.setString(4, phone);
            pre.setString(5, username);
            pre.setString(6, password);
            int n = pre.executeUpdate();
            return n;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public CustomerEntity getInfoFromId(String id) {
        CustomerEntity customerEntity = null;
        String sql = "select name, address, phone, username from Customer where id=? and status=1";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            rs.next();
            String name = rs.getNString("name");
            String address = rs.getNString("address");
            String phone = rs.getString("phone");
            String username = rs.getString("username");
            customerEntity = new CustomerEntity(id, name, address, phone, username);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customerEntity;
    }
    
    public boolean changePassword(String id, String password) {
        String sql = "update Customer set password=? where id=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, password);
            pre.setString(2, id);
            return pre.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
