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
public class OrderDetailDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;
    public void add(int oid,int pid,int quantity){
        String sql="exec insert_into_detail @oid =?,@pid =?, @quantity =?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ps.setInt(2, pid);
            ps.setInt(3, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
class test{
    public static void main(String[] args) {
        OrderDetailDAO detailDAO = new OrderDetailDAO();
        detailDAO.add(7, 1, 2);
    }
}
