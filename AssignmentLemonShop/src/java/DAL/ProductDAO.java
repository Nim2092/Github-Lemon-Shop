/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author asus
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class ProductDAO {
    
    private Connection connection;

    public ProductDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Product> getAllProducts() throws SQLException {
        String query = "SELECT * FROM product";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = statement.executeQuery()) {
                List<Product> products = new ArrayList<>();
                while (resultSet.next()) {
                    Product product = new Product();
                    product.setProductId(resultSet.getInt("product_id"));
                    product.setProductName(resultSet.getString("product_name"));
                    product.setPrice(resultSet.getFloat("price"));
                    product.setDescription(resultSet.getString("description"));
                    product.setCategoryId(resultSet.getInt("category_id"));
                    product.setImageUrl(resultSet.getString("image_url"));
                    products.add(product);
                }
                return products;
            }
        }
    }

    public Product getProductById(int productId) throws SQLException {
        String query = "SELECT * FROM product WHERE product_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, productId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Product product = new Product();
                    product.setProductId(resultSet.getInt("product_id"));
                    product.setProductName(resultSet.getString("product_name"));
                    product.setPrice(resultSet.getFloat("price"));
                    product.setDescription(resultSet.getString("description"));
                    product.setCategoryId(resultSet.getInt("category_id"));
                    product.setImageUrl(resultSet.getString("image_url"));
                    return product;
                }
                else {
                    return null;
                }
            }
        }
    }

    public void addProduct(Product product) throws SQLException {
        String query = "INSERT INTO product (product_name, price, description, category_id, image_url) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, product.getProductName());
            statement.setFloat(2, (float) product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setInt(4, product.getCategoryId());
            statement.setString(5, product.getImageUrl());
            statement.executeUpdate();
        }
    }

    public void updateProduct(Product product) throws SQLException {
        String query = "UPDATE product SET product_name = ?, price = ?, description = ?, category_id = ?, image_url = ? WHERE product_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, product.getProductName());
            statement.setFloat(2, (float) product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setInt(4, product.getCategoryId());
            statement.setString(5, product.getImageUrl());
            statement.setInt(6, product.getProductId());
            statement.executeUpdate();
        }
    }

    public void deleteProduct(int productId) throws SQLException {
        String query = "DELETE FROM product WHERE product_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, productId);
            statement.executeUpdate();
        }
    }
}

