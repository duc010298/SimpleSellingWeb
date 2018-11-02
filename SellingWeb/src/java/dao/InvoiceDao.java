/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import config.DBConnect;
import entity.CustomerEntity;
import entity.InvoiceDetailEntity;
import entity.InvoiceEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
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

    public ArrayList<InvoiceEntity> getInvoiceListByPage(int page) {

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
        ArrayList<InvoiceEntity> invoiceEntitys = new ArrayList<>();

        String sql = "SELECT id,customerId,date,name,address,phone,total,status FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY date DESC) AS RowNum FROM Invoice) AS MyTable WHERE MyTable.RowNum BETWEEN ? AND ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, begin);
            pre.setInt(2, end);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                Timestamp date = rs.getTimestamp("date");
                String customerId = rs.getString("customerId");
                String username = null;
                CustomerEntity customerEntity = new CustomerDao().getInfoFromId(customerId);
                username = customerEntity.getUsername();
                String name = rs.getNString("name");
                String address = rs.getNString("address");
                String phone = rs.getString("phone");
                float total = rs.getFloat("total");
                int status = rs.getInt("status");
                invoiceEntitys.add(new InvoiceEntity(id, date, username, name, address, phone, total, status));
            }
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return invoiceEntitys;
    }

    public ArrayList<InvoiceEntity> getInvoiceByPageAndSearch(int page, String content, String statusStr) {
        ArrayList<InvoiceEntity> invoiceEntitys = new ArrayList<>();
        if (content == null) {
            return invoiceEntitys;
        }
        if (content.equals("") && statusStr == null) {
            return invoiceEntitys;
        }
        if (content.equals("") && !statusStr.equals("active") && !statusStr.equals("deactive")) {
            return invoiceEntitys;
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

        String sql = "SELECT id,customerId,date,name,address,phone,total,status FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY date DESC) AS RowNum FROM Invoice where name like ? or address like ? or phone like ?) AS MyTable WHERE MyTable.RowNum BETWEEN ? AND ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setNString(1, "%" + content + "%");
            pre.setNString(2, "%" + content + "%");
            pre.setNString(3, "%" + content + "%");
            pre.setInt(4, begin);
            pre.setInt(5, end);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                Timestamp date = rs.getTimestamp("date");
                String customerId = rs.getString("customerId");
                String username = null;
                CustomerEntity customerEntity = new CustomerDao().getInfoFromId(customerId);
                username = customerEntity.getUsername();
                String name = rs.getNString("name");
                String address = rs.getNString("address");
                String phone = rs.getString("phone");
                float total = rs.getFloat("total");
                int status = rs.getInt("status");
                invoiceEntitys.add(new InvoiceEntity(id, date, username, name, address, phone, total, status));
            }
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (!statusStr.equals("active") && !statusStr.equals("deactive")) {
            ArrayList<InvoiceEntity> invoiceEntitys2 = new ArrayList<>();
            if(statusStr.equals("active")) {
                for(InvoiceEntity invoiceEntity: invoiceEntitys) {
                    if(invoiceEntity.getStatus() == 1) {
                        invoiceEntitys2.add(invoiceEntity);
                    }
                }
            } else {
                for(InvoiceEntity invoiceEntity: invoiceEntitys) {
                    if(invoiceEntity.getStatus() == 0) {
                        invoiceEntitys2.add(invoiceEntity);
                    }
                }
            }
            
            return invoiceEntitys2;
        }

        return invoiceEntitys;
    }

    public InvoiceEntity getInvoiceById(String id) {
        InvoiceEntity invoiceEntity = null;
        String sql = "select date, customerId, name, address, phone, total, status from Invoice where id=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            rs.next();
            Timestamp date = rs.getTimestamp("date");
            String customerId = rs.getString("customerId");
            String name = rs.getNString("name");
            String address = rs.getNString("address");
            String phone = rs.getString("phone");
            float total = rs.getFloat("total");
            int status = rs.getInt("status");
            invoiceEntity = new InvoiceEntity(id, date, customerId, name, address, phone, total, status);
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return invoiceEntity;
    }

    public boolean updateStatusInvoice(String id, String status) {
        //get current status
        String currentStatus = null;
        String sql = "select status from Invoice where id=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            rs.next();
            currentStatus = rs.getString("status");
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (currentStatus == null) {
            return false;
        }
        sql = "update Invoice set status=? where id=?";
        int n = 0;
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, Integer.parseInt(status));
            pre.setString(2, id);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (n != 1) {
            return false;
        }
        if (status.equals("2")) {
            //tru quantity
            ArrayList<InvoiceDetailEntity> invoiceDetailEntitys = new InvoiceDetailDao().getDetailById(id);
            for (InvoiceDetailEntity detailEntity : invoiceDetailEntitys) {
                if (!new ProductDao().reduceQuantity(detailEntity.getProductId(), detailEntity.getQuantity())) {
                    return false;
                }
            }
            return true;
        } else if ((status.equals("1") || status.equals("0")) && currentStatus.equals("2")) {
            //cong quantity
            ArrayList<InvoiceDetailEntity> invoiceDetailEntitys = new InvoiceDetailDao().getDetailById(id);
            for (InvoiceDetailEntity detailEntity : invoiceDetailEntitys) {
                if (!new ProductDao().increaseQuantity(detailEntity.getProductId(), detailEntity.getQuantity())) {
                    return false;
                }
            }
            return true;
        } else if (status.equals("3") && currentStatus.equals("1")) {
            //tru quantity
            ArrayList<InvoiceDetailEntity> invoiceDetailEntitys = new InvoiceDetailDao().getDetailById(id);
            for (InvoiceDetailEntity detailEntity : invoiceDetailEntitys) {
                if (!new ProductDao().reduceQuantity(detailEntity.getProductId(), detailEntity.getQuantity())) {
                    return false;
                }
            }
            return true;
        } else {
            return true;
        }
    }

    public ArrayList<InvoiceEntity> getInvoiceByCustomerId(String customerId) {
        ArrayList<InvoiceEntity> invoiceEntitys = new ArrayList<>();
        String sql = "select id, date, name, address, phone, total, status from Invoice where customerId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, customerId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                Timestamp date = rs.getTimestamp("date");
                String name = rs.getNString("name");
                String address = rs.getNString("address");
                String phone = rs.getString("phone");
                float total = rs.getFloat("total");
                int status = rs.getInt("status");
                invoiceEntitys.add(new InvoiceEntity(id, date, name, address, phone, total, status));
            }
        } catch (SQLException ex) {
            Logger.getLogger(InvoiceDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return invoiceEntitys;
    }
}
