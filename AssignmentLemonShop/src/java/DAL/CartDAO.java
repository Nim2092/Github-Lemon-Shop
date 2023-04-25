/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;


 import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cart;

public class CartDAO extends  DBContext{


    public CartDAO() {
       
    }

    // Create a new cart
    public void createCart(Cart cart)  {
        String query = "INSERT INTO cart (account_id, total_price) VALUES (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cart.getAccountId());
            statement.setFloat(2, (float) cart.getTotalPrice());
            statement.executeUpdate();
        }
        catch(Exception e){
            
        }
    }

    // Get all carts
    public List<Cart> getAllCarts()  {
        String query = "SELECT * FROM cart";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = statement.executeQuery()) {
                List<Cart> carts = new ArrayList<>();
                while (resultSet.next()) {
                    Cart cart = new Cart();
                    cart.setCartId(resultSet.getInt("cart_id"));
                    cart.setAccountId(resultSet.getInt("account_id"));
                    cart.setTotalPrice(resultSet.getFloat("total_price"));
                    carts.add(cart);
                }
                return carts;
            }
            catch(Exception e){
            
        }
        }catch(Exception e){
            
        } return null;
    }

    // Get a cart by ID
    public Cart getCartById(int aid)  {
        String query = "SELECT * FROM cart WHERE account_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, aid);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Cart cart = new Cart();
                    cart.setCartId(resultSet.getInt(1));
                    cart.setAccountId(resultSet.getInt(2));
                   // cart.setTotalPrice(resultSet.getFloat(3));
                    return cart;
                } 
            }
            catch(Exception e){
            
        }
        }catch(Exception e){
            
        } return null;
    }

    // Update a cart
    public void updateCart(Cart cart)  {
        String query = "UPDATE cart SET account_id = ?, total_price = ? WHERE cart_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cart.getAccountId());
            statement.setFloat(2, (float) cart.getTotalPrice());
            statement.setInt(3, cart.getCartId());
            statement.executeUpdate();
        }catch(Exception e){
            
        }
    }

    // Delete a cart by ID
    public void deleteCartById(int cartId) {
        String query = "DELETE FROM cart WHERE cart_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cartId);
            statement.executeUpdate();
        }catch(Exception e){
            
        }
    }
}
class Test{
    public static void main(String[] args) {
        CartDAO cartDAO= new CartDAO();
        System.out.println(cartDAO.getCartById(1));
    }
}
       

