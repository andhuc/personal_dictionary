package control.word;

import DAL.WordDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class addWord extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (request.getParameter("key") != null && request.getParameter("value") != null && request.getParameter("setId") != null) {
            
            new WordDAO().addWord(request.getParameter("key"), request.getParameter("value"), request.getParameter("setId"));
            
            response.sendRedirect("word?setId=" + request.getParameter("setId"));
        }
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
