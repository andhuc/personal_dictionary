package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Word;

/**
 *
 * @author anhdu
 */
public class WordDAO {
    
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet res = null;
    
    public ArrayList<Word> getWord(String setID) {
        
        try {
            String query = "select * from word where setID = ?";
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            
            preparedStatement.setString(1, setID);
            res = preparedStatement.executeQuery();
            
            ArrayList<Word> ans = new ArrayList<>();
            while(res.next()) {
                ans.add(new Word(Integer.parseInt(res.getString(1)), res.getString(2) , res.getString(3), Integer.parseInt(res.getString(4))));
            }
            return ans;
            
        } catch (Exception e) {}
        
        return null;
    }
    
    public boolean addWord(String word, String meaning, String setID) {
        System.out.println(word + " " + meaning + " " + setID);
        try {
            String query = "insert into word values(?,?,?)";
            
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, word);
            preparedStatement.setString(2, meaning);
            preparedStatement.setString(3, setID);
            preparedStatement.executeUpdate();
            
            return true;
            
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean deleteWord(String id) {
        
        try {
            
            String query = "delete from word where id = ?";
            
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, id);
            preparedStatement.executeUpdate();
            
            return true;
            
        } catch (Exception e) {
            return false;
        }
        
    }
    
    public boolean editWord(String word, String meaning, String id) {
        
        try {
            
            String query = "update word set word = ?, meaning = ? where id = ?";
            
            connection = new DBContext().getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, word);
            preparedStatement.setString(2, meaning);
            preparedStatement.setString(3, id);
            preparedStatement.executeUpdate();
            
            return true;
            
        } catch (Exception e) {
            return false;
        }
        
    }
    
}
