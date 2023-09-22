package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Sets;

/**
 *
 * @author anhdu
 */
public class SetDAO {
    
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet res = null;
    
    public ArrayList<Sets> getSet(String user) {
        
        try {
            String query = "select * from sets where owner = ?";
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, user);
            res = preparedStatement.executeQuery();
            
            ArrayList<Sets> ans = new ArrayList<>();
            while(res.next()) {
                ans.add(new Sets(Integer.parseInt(res.getString(1)), res.getString(2) , res.getString(3)));
            }
            return ans;
            
        } catch (Exception e) {}
        
        return null;
    }
    
    public ArrayList<Sets> getSetUser() {
        
        try {
            String query = "select * from sets s, account a where a.username = s.owner and (a.status is null or a.status != 'admin')";
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            
            res = preparedStatement.executeQuery();
            
            ArrayList<Sets> ans = new ArrayList<>();
            while(res.next()) {
                ans.add(new Sets(Integer.parseInt(res.getString(1)), res.getString(2) , res.getString(3)));
            }
            return ans;
            
        } catch (Exception e) {}
        
        return null;
    }
    
    public ArrayList<Sets> getSetAdmin() {
        
        try {
            String query = "select * from sets s, account a where a.username = s.owner and a.status = 'admin'";
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            
            res = preparedStatement.executeQuery();
            
            ArrayList<Sets> ans = new ArrayList<>();
            while(res.next()) {
                ans.add(new Sets(Integer.parseInt(res.getString(1)), res.getString(2) , res.getString(3)));
            }
            return ans;
            
        } catch (Exception e) {}
        
        return null;
    }
    
    public boolean addSet(String name, String owner) {
        
        try {
            String query = "insert into sets values(?,?)";
            
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, owner);
            preparedStatement.executeUpdate();
            
            return true;
            
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean deleteSet(String id) {
        
        try {
            
            String query = "delete from sets where id = ?";
            
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.executeUpdate();
            
            return true;
            
        } catch (Exception e) {
            return false;
        }
        
    }
    
    public String getSetName(String id) {
        
        try {
            String query = "select name from sets where id = ?";
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, id);
            res = preparedStatement.executeQuery();
            
            while(res.next()) {
                return res.getString(1);
            }
            return "";
            
        } catch (Exception e) {}
        
        return "";
        
    }
    
    public boolean renameSet(String name, String id) {
        
        try {
            
            String query = "update sets set name = ? where id = ?";
            
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, id);
            preparedStatement.executeUpdate();
            
            return true;
            
        } catch (Exception e) {
            return false;
        }
        
    }
    
    public int getLastedId(String user) {
        
        try {
            String query = "select top 1 id from sets where owner = ? order by id desc";
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, user);
            res = preparedStatement.executeQuery();
            
            while(res.next()) {
                return Integer.parseInt(res.getString(1));
            }
            
            
        } catch (Exception e) {}
        
        return -1;
        
    }
    
}
