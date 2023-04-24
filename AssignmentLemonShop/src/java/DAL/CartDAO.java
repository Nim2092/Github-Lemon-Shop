/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import controller.DBContext;
/**
 *
 * @author asus
 */import java.sql.Connection;
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
    public void createCart(Cart cart) throws SQLException {
        String query = "INSERT INTO cart (account_id, total_price) VALUES (?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cart.getAccountId());
            statement.setFloat(2, (float) cart.getTotalPrice());
            statement.executeUpdate();
        }
    }

    // Get all carts
    public List<Cart> getAllCarts() throws SQLException {
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
        }
    }

    // Get a cart by ID
    public Cart getCartById(int cartId) throws SQLException {
        String query = "SELECT * FROM cart WHERE cart_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cartId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Cart cart = new Cart();
                    cart.setCartId(resultSet.getInt("cart_id"));
                    cart.setAccountId(resultSet.getInt("account_id"));
                    cart.setTotalPrice(resultSet.getFloat("total_price"));
                    return cart;
                } else {
                    return null;
                }
            }
        }
    }

    // Update a cart
    public void updateCart(Cart cart) throws SQLException {
        String query = "UPDATE cart SET account_id = ?, total_price = ? WHERE cart_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cart.getAccountId());
            statement.setFloat(2, (float) cart.getTotalPrice());
            statement.setInt(3, cart.getCartId());
            statement.executeUpdate();
        }
    }

    // Delete a cart by ID
    public void deleteCartById(int cartId) throws SQLException {
        String query = "DELETE FROM cart WHERE cart_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cartId);
            statement.executeUpdate();
        }
    }
}

