package control.word;

import DAL.SetDAO;
import DAL.WordDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Word;



public class word extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("setId") == null) response.sendRedirect("set");
        
        String setId = request.getParameter("setId");
        
        ArrayList<Word> list = new WordDAO().getWord(setId);
        
        request.setAttribute("listWord", list);
        request.setAttribute("listSize", list.size());
        request.setAttribute("setId", setId);
        request.setAttribute("shareString", listToString(list));
        request.setAttribute("setName", new SetDAO().getSetName(setId));
        request.getRequestDispatcher("word.jsp").forward(request, response);

    }
    
    private String listToString(ArrayList<Word> list) {
        
        String ans = "";
        
        for(Word i : list)
            ans += i.getWord() + ":" + i.getMeaning() + ",";
        
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
