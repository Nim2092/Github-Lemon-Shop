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
import model.CartItem;

public class CartItemDAO extends DBContext {

    public CartItemDAO() {
    }

    


    public void addCartItem(int cartid,int pid)  {
        String query = "exec add_cart_item @cart_id=?, @product_id=?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cartid);
            statement.setInt(2, pid);
            statement.executeUpdate();            
        }catch(Exception ex){
            
        }
    }

    public void updateCartItem(CartItem cartItem) {
        String query = "UPDATE cart_item SET quantity = ? WHERE cart_item_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cartItem.getQuantity());
            statement.setInt(2, cartItem.getCartItemId());
            statement.executeUpdate();
            
        }
        catch(Exception ex){
            
        }
    }

    public void deleteCartItem(int cartItemId)  {
        String query = "DELETE FROM cart_item WHERE cart_item_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cartItemId);
             statement.executeUpdate();
            
        }catch(Exception ex){
            
        }
    }

    public CartItem getCartItemById(int cartItemId)  {
        String query = "SELECT * FROM cart_item WHERE cart_item_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cartItemId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    CartItem cartItem = new CartItem();
                    cartItem.setCartItemId(resultSet.getInt("cart_item_id"));
                    cartItem.setCartId(resultSet.getInt("cart_id"));
                    cartItem.setProductId(resultSet.getInt("product_id"));
                    cartItem.setQuantity(resultSet.getInt("quantity"));
                    return cartItem;
                } 
            }catch(Exception ex){
            
        }
        }catch(Exception ex){
            
        }return  null;
    }

    public List<CartItem> getAllCartItems() {
        String query = "SELECT * FROM cart_item";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = statement.executeQuery()) {
                List<CartItem> cartItems = new ArrayList<>();
                while (resultSet.next()) {
                    CartItem cartItem = new CartItem();
                    cartItem.setCartItemId(resultSet.getInt("cart_item_id"));
                    cartItem.setCartId(resultSet.getInt("cart_id"));
                    cartItem.setProductId(resultSet.getInt("product_id"));
                    cartItem.setQuantity(resultSet.getInt("quantity"));
                    cartItems.add(cartItem);
                }
                return cartItems;
            }
        }catch(Exception ex){
            
        } return  null;
    }
    public List<CartItem> getAllCartItemsByCartId(int cartItemId) {
        String query = "SELECT * FROM cart_item where cart_id=?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cartItemId);
            try (ResultSet resultSet = statement.executeQuery()) {
                List<CartItem> cartItems = new ArrayList<>();
                while (resultSet.next()) {
                    CartItem cartItem = new CartItem();
                    cartItem.setCartItemId(resultSet.getInt("cart_item_id"));
                    cartItem.setCartId(resultSet.getInt("cart_id"));
                    cartItem.setProductId(resultSet.getInt("product_id"));
                    cartItem.setQuantity(resultSet.getInt("quantity"));
                    cartItems.add(cartItem);
                }
                return cartItems;
            }
        }catch(Exception ex){
            
        } return  null;
    }
}

