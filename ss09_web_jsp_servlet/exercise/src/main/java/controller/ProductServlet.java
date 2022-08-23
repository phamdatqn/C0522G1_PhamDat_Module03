package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameProduct = request.getParameter("productDescription");
        double price = Double.parseDouble(request.getParameter("listPrice"));
        double discountPercen = Double.parseDouble(request.getParameter("discountPercen"));
        double discountAmount = price * discountPercen * 0.01;
        double discountPrice = price - discountAmount;

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("nameProduct", nameProduct);
        request.setAttribute("price", price);
        request.setAttribute("discountPercen", discountPercen);
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("discountPrice", discountPrice);
        requestDispatcher.forward(request, response);

    }
}
