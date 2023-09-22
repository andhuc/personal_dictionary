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
public class register extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user") != null) {
            
            response.sendRedirect("home");
            
        } else request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String pass2 = request.getParameter("pass2");
        User check = new AccountDAO().accountCheck(user);
        
        //check pass = retype pass
        if(pass.equals(pass2)) {
            
            //check username exist
            if(check==null) {

                //register
                String msg = new AccountDAO().registerAccount(user, pass);
                
                //go to login
                request.setAttribute("user", user);
                request.setAttribute("msgGreen", msg);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            
            //username existed
            } else request.setAttribute("msg", "Username existed!");
            
        //password didnt match
        } else request.setAttribute("msg", "Two password fields didn’t match");
        
        //register again
        request.setAttribute("user", user);
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

}

