package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CurrencyServlet", value = "/Currency")
public class CurrencyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int usd = Integer.parseInt(request.getParameter("usd"));
        int rate = Integer.parseInt(request.getParameter("rate"));
        int converter = usd * rate;
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("input_usd", usd);
        request.setAttribute("result", converter);
        requestDispatcher.forward(request, response);
    }
}
