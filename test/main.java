
import DAL.AccountDAO;
import DAL.DBContext;
import DAL.SetDAO;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author anhdu
 */
public class main {
    public static void main(String[] args) {
        
        String s = "kjbk";
        String[] spl = s.split(":");
        
        for(String i : spl)
            System.out.println(i);
        
        System.out.println(spl.length);
    }
}
