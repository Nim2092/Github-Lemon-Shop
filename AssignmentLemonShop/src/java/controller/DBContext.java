/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    protected Connection connection;

    public Connection getConnection() {
        return connection;
    }

    public DBContext() {
        try {
            //NOTE: CHANGE VALUES OF user,pass,url TO FIT YOUR SYSTEM ENVIRONMENT
            //DO NOT CHANGE THE STRUCTURE OF THE CONSTRUCTOR
            String user = "sa";
            String pass = "12345678";
            String url = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=Assignment_LemonShop";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

class Test {

    public static void main(String[] args) {
        DBContext db = new DBContext();
        Connection con = null;
        try {
            con = db.getConnection();
            System.out.println("ket noi thang cong");
        } catch (Exception e) {
            System.out.println("ket noit that bai" + e.getMessage());
        }
    }
}
