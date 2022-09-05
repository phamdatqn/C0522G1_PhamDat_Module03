package controller;

import model.contract.Contract;
import model.customer.Customer;
import model.facility.AttachFacility;
import model.facility.Facility;
import service.I_customer.ICustomerService;
import service.i_contract.IContractDetailService;
import service.i_contract.IContractService;
import service.i_employee.IEmployeeService;
import service.i_facility.IActactFacilityService;
import service.i_facility.IFacilityService;
import service.impl.contract.ContractDetailService;
import service.impl.contract.ContractService;
import service.impl.customer.CustomerService;
import service.impl.employee.EmployeeService;
import service.impl.facility.ActactFacilityService;
import service.impl.facility.FacilityService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractServlet", value = "/contract")
public class ContractServlet extends HttpServlet {
    private static IContractService iContractService = new ContractService();
    private static ICustomerService iCustomerService = new CustomerService();
    private static IFacilityService iFacilityService = new FacilityService();
    private static IEmployeeService iEmployeeService = new EmployeeService();
    private static IContractDetailService iContractDetailService=new ContractDetailService();
    private static IActactFacilityService iActactFacilityService=new ActactFacilityService();

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
            case "showDetail":
                showDetail(request, response);
                break;
            case "create":
                create(request, response);
                break;
            case "update":
                //  showFormUpdate(request, response);
                break;
//                case "addAttact":
//                    addAttactFacility(request, response);
//                break;
            default:
                showAll(request, response);
        }
    }


    private void showDetail(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("attachFacilityList",iActactFacilityService.displayAll());
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/attach_facility/list.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void create(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/contract/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = iFacilityService.displayAll();
        List<Customer> customerList = iCustomerService.displayAll();
        List<Contract> contractList = iContractService.displayAll();
        List<AttachFacility> attachFacilityList = iActactFacilityService.displayAll();

        request.setAttribute("facilityList", facilityList);
        request.setAttribute("customerList", customerList);
        request.setAttribute("contractList", contractList);
        request.setAttribute("attachFacilityList", attachFacilityList);
        request.setAttribute("employeeList", iEmployeeService.displayAll());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/contract/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("employeeList", iEmployeeService.displayAll());
        request.setAttribute("customerList", iCustomerService.displayAll());
        request.setAttribute("facilityList", iFacilityService.displayAll());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/contract/create.jsp");
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
                //  showFormUpdate(request, response);
                break;
            default:
                showAll(request, response);
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        double deposit = Double.parseDouble(request.getParameter("deposit"));
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int facilityId = Integer.parseInt(request.getParameter("facilityId"));

        Contract contract = new Contract(startDate, endDate, deposit, employeeId, customerId, facilityId);
        iContractService.create(contract);

        try {
            response.sendRedirect("/contract");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
