package control;


import DAL.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author anhdu
 */
public class login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user") != null) {
            
            response.sendRedirect("home");
            
        } else request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        User account = new AccountDAO().accountCheck(user);
        
        //check username
        if(account!=null) {
            //check password
            if(pass.equals(account.getPassword())) {
                //success
                request.getSession().setAttribute("user", account);
                response.sendRedirect("home");
                return;
                
            } else {
                //wrong password
                request.setAttribute("msg", "Wrong password!");
                request.setAttribute("user", user);
            }
        //wrong username
        } else request.setAttribute("msg", "Wrong username!");
        
        
        
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

}

