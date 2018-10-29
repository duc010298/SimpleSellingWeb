package dao;

import config.DBConnect;
import entity.ProductEntity;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.UUID;
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

    public ArrayList<ProductEntity> getProductByPage(int page) {
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

        ArrayList<ProductEntity> productEntities = new ArrayList<>();
        String sql = "SELECT id, name, quantity, price, picture, description, status, lastmodifier FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY name) AS RowNum FROM Product) AS MyTable WHERE MyTable.RowNum BETWEEN ? AND ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, begin);
            pre.setInt(2, end);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getNString("name");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                String picture = rs.getString("picture");
                String description = rs.getNString("description");
                int status = rs.getInt("status");
                Date lastmodifier = rs.getDate("lastmodifier");
                productEntities.add(new ProductEntity(id, name, quantity, price, picture, description, status, lastmodifier));
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
            while (rs.next()) {
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
    
    public ProductEntity getProductByIdForEdit(String id) {
        ProductEntity entity = new ProductEntity();
        String sql = "select name, quantity, price, picture, description, status from Product where id=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String name = rs.getNString("name");
                int quantity = rs.getInt("quantity");
                float price = rs.getFloat("price");
                String picture = rs.getString("picture");
                String description = rs.getString("description");
                int status = rs.getInt("status");
                entity = new ProductEntity(id, name, quantity, price, picture, description, status);
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

    public String addProduct(String name, String quantity, float price, String picture, String description) {
        Calendar currenttime = Calendar.getInstance();
        Date datenow = new Date((currenttime.getTime()).getTime());

        String randomId = UUID.randomUUID().toString().replace("-", "");
        String sql = "insert into Product values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, randomId);
            pre.setNString(2, name);
            pre.setInt(3, Integer.parseInt(quantity));
            pre.setFloat(4, price);
            pre.setString(5, picture);
            pre.setNString(6, description);
            pre.setInt(7, 1);
            pre.setDate(8, datenow);
            if (pre.executeUpdate() == 1) {
                return randomId;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int deleteProduct(String id) {
        /* 
        return 0 --> error
        return 1 --> delete successfully
        return 2 --> can't delete, change status to deactive and update lastmodifier
         */

        String sql = "select COUNT(invoiceId) as countCol from InvoiceDetail where productId=?";
        int count = 0;
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, id);
            ResultSet rs = pre.executeQuery();
            rs.next();
            count = rs.getInt("countCol");
        } catch (SQLException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
        if (count == 0) {
            //delete
            sql = "delete from Category_Product where productID=?";
            try {
                PreparedStatement pre = conn.prepareStatement(sql);
                pre.setString(1, id);
                int n = pre.executeUpdate();
                if(n == 0) {
                    return 0;
                }
            } catch (SQLException ex) {
                Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
                return 0;
            }
            
            sql = "delete from product where id=?";
            try {
                PreparedStatement pre = conn.prepareStatement(sql);
                pre.setString(1, id);
                int n = pre.executeUpdate();
                return n == 1 ? 1 : 0;
            } catch (SQLException ex) {
                Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
                return 0;
            }
        } else {
            //change status and update lastmodifier
            Calendar currenttime = Calendar.getInstance();
            Date datenow = new Date((currenttime.getTime()).getTime());

            sql = "update Product set status=0, lastmodifier=? where id=?";
            try {
                PreparedStatement pre = conn.prepareStatement(sql);
                pre.setDate(1, datenow);
                pre.setString(2, id);
                int n = pre.executeUpdate();
                return n == 1 ? 2 : 0;
            } catch (SQLException ex) {
                Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
                return 0;
            }
        }
    }

}
