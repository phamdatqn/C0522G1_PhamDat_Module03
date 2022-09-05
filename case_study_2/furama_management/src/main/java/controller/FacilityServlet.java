package controller;

import model.facility.Facility;
import service.IRentTypeService;
import service.i_facility.IActactFacilityService;
import service.i_facility.IFacilityService;
import service.i_facility.IFacilityTypeService;
import service.impl.RentTypeService;
import service.impl.facility.ActactFacilityService;
import service.impl.facility.FacilityService;
import service.impl.facility.FacilityTypeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {
    private static IFacilityService iFacilityService = new FacilityService();
    private static IFacilityTypeService iFacilityTypeService = new FacilityTypeService();
    private static IRentTypeService iRentTypeService = new RentTypeService();
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
            case "addAttachFacility":
                addAttachFacility(request, response);
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

    private void addAttachFacility(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/attach_facility/list.jsp");
        request.setAttribute("attachFacilityList",iActactFacilityService.displayAll());
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String nameSearch = request.getParameter("nameSearch");
        List<Facility> facilityList = iFacilityService.search(nameSearch);

        request.setAttribute("facilityList", facilityList);
        request.setAttribute("rentTypeList", iRentTypeService.findAll());
        request.setAttribute("facilityTypeList", iFacilityTypeService.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/search.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showFormUpdate(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));
        Facility facility = iFacilityService.findById(id);
        request.setAttribute("facility", facility);
        request.setAttribute("rentTypeList", iRentTypeService.findAll());
        request.setAttribute("facilityTypeList", iFacilityTypeService.findAll());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/update.jsp");
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
        iFacilityService.delete(id);
        try {
            response.sendRedirect("/facility");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAll(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList = iFacilityService.displayAll();
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("facilityTypeList", iFacilityTypeService.findAll());
        request.setAttribute("rentTypeList", iRentTypeService.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("rentTypeList", iRentTypeService.findAll());
        request.setAttribute("facilityTypeList", iFacilityTypeService.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/create.jsp");
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
        int id = Integer.parseInt(request.getParameter("id"));
        Facility facility = iFacilityService.findById(id);
        facility.setName(request.getParameter("name"));
        facility.setArea(Integer.parseInt(request.getParameter("area")));
        facility.setCost(Double.parseDouble(request.getParameter("cost")));
        facility.setMaxPeople(Integer.parseInt(request.getParameter("maxPeople")));
        facility.setRentTypeId(Integer.parseInt(request.getParameter("rentTypeId")));
        facility.setFacilityTypeId(Integer.parseInt(request.getParameter("facilityTypeId")));
        facility.setStandardRoom(request.getParameter("standardRoom"));
        facility.setDescriptionOtherConvenience(request.getParameter("descriptionOtherConvenience"));
        facility.setPoolArea(Double.parseDouble(request.getParameter("poolArea")));
        facility.setNumberOfFloors(Integer.parseInt(request.getParameter("numberOfFloors")));
        facility.setFacilityFree(request.getParameter("facilityFree"));
        iFacilityService.update(id, facility);
        try {
            response.sendRedirect("/facility");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int renTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        String facilityFree = request.getParameter("facilityFree");
        iFacilityService.create(new Facility(name, area, cost, maxPeople, renTypeId, facilityTypeId, standardRoom,
                descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree));
        try {
            response.sendRedirect("/facility");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
