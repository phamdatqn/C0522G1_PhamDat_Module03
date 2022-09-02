package controller;

import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;
import service.i_employee.IDivisionService;
import service.i_employee.IEducationDegreeService;
import service.i_employee.IEmployeeService;
import service.i_employee.IPositionService;
import service.impl.employee.DivisionService;
import service.impl.employee.EducationDegreeService;
import service.impl.employee.EmployeeService;
import service.impl.employee.PositionService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmloyeeServlet", value = "/employee")
public class EmloyeeServlet extends HttpServlet {
    private static IEmployeeService iEmployeeService = new EmployeeService();
    private static IEducationDegreeService iEducationDegreeService = new EducationDegreeService();
    private static IPositionService iPositionService = new PositionService();
    private static IDivisionService iDivisionService = new DivisionService();

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
                delete(request, response);
                break;
            case "update":
                  showFormUpdate(request, response);
                break;
            default:
                showAll(request, response);
        }
    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {
        List<EducationDegree> educationDegreeList = iEducationDegreeService.displayAll();
        List<Position> positionList = iPositionService.displayAll();
        List<Division> divisionList = iDivisionService.displayAll();

        int id= Integer.parseInt(request.getParameter("id"));
        Employee employee=iEmployeeService.findById(id);

        request.setAttribute("employee",employee);
        request.setAttribute("educationDegreeList",educationDegreeList);
        request.setAttribute("positionList",positionList);
        request.setAttribute("divisionList",divisionList);

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/employee/update.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        iEmployeeService.delete(id);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) {
        List<EducationDegree> educationDegreeList = iEducationDegreeService.displayAll();
        List<Position> positionList = iPositionService.displayAll();
        List<Division> divisionList = iDivisionService.displayAll();
        List<Employee> employeeList = iEmployeeService.displayAll();

        request.setAttribute("positionList", positionList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("employeeList", employeeList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        List<EducationDegree> educationDegreeList = iEducationDegreeService.displayAll();
        List<Position> positionList = iPositionService.displayAll();
        List<Division> divisionList = iDivisionService.displayAll();

        request.setAttribute("positionList", positionList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("educationDegreeList", educationDegreeList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/employee/create.jsp");
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

    private void update(HttpServletRequest request, HttpServletResponse response) {
        int id= Integer.parseInt(request.getParameter("id"));
        Employee employee=iEmployeeService.findById(id);

        employee.setName(request.getParameter("name"));
        employee.setDateOfBirth(request.getParameter("dateOfBirth"));
        employee.setIdCard(request.getParameter("idCard"));
        employee.setSalary(Double.parseDouble(request.getParameter("salary")));
        employee.setPhoneNumber(request.getParameter("phoneNumber"));
        employee.setEmail(request.getParameter("email"));
        employee.setAddress(request.getParameter("address"));
        employee.setPositionId(Integer.parseInt(request.getParameter("positionId")));
        employee.setDivisionId(Integer.parseInt(request.getParameter("divisionId")));
        employee.setEducationDegreeId(Integer.parseInt(request.getParameter("educationDegreeId")));

        iEmployeeService.update(id,employee);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));

        iEmployeeService.create(new Employee(name, dateOfBirth, idCard, salary, phoneNumber, email, address, positionId, divisionId, educationDegreeId));

        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
