package control;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author anhdu
 */
public class logout extends HttpServlet {
    
    private void logOut(HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        request.getSession().removeAttribute("user");
        response.sendRedirect("login");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logOut(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logOut(request, response);
    }

}

