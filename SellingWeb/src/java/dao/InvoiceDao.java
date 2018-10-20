/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import config.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Đỗ Trung Đức
 */
public class InvoiceDao {

    private Connection conn = null;

    public InvoiceDao() {
        conn = new DBConnect().getConnection();
    }

    public String addInvoice(String customerId, String name, String address, String phone, float total) {
        int n = 0;
        String randomId = UUID.randomUUID().toString().replace("-", "");
        Date date = new Date();
        long time = date.getTime();
        Timestamp ts = new Timestamp(time);
        
        String sql = "insert into Invoice values(?,?,?,?,?,?,?,1)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, randomId);
            pre.setTimestamp(2, ts);
            pre.setString(3, customerId);
            pre.setNString(4, name);
            pre.setNString(5, address);
            pre.setString(6, phone);
            pre.setFloat(7, total);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n == 1 ? randomId : null;
    }
}
