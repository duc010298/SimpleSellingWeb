/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import config.DBConnect;
import entity.CategoryEntity;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Đỗ Trung Đức
 */
public class CategoryDao {

    private final Connection conn;

    public CategoryDao() {
        conn = new DBConnect().getConnection();
    }

    public HashMap<CategoryEntity, ArrayList<CategoryEntity>> getCategoryList() {
        HashMap<CategoryEntity, ArrayList<CategoryEntity>> hashMap = new HashMap<>();

        String sql1 = "select id, name, parent from Category where status=1 and parent=0 order by id ASC";
        ArrayList<CategoryEntity> cateLever1 = new ArrayList<>();
        try {
            Statement sta = conn.createStatement();
            try (ResultSet rs = sta.executeQuery(sql1)) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getNString("name");
                    int parent = rs.getInt("parent");
                    cateLever1.add(new CategoryEntity(id, name, parent));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        String sql2 = "select id, name, parent from Category where status=1 and parent=? order by id ASC";
        for (CategoryEntity c : cateLever1) {
            try {
                PreparedStatement pre = conn.prepareStatement(sql2);
                pre.setInt(1, c.getId());
                ArrayList<CategoryEntity> entitys = new ArrayList<>();
                ResultSet rs = pre.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getNString("name");
                    int parent = rs.getInt("parent");
                    entitys.add(new CategoryEntity(id, name, parent));
                }
                hashMap.put(c, entitys);
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return hashMap;
    }

    public HashMap<CategoryEntity, ArrayList<CategoryEntity>> getCategoryListForManager() {
        HashMap<CategoryEntity, ArrayList<CategoryEntity>> hashMap = new HashMap<>();

        String sql1 = "select id, name, parent, status from Category where parent=0 order by id ASC";
        ArrayList<CategoryEntity> cateLever1 = new ArrayList<>();
        try {
            Statement sta = conn.createStatement();
            try (ResultSet rs = sta.executeQuery(sql1)) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getNString("name");
                    int parent = rs.getInt("parent");
                    boolean status = rs.getBoolean("status");
                    cateLever1.add(new CategoryEntity(id, name, parent, status));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        String sql2 = "select id, name, parent, status from Category where parent=? order by id ASC";
        for (CategoryEntity c : cateLever1) {
            try {
                PreparedStatement pre = conn.prepareStatement(sql2);
                pre.setInt(1, c.getId());
                ArrayList<CategoryEntity> entitys = new ArrayList<>();
                ResultSet rs = pre.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getNString("name");
                    int parent = rs.getInt("parent");
                    boolean status = rs.getBoolean("status");
                    entitys.add(new CategoryEntity(id, name, parent, status));
                }
                hashMap.put(c, entitys);
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return hashMap;
    }

    public String getNameById(String id) {
        String sql = "select name from Category where id=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                return rs.getNString("name");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean addProductToCategory(String prodcutId, ArrayList<Integer> categoryList) {
        String sql = "insert into Category_Product values (?,?)";
        try {
            conn.setAutoCommit(false);
            PreparedStatement pre = conn.prepareStatement(sql);
            for (Integer categoryId : categoryList) {
                pre.setString(1, prodcutId);
                pre.setInt(2, categoryId);
                pre.addBatch();
            }
            int n[] = pre.executeBatch();
            conn.commit();
            int count = 0;
            for (int temp : n) {
                count += temp;
            }
            return count == categoryList.size();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public boolean addCategoryLevel1(String value) {
        String sql = "insert into Category values(?, 0, 1)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setNString(1, value);
            return pre.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public boolean addCategoryLevel2(String value, String idParent) {
        String sql = "insert into Category values(?, ?, 1)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setNString(1, value);
            pre.setNString(2, idParent);
            return pre.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public boolean changeStatus(String id, String status) {
        String sql = "update Category set status=? where id=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setBoolean(1, !status.equals("enable"));
            pre.setString(2, id);
            return pre.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public boolean updateNameCategory(String id, String newName) {
        String sql = "update Category set name=? where id=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setNString(1, newName);
            pre.setString(2, id);
            return pre.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
