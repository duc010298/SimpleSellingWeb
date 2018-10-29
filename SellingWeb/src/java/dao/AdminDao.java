/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import config.DBConnect;
import entity.AdminEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 *
 * @author Đỗ Trung Đức
 */
public class AdminDao {
    
    private Connection conn = null;

    public AdminDao() {
        conn = new DBConnect().getConnection();
    }
    
    public AdminEntity login(String username, String password) {
        //get encoded password
        String encodedPassword = null;
        String sqlGetPassword = "select password from Admin where username=? and status=1";
        try {
            PreparedStatement pre = conn.prepareStatement(sqlGetPassword);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            while(rs.next()) {
                encodedPassword = rs.getString("password");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(encodedPassword == null) return null;

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        if(!encoder.matches(password, encodedPassword)) return null;
        
        AdminEntity adminEntity = new AdminEntity(username, encodedPassword, true);
        
        return adminEntity;
    }
    
    public AdminEntity loginFromRemeberMe(String username, String encodedPassword) {
        String sql = "select * from Admin where status=1 and username=? and password=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, encodedPassword);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return new AdminEntity(username, encodedPassword, true);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
}
