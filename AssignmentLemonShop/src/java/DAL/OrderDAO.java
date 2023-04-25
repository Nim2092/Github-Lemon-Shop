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
    public  void insert(String aid,String date){
        String sql ="INSERT INTO [dbo].[order]([account_id],[order_date],[total_price],[status_id])VALUES(?,?,?,?)";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, aid);
            ps.setSt
        } catch (Exception e) {
        }
    }
}
