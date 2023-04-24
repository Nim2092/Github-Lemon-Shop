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

import model.Account;

import model.Account;

public class AccountDAO {

    private Connection connection;

    public AccountDAO(Connection connection) {
        this.connection = connection;
    }

    public AccountDAO() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void addAccount(Account account) throws SQLException {
        String query = "INSERT INTO account (username, password, email, full_name, phone_number, address, date_of_birth, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, account.getUsername());
            statement.setString(2, account.getPassword());
            statement.setString(3, account.getEmail());
            statement.setString(4, account.getFullName());
            statement.setString(5, account.getPhoneNumber());
            statement.setString(6, account.getAddress());
            statement.setDate(7, (Date) account.getDateOfBirth());
            statement.setInt(8, account.getRole());
            statement.executeUpdate();
        }
    }

    public void updateAccount(Account account) throws SQLException {
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
    }

    public void deleteAccount(String username) throws SQLException {
        String query = "DELETE FROM account WHERE username = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, username);
            statement.executeUpdate();
        }
    }

    public Account getAccountByUsername(String username) throws SQLException {
        String query = "SELECT * FROM account WHERE username = ?";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, username);
            try ( ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Account account = new Account();
                    account.setAccountId(resultSet.getInt("account_id"));
                    account.setUsername(resultSet.getString("username"));
                    account.setPassword(resultSet.getString("password"));
                    account.setEmail(resultSet.getString("email"));
                    account.setFullName(resultSet.getString("full_name"));
                    account.setPhoneNumber(resultSet.getString("phone_number"));
                    account.setAddress(resultSet.getString("address"));
                    account.setDateOfBirth(resultSet.getDate("date_of_birth"));
                    account.setRole(resultSet.getInt("role"));
                    return account;
                } else {
                    return null;
                }
            }
        }
    }

    public List<Account> getAllAccounts() throws SQLException {
        String query = "SELECT * FROM account";
        try ( PreparedStatement statement = connection.prepareStatement(query)) {
            try ( ResultSet resultSet = statement.executeQuery()) {
                List<Account> accounts = new ArrayList<>();
                while (resultSet.next()) {
                    Account account = new Account();
                    account.setAccountId(resultSet.getInt("account_id"));
                    account.setUsername(resultSet.getString("username"));
                    account.setPassword(resultSet.getString("password"));
                    account.setEmail(resultSet.getString("email"));
                    account.setFullName(resultSet.getString("full_name"));
                    account.setPhoneNumber(resultSet.getString("phone_number"));
                    account.setAddress(resultSet.getString("address"));
                    account.setDateOfBirth(resultSet.getDate("date_of_birth"));
                    account.setRole(resultSet.getInt("role"));
                    accounts.add(account);
                }
                return accounts;
            }
        }
    }
}
