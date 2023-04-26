package DAL;

/**
 *
 * @author asus
 */

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import java.sql.SQLException;
import java.sql.Statement;



import model.Account;

public class AccountDAO extends DBContext{

    

  

    public AccountDAO() {

    }

 public void addAccount(String name,String password,String email,String full_name,String phone_number,String  address,String  date_of_birth) {
        String query = "INSERT INTO account (username, password, email, full_name, phone_number, address, date_of_birth) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, name);
            statement.setString(2, password);
            statement.setString(3, email);
            statement.setString(4, full_name);
            statement.setString(5, phone_number);
            statement.setString(6, address);
            statement.setString(7,date_of_birth );
            statement.executeUpdate();
        }
        catch(Exception e){
            
        }
    }

    public void updateAccount(Account account)  {
        String query = "UPDATE account SET password = ?, email = ?, full_name = ?, phone_number = ?, address = ?, date_of_birth = ?, role = ? WHERE username = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, account.getPassword());
            statement.setString(2, account.getEmail());
            statement.setString(3, account.getFullName());
            statement.setString(4, account.getPhoneNumber());
            statement.setString(5, account.getAddress());
            statement.setDate(6, (Date) account.getDateOfBirth());
            statement.setInt(7, account.getRole());
            statement.setString(8, account.getUsername());
            statement.executeUpdate();
        }
        catch(Exception e){
            
        }
    }

    public void deleteAccount(String username) {
        String query = "DELETE FROM account WHERE username = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, username);
            statement.executeUpdate();
        }
        catch(Exception e){
            
        }
    }

    public Account getAccountByUsername(String username) {
        String query = "SELECT * FROM account WHERE username = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, username);
            try ( ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Account account = new Account();
                    account.setAccountId(resultSet.getInt(1));
                    account.setUsername(resultSet.getString(2));
                    account.setPassword(resultSet.getString(3));
                    account.setEmail(resultSet.getString(4));
                    account.setFullName(resultSet.getString(5));
                    account.setPhoneNumber(resultSet.getString(6));
                    account.setAddress(resultSet.getString(7));
                    account.setDateOfBirth(resultSet.getDate(8));
                    account.setRole(resultSet.getInt(9));
                    return account;
                }
            } catch (Exception e) {
            }
        } catch (Exception e) {

        }
        return null;
    }
    public Account getAccountByAid(int aid)  {
        String query = "SELECT * FROM account WHERE account_id = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, aid);
            try ( ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Account account = new Account();
                    account.setAccountId(resultSet.getInt(1));
                    account.setUsername(resultSet.getString(2));
                    account.setPassword(resultSet.getString(3));
                    account.setEmail(resultSet.getString(4));
                    account.setFullName(resultSet.getString(5));
                    account.setPhoneNumber(resultSet.getString(6));
                    account.setAddress(resultSet.getString(7));
                    account.setDateOfBirth(resultSet.getDate(8));
                    account.setRole(resultSet.getInt(9));
                    return account;
                }
            }
            catch(Exception e){}
        }
            catch(Exception e){
            
        }
            return null;
        }
        
    

    public List<Account> getAllAccounts() {
        String query = "SELECT * FROM account";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            try ( ResultSet resultSet = statement.executeQuery()) {
                List<Account> accounts = new ArrayList<>();
                while (resultSet.next()) {
                    Account account = new Account();
                    account.setAccountId(resultSet.getInt(1));
                    account.setUsername(resultSet.getString(2));
                    account.setPassword(resultSet.getString(3));
                    account.setEmail(resultSet.getString(4));
                    account.setFullName(resultSet.getString(5));
                    account.setPhoneNumber(resultSet.getString(6));
                    account.setAddress(resultSet.getString(7));
                    account.setDateOfBirth(resultSet.getDate(8));
                    account.setRole(resultSet.getInt(9));
                    
                    accounts.add(account);
                }
                
                return accounts;
            }
            
        }catch(Exception e){
            
        }
        return null;
        
    }
}
class  test{
    public static void main(String[] args) {
        AccountDAO accountDAO= new AccountDAO();
        System.out.println(accountDAO.getAccountByAid(1));
    }
}
