package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;

/**
 *
 * @author anhdu
 */
public class AccountDAO {
    
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet res = null;
    
    public User accountCheck(String user) {
        
        try {
            String query = "select * from account where [username] = ?";
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, user);
            
            res = preparedStatement.executeQuery();
            
            while(res.next()) {
                return new User(res.getString(1), res.getString(2), res.getString(3));
            }
            
        } catch (Exception e) {}
        
        return null;
    }
    
    public String registerAccount(String user, String pass, String name, String email, String address, String phone, String dob) {
        
        try {
            String query = "insert into account(account_name, account_username, account_password, account_email, account_address, account_phone, account_dob) values(?,?,?,?,?,?,?)";
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, user);
            preparedStatement.setString(3, pass);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, address);
            preparedStatement.setString(6, phone);
            preparedStatement.setString(7, dob);
            preparedStatement.executeUpdate();
            return "Register successfully!";
            
        } catch (Exception e) {
            return "Register failed!";
        }
    }
    
}
