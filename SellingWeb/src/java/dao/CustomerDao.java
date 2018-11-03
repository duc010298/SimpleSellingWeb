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
import java.util.ArrayList;
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
    
    public CustomerEntity getInfoFromIdByAdmin(String id) {
        CustomerEntity customerEntity = null;
        String sql = "select name, address, phone, username from Customer where id=?";
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

    public ArrayList<CustomerEntity> getCustomerByPage(int page) {
        int begin;
        int end;
        page--;
        if (page == 0) {
            begin = 1;
            end = 20;
        } else {
            begin = page * 20 + 1;
            end = begin + 19;
        }

        ArrayList<CustomerEntity> customerEntitys = new ArrayList<>();
        String sql = "SELECT id, name, address, phone, username, status FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY username) AS RowNum FROM Customer) AS MyTable WHERE MyTable.RowNum BETWEEN ? AND ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, begin);
            pre.setInt(2, end);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getNString("name");
                String address = rs.getNString("address");
                String phone = rs.getString("phone");
                String username = rs.getString("username");
                boolean status = rs.getBoolean("status");
                customerEntitys.add(new CustomerEntity(id, name, address, phone, username, status));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return customerEntitys;
    }

    public ArrayList<CustomerEntity> getCustomerByPageAndSearch(int page, String content, String statusStr) {
        ArrayList<CustomerEntity> customerEntitys = new ArrayList<>();
        if (content == null) {
            return customerEntitys;
        }
        if (content.equals("") && statusStr == null) {
            return customerEntitys;
        }
        if (content.equals("") && !statusStr.equals("active") && !statusStr.equals("deactive")) {
            return customerEntitys;
        }
        int begin;
        int end;
        page--;
        if (page == 0) {
            begin = 1;
            end = 20;
        } else {
            begin = page * 20 + 1;
            end = begin + 19;
        }

        String sql = "SELECT id, name, address, phone, username, status FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY username) AS RowNum FROM Customer where username like ? or name like ? or address like ? or phone like ?) AS MyTable WHERE MyTable.RowNum BETWEEN ? AND ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setNString(1, "%" + content + "%");
            pre.setNString(2, "%" + content + "%");
            pre.setNString(3, "%" + content + "%");
            pre.setNString(4, "%" + content + "%");
            pre.setInt(5, begin);
            pre.setInt(6, end);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getNString("name");
                String address = rs.getNString("address");
                String phone = rs.getString("phone");
                String username = rs.getString("username");
                boolean status = rs.getBoolean("status");
                customerEntitys.add(new CustomerEntity(id, name, address, phone, username, status));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (statusStr != null) {
            if (statusStr.equals("active") || statusStr.equals("deactive")) {
                ArrayList<CustomerEntity> customerEntitys1 = new ArrayList<>();
                if (statusStr.equals("active")) {
                    for (CustomerEntity customerEntity : customerEntitys) {
                        if (customerEntity.isStatus()) {
                            customerEntitys1.add(customerEntity);
                        }
                    }
                } else {
                    for (CustomerEntity customerEntity : customerEntitys) {
                        if (!customerEntity.isStatus()) {
                            customerEntitys1.add(customerEntity);
                        }
                    }
                }
                return customerEntitys1;
            }
        }

        return customerEntitys;
    }

    public boolean changeStatus(String id, boolean status) {
        String sql = "update Customer set status=? where id=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setBoolean(1, status);
            pre.setString(2, id);
            return pre.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
