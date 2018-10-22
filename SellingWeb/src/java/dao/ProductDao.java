package dao;

import config.DBConnect;
import entity.ProductEntity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDao {

    private Connection conn = null;

    public ProductDao() {
        conn = new DBConnect().getConnection();
    }

    public ArrayList<ProductEntity> getTop20Product() {
        ArrayList<ProductEntity> productEntities = new ArrayList<>();
        String sql = "select top 20 id, name, quantity, price, picture from Product where status=1 order by convert(DateTime, lastmodifier,101) desc";
        try {
            Statement sta = conn.createStatement();
            ResultSet rs = sta.executeQuery(sql);
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getNString("name");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                String picture = rs.getString("picture");
                productEntities.add(new ProductEntity(id, name, quantity, price, picture));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productEntities;
    }

    public ArrayList<ProductEntity> getByCategory(String categoryId, String sortBy) {
        ArrayList<ProductEntity> productEntities = new ArrayList<>();
        String sql = "select top 20 id, name, quantity, price, picture from Product inner join Category_Product on Product.id=Category_Product.productID and Category_Product.categoryID = ? and Product.status=1 ";
        if (sortBy != null) {
            switch (sortBy) {
                case "priceASC":
                    sql += "order by price ASC";
                    break;
                case "priceDESC":
                    sql += "order by price DESC";
                    break;
                case "nameASC":
                    sql += "order by name ASC";
                    break;
                case "nameDESC":
                    sql += "order by name DESC";
                    break;
                default:
                    break;
            }
        }
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, categoryId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getNString("name");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                String picture = rs.getString("picture");
                productEntities.add(new ProductEntity(id, name, quantity, price, picture));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productEntities;
    }
    
    public ProductEntity getProductById(String id) {
        ProductEntity entity = new ProductEntity();
        String sql = "select name, quantity, price, picture, description from Product where status=1 and id=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            while(rs.next()) {
                String name = rs.getNString("name");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                String picture = rs.getString("picture");
                String description = rs.getString("description");
                entity = new ProductEntity(id, name, quantity, price, picture, description);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return entity;
    }
    
    public boolean updateQuantity(String id, String quantity) {
        int n = 0;
        String sql = "update Product set quantity=? where id=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, quantity);
            pre.setString(2, id);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n == 1;
    }
    
    public ArrayList<ProductEntity> searchProduct(String content) {
        ArrayList<ProductEntity> productEntities = new ArrayList<>();
        String sql = "select top 20 id, name, quantity, price, picture from product where status=1 and (name like ? or description like ?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, '%' + content + '%');
            pre.setString(2, '%' + content + '%');
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getNString("name");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                String picture = rs.getString("picture");
                productEntities.add(new ProductEntity(id, name, quantity, price, picture));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productEntities;
    }
}
