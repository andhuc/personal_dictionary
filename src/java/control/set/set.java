package control.set;

import DAL.SetDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Sets;
import model.User;


public class set extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User account = (User)request.getSession().getAttribute("user");
        ArrayList<Sets> list;
        
        request.setAttribute("listSetAdmin", new SetDAO().getSetAdmin());
        
        if(!account.getStatus().equals("admin")) {
            list = new SetDAO().getSet(account.getUsername());
        } else list = new SetDAO().getSetUser();
        
        request.setAttribute("listSet", list);
        request.getRequestDispatcher("set.jsp").forward(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
