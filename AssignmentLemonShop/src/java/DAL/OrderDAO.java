/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author asus
 */
public class OrderDAO extends DBContext{
    PreparedStatement ps = null;
    ResultSet rs = null;
    public  void insert(int aid){
        String sql ="exec insert_into_order @aid=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, aid);
           ps.executeUpdate();
            
        } catch (Exception e) {
        }
    }
     public  void updatePrice(int oid,float price){
        String sql ="exec update_price_order @oid=?, @price=?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ps.setFloat(2, price);
           ps.executeUpdate();
            
        } catch (Exception e) {
        }
    }
    public  int getMaxId(){
        String sql ="SELECT top (1) * FROM [order] order by order_id desc";
        try {
            ps = connection.prepareStatement(sql);
            
            rs=ps.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
            
            
            
        } catch (Exception e) {
            e.getMessage();
        }
        return  -1;
    }
}

