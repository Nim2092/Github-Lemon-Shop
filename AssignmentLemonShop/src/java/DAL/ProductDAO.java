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

public class ProductDAO extends DBContext {
    
    public ProductDAO() {
    }
    
    public List<Product> getAllProducts() {
        String query = "SELECT * FROM product";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            try ( ResultSet resultSet = statement.executeQuery()) {
                List<Product> products = new ArrayList<>();
                while (resultSet.next()) {
                    Product product = new Product();
                    product.setProductId(resultSet.getInt(1));
                    product.setProductName(resultSet.getString(2));
                    product.setPrice(resultSet.getFloat(3));
                    product.setDescription(resultSet.getString(4));
                    product.setCategoryId(resultSet.getInt(5));
                    product.setImageUrl(resultSet.getString(6));
                    products.add(product);
                }
                return products;
            } catch (Exception e) {
                
            }
        } catch (Exception e) {
            
        }
        return null;
    }
    
    public Product getProductById(int productId) {
        String query = "SELECT * FROM product WHERE product_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, productId);
            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Product product = new Product();
                    product.setProductId(resultSet.getInt(1));
                    product.setProductName(resultSet.getString(2));
                    product.setPrice(resultSet.getFloat(3));
                    product.setDescription(resultSet.getString(4));
                    product.setCategoryId(resultSet.getInt(5));
                    product.setImageUrl(resultSet.getString(6));
                    return product;
                } else {
                    return null;
                }
            } catch (Exception e) {
                
            }
        } catch (Exception e) {
            
        }
        return null;
    }

    public List<Product> getProductByCId(int cid) {
        String query = "SELECT * FROM product WHERE category_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cid);
            try ( ResultSet resultSet = statement.executeQuery()) {
                List<Product> list = new ArrayList<>();
                while (resultSet.next()) {
                    Product product = new Product();
                    product.setProductId(resultSet.getInt(1));
                    product.setProductName(resultSet.getString(2));
                    product.setPrice(resultSet.getFloat(3));
                    product.setDescription(resultSet.getString(4));
                    product.setCategoryId(resultSet.getInt(5));
                    product.setImageUrl(resultSet.getString(6));
                    list.add(product);
                }
                return list;
            } catch (Exception e) {
                
            }
        } catch (Exception e) {
            
        }
        return null;
    }
    
    public void addProduct(Product product) {
        String query = "INSERT INTO product (product_name, price, description, category_id, image_url) VALUES (?, ?, ?, ?, ?)";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, product.getProductName());
            statement.setFloat(2, (float) product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setInt(4, product.getCategoryId());
            statement.setString(5, product.getImageUrl());
            statement.executeUpdate();
        } catch (Exception e) {
            
        }
    }
    
    public void updateProduct(Product product) {
        String query = "UPDATE product SET product_name = ?, price = ?, description = ?, category_id = ?, image_url = ? WHERE product_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, product.getProductName());
            statement.setFloat(2, (float) product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setInt(4, product.getCategoryId());
            statement.setString(5, product.getImageUrl());
            statement.setInt(6, product.getProductId());
            statement.executeUpdate();
        } catch (Exception e) {
            
        }
    }
    
    public void deleteProduct(int productId) {
        String query = "DELETE FROM product WHERE product_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, productId);
            statement.executeUpdate();
        } catch (Exception e) {
            
        }
    }

    public List<Product> getProductByAId(int aid) {
        String query = "select * from product where product_id in ("
                + "  select product_id from cart_item where cart_id="
                + "  (select cart_id from cart where account_id=?))";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, aid);
            try ( ResultSet resultSet = statement.executeQuery()) {
                List<Product> list = new ArrayList<>();
                while (resultSet.next()) {
                    Product product = new Product();
                    product.setProductId(resultSet.getInt(1));
                    product.setProductName(resultSet.getString(2));
                    product.setPrice(resultSet.getFloat(3));
                    product.setDescription(resultSet.getString(4));
                    product.setCategoryId(resultSet.getInt(5));
                    product.setImageUrl(resultSet.getString(6));
                    list.add(product);
                }
                return list;
            } catch (Exception e) {
                
            }
        } catch (Exception e) {
            
        }
        return null;
    }
}





class test {

    public static void main(String[] args) {
        ProductDAO pdao = new ProductDAO();
        System.out.println(pdao.getProductByAId(1));
    }
}
