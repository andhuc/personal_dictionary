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
    
    public String registerAccount(String user, String pass) {
        
        try {
            String query = "insert into account values(?,?,NULL)";
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user);
            preparedStatement.setString(2, pass);
            preparedStatement.executeUpdate();
            return "Register successfully!";
            
        } catch (Exception e) {
            return "Register failed!";
        }
    }
    
}
