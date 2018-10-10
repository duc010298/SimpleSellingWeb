package dao;

import config.DBConnect;
import entity.ProductEntity;

import java.sql.Connection;
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

    public ArrayList<ProductEntity> getProductForIndex() {
        ArrayList<ProductEntity> productEntities = new ArrayList<>();
        String sql = "select top 20 id, name, quantity, price, picture from Product where status=1 order by convert(DateTime, lastmodifier,101) desc";
        try {
            Statement sta = conn.createStatement();
            ResultSet rs = sta.executeQuery(sql);
            while(rs.next()) {
                int id = rs.getInt("id");
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
