package controller;

import model.contract.Contract;
import model.contract.ContractDetail;
import service.i_contract.IContractDetailService;
import service.i_contract.IContractService;
import service.i_facility.IActactFacilityService;
import service.impl.contract.ContractDetailService;
import service.impl.contract.ContractService;
import service.impl.facility.ActactFacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractDetailServlet", value = "/contractdetail")
public class ContractDetailServlet extends HttpServlet {
    private static IContractService iContractService=new ContractService();
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
                showFormContractDetail(request, response);
                break;
            default:
                showAll(request, response);
        }
    }

    private void showFormContractDetail(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("contractList",iContractService.displayAll());
        request.setAttribute("attachFacilityList",iActactFacilityService.displayAll());

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/contract_detail/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("attachFacilityList",iActactFacilityService.displayAll());
        request.setAttribute("contractDetailList",iContractDetailService.displayAll());

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/contract_detail/list.jsp");
        try {
            requestDispatcher.forward(request,response);
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
            case "add":
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
        int contractId= Integer.parseInt(request.getParameter("contractId"));
        int attachFacilityId= Integer.parseInt(request.getParameter("attachFacilityId"));
        int quantity= Integer.parseInt(request.getParameter("quantity"));

        iContractDetailService.create(new ContractDetail(contractId,attachFacilityId,quantity));
        try {
            response.sendRedirect("/contractdetail");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
