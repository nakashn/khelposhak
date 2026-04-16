package com.khel.khelposhak.dao;

import com.khel.khelposhak.databaseConnection.DatabaseConnection;
import com.khel.khelposhak.model.ProductModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProductDao {

    private Connection con;
    private boolean isConnectionError = false;

    public ProductDao() {
        try {
            con = DatabaseConnection.getDbConnection();
            System.out.println("DB Connection: " + con);
        } catch (Exception ex) {
            ex.printStackTrace();
            con = null;
        }
    }

    public boolean addProduct(ProductModel p) {
        try {
            

            String sql = "INSERT INTO products(name, description, price, sport, team, player_name,"
                    + " sizes_available, stock_s, stock_m, stock_l, stock_xl, stock_xxl, category_id,"
                    + " image_url) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getSport());
            ps.setString(5, p.getTeam());
            ps.setString(6, p.getPlayerName());
            ps.setString(7, p.getSizesAvailable());

            ps.setInt(8, p.getStockS());
            ps.setInt(9, p.getStockM());
            ps.setInt(10, p.getStockL());
            ps.setInt(11, p.getStockXl());
            ps.setInt(12, p.getStockXxl());

            ps.setInt(13, p.getCategoryId());
            ps.setString(14, p.getImageUrl());

            return ps.executeUpdate() > 0;

        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return false;
        }
    }

    public boolean updateProduct(ProductModel p) {
        try {
            String sql = "UPDATE products SET name=?, description=?, price=?, sport=?, team=?, player_name=?, "
                    + "sizes_available=?, stock_s=?, stock_m=?, stock_l=?, stock_xl=?, stock_xxl=?, category_id=?, "
                    + "image_url=? WHERE product_id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getSport());
            ps.setString(5, p.getTeam());
            ps.setString(6, p.getPlayerName());
            ps.setString(7, p.getSizesAvailable());
            ps.setInt(8, p.getStockS());
            ps.setInt(9, p.getStockM());
            ps.setInt(10, p.getStockL());
            ps.setInt(11, p.getStockXl());
            ps.setInt(12, p.getStockXxl());
            ps.setInt(13, p.getCategoryId());
            ps.setString(14, p.getImageUrl());
            ps.setInt(15, p.getProductId());
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return false;
        }
    }

    public boolean deleteProduct(int productid) {
        try {
            String sql = "DELETE FROM product WHERE product_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, productid);
            return ps.executeUpdate() > 0;

        } catch (SQLException ex) {
            System.out.println(ex.getLocalizedMessage());
            return false;
            
        }

    }
}
