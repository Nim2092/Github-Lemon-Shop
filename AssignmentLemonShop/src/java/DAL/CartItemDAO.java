/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author asus
 */import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;

public class CartItemDAO {
    private Connection connection;

    public CartItemDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean addCartItem(CartItem cartItem) throws SQLException {
        String query = "INSERT INTO cart_item (cart_id, product_id, quantity) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cartItem.getCartId());
            statement.setInt(2, cartItem.getProductId());
            statement.setInt(3, cartItem.getQuantity());
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        }
    }

    public boolean updateCartItem(CartItem cartItem) throws SQLException {
        String query = "UPDATE cart_item SET quantity = ? WHERE cart_item_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cartItem.getQuantity());
            statement.setInt(2, cartItem.getCartItemId());
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        }
    }

    public boolean deleteCartItem(int cartItemId) throws SQLException {
        String query = "DELETE FROM cart_item WHERE cart_item_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cartItemId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        }
    }

    public CartItem getCartItemById(int cartItemId) throws SQLException {
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
                } else {
                    return null;
                }
            }
        }
    }

    public List<CartItem> getAllCartItems() throws SQLException {
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
        }
    }
}

