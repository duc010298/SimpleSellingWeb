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
        
        String sql1 = "select id, name, parent from Categogy where status=1 and parent=0 order by id ASC";
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

        String sql2 = "select id, name, parent from Categogy where status=1 and parent=? order by id ASC";
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
}
