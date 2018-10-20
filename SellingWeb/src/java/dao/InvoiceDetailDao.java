/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import config.DBConnect;
import entity.ProductCartEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Đỗ Trung Đức
 */
public class InvoiceDetailDao {

    private Connection conn = null;

    public InvoiceDetailDao() {
        conn = new DBConnect().getConnection();
    }

    public boolean addInvoiceDetail(String invoiceId, ArrayList<ProductCartEntity> productCartEntitys) {
        int count = 0;
        String sql = "insert into InvoiceDetail values(?,?,?,?)";
        try {
            conn.setAutoCommit(false);
            PreparedStatement pre = conn.prepareStatement(sql);
            for (ProductCartEntity cartEntity : productCartEntitys) {
                pre.setString(1, invoiceId);
                pre.setString(2, cartEntity.getId());
                pre.setInt(3, cartEntity.getQuantityInCart());
                pre.setFloat(4, cartEntity.getPrice());
                pre.addBatch();
            }
            int n[] = pre.executeBatch();
            for (int temp : n) {
                count += temp;
            }
            conn.commit();
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDetailDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return count == productCartEntitys.size();
    }
}
