/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;


import java.security.cert.CRLReason;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author asus
 */
public class CategoryDAO extends  DBContext{

 

    public CategoryDAO() {
      
    }

    public List<Category> getAllCategories()  {
        String query = "SELECT * FROM category";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            try ( ResultSet resultSet = statement.executeQuery()) {
                List<Category> categories = new ArrayList<>();
                while (resultSet.next()) {
                    Category category = new Category();
                    category.setCategoryId(resultSet.getInt("category_id"));
                    category.setCategoryName(resultSet.getString("category_name"));
                    category.setParentCategoryId(resultSet.getInt("parent_category_id"));
                    categories.add(category);
                }
                return categories;
            }
            catch(Exception e){
                
            }
        }
        catch(Exception e){
                
            }
        return null;
    }

    public Category getCategoryById(int categoryId) {
        String query = "SELECT * FROM category WHERE category_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, categoryId);
            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Category category = new Category();
                    category.setCategoryId(resultSet.getInt(1));
                    category.setCategoryName(resultSet.getString(2));
                    category.setParentCategoryId(resultSet.getInt(3));
                    return category;
                } else {
                    return null;
                }
            }
            catch(Exception e){
                
            }
        }
        catch(Exception e){
                
            }
        return null;
    }

    public void addCategory(String category)  {
        String query = "INSERT INTO [category] ([category_name]) VALUES (?)";
        try  {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, category);            
            statement.executeUpdate();
        }
        catch(Exception e){
                
            }
    }

    public void updateCategory(int cid,String cname) {
        String query = "UPDATE category SET category_name = ? WHERE category_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, cname);

            

            statement.setInt(2, cid);
            statement.executeUpdate();
        }
        catch(Exception e){
                
            }
    }

    public void deleteCategory(int categoryId)  {
        String query = "DELETE FROM category WHERE category_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, categoryId);
            statement.executeUpdate();
        }
        catch(Exception e){
                
            }
    }
}

