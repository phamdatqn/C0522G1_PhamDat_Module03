package controller;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    public static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer(1, "Nam Buê Đuê", "22-12-1996", "Đà Nẽn", "https://kynguyenlamdep.com/wp-content/uploads/2022/06/avatar-cute-meo-con-than-chet-768x763.jpg"));
        customerList.add(new Customer(2, "Ân Buê Đuê", "22-12-1996", "Đà Nẽn", "https://kynguyenlamdep.com/wp-content/uploads/2022/06/avatar-cute-vui-nhon.jpg"));
        customerList.add(new Customer(3, "Hùng Buê Đuê Chúa", "22-12-1996", "Đà Nẽn", "https://kynguyenlamdep.com/wp-content/uploads/2022/06/avatar-de-thuong-cho-cap-doi-768x687.jpg"));
        customerList.add(new Customer(4, "Huy Buê Đuê Cute", "22-12-1996", "Đà Nẽn", "https://kynguyenlamdep.com/wp-content/uploads/2022/06/avatar-meo-de-thuong.jpg"));
        customerList.add(new Customer(5, "Lợi Buê Lợi Đuê", "22-12-1996", "Đà Nẽn", "https://kynguyenlamdep.com/wp-content/uploads/2022/06/avatar-cute-cho-co-nang-nghien-tra-sua-768x768.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/customer/list.jsp");
        request.setAttribute("customerList", customerList);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
