package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "DictionaryServlet", value = "/Dictionary")
public class DictionaryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Map<String, String> dictionary = new HashMap<>();
        dictionary.put("hello", "Xin chào");
        dictionary.put("how", "Thế nào");
        dictionary.put("book", "Quyển vở");
        dictionary.put("computer", "Máy tính");

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        String search = request.getParameter("txtSearch");
        String result = dictionary.get(search);
        String noResult = "Không tìm thấy";
        if (result != null) {
            request.setAttribute("word", search);
            request.setAttribute("result", result);
        } else {
            request.setAttribute("noResult", noResult);
        }
        requestDispatcher.forward(request, response);

    }
}
