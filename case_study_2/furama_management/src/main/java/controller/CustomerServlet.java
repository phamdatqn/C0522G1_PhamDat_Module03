package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import service.I_customer.ICustomerService;
import service.I_customer.ICustomerTypeService;
import service.impl.customer.CustomerService;
import service.impl.customer.CustomerTypeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static ICustomerService iCustomerService = new CustomerService();
    private static ICustomerTypeService iCustomerTypeService = new CustomerTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showFormCreate(request, response);
                break;
            case "search":
                search(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "update":
                showFormUpdate(request, response);
                break;
            default:
                showAll(request, response);
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String nameSearch=request.getParameter("nameSearch");
        String addressSearch=request.getParameter("addressSearch");
        String phoneNumberSearch=request.getParameter("phoneNumberSearch");

        request.setAttribute("customerTypeList", iCustomerTypeService.findAll());
        List<Customer> customerListSearch= iCustomerService.search(nameSearch,addressSearch,phoneNumberSearch);
        request.setAttribute("customersList",customerListSearch);

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/customer/search.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer=iCustomerService.findById(id);
        RequestDispatcher requestDispatcher;
        if (customer == null) {
            requestDispatcher = request.getRequestDispatcher("view/customer/error.jsp");
        } else {
            request.setAttribute("customerTypeList", iCustomerTypeService.findAll());
            request.setAttribute("customer",customer );
            requestDispatcher = request.getRequestDispatcher("view/customer/update.jsp");
        }

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        iCustomerService.delete(id);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        List<Customer> customersList = iCustomerService.displayAll();
        request.setAttribute("customersList", customersList);
        request.setAttribute("customerTypeList", iCustomerTypeService.findAll());
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                save(request, response);
                break;
            case "update":
                update(request, response);
                break;
            default:
                showAll(request, response);
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        Boolean gender = Boolean.valueOf(request.getParameter("gender"));
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeId = Integer.parseInt((request.getParameter("customerType")));

        Customer customer=new Customer(name, gender, dateOfBirth, idCard, phoneNumber, email, address, customerTypeId);
        Map<String,String> map= iCustomerService.create(customer);
        String mess ="Thêm mới thành công !";
        if (!map.isEmpty()){
            mess="Thêm mới không thành công";
            request.setAttribute("error",map);
        }
        request.setAttribute("mess", mess);
       RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/customer/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        List<CustomerType>customerTypeList=iCustomerTypeService.findAll();
        request.setAttribute("customerTypeList",customerTypeList );
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = iCustomerService.findById(id);

        customer.setCustomerTypeId(Integer.parseInt(request.getParameter("customerType")));
        customer.setName(request.getParameter("name"));
        customer.setGender(Boolean.parseBoolean(request.getParameter("gender")));
        customer.setDateOfBirth(request.getParameter("dateOfBirth"));
        customer.setIdCard(request.getParameter("idCard"));
        customer.setPhoneNumber(request.getParameter("phoneNumber"));
        customer.setEmail(request.getParameter("email"));
        customer.setAddress(request.getParameter("address"));

        iCustomerService.update(id, customer);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
