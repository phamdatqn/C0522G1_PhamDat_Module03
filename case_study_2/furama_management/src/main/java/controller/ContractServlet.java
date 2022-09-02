package controller;

import model.contract.Contract;
import model.customer.Customer;
import model.facility.Facility;
import service.I_customer.ICustomerService;
import service.i_contract.IContractService;
import service.i_employee.IEmployeeService;
import service.i_facility.IFacilityService;
import service.impl.contract.ContractService;
import service.impl.customer.CustomerService;
import service.impl.employee.EmployeeService;
import service.impl.facility.FacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractServlet", value = "/contract")
public class ContractServlet extends HttpServlet {
    private static IContractService iContractService=new ContractService();
    private static ICustomerService iCustomerService=new CustomerService();
    private static IFacilityService iFacilityService=new FacilityService();
    private static IEmployeeService iEmployeeService=new EmployeeService();
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
            case "delete":
              //  delete(request, response);
                break;
            case "update":
              //  showFormUpdate(request, response);
                break;
            default:
                showAll(request, response);
        }
    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) {
        List<Facility>facilityList=iFacilityService.displayAll();
        List<Customer>customerList=iCustomerService.displayAll();
        List<Contract>contractList=iContractService.displayAll();

        request.setAttribute("facilityList",facilityList);
        request.setAttribute("customerList",customerList);
        request.setAttribute("contractList",contractList);

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/contract/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
