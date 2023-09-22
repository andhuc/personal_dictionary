package control;

import DAL.SetDAO;
import DAL.WordDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Word;



public class practice extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("setId") == null) response.sendRedirect("set");

        String setId = request.getParameter("setId");
        
        ArrayList<Word> list = new WordDAO().getWord(setId);
        
        request.setAttribute("listWord", getWord(list));
        request.setAttribute("listMeaning", getMeaning(list));
        
        request.setAttribute("listSize", list.size());
        request.setAttribute("setId", setId);
        request.setAttribute("setName", new SetDAO().getSetName(setId));
        request.getRequestDispatcher("practice.jsp").forward(request, response);

    }
    
    private ArrayList<String> getWord(ArrayList<Word> list) {
        
        ArrayList<String> ans = new ArrayList<>();
        
        for(Word i : list)
            ans.add("'" + i.getWord() + "'");
        
        return ans;
    }
    
    private ArrayList<String> getMeaning(ArrayList<Word> list) {
        
        ArrayList<String> ans = new ArrayList<>();
        
        for(Word i : list)
            ans.add("'" + i.getMeaning()+ "'");
        
        return ans;
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
