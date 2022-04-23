package controller;

import model.FuramaService;
import model.RentType;
import model.ServiceType;
import services.FuramaServiceService;
import services.RentTypeService;
import services.ServiceTypeService;
import services.impl.FuramaServiceServiceImpl;
import services.impl.RentTypeServiceImpl;
import services.impl.ServiceTypeServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "FuramaServiceController", urlPatterns = {"/services"})
public class FuramaServiceController extends HttpServlet {
    private FuramaServiceService serviceService;
    private RentTypeService rentTypeService;
    private ServiceTypeService serviceTypeService;
    public void init() {
        serviceService = new FuramaServiceServiceImpl();
        rentTypeService = new RentTypeServiceImpl();
        serviceTypeService = new ServiceTypeServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    insertService(request, response);
                } catch (SQLException ex) {
                    throw new ServletException(ex);
                }
                break;
        }
    }

    private void insertService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Integer serviceId = Integer.valueOf(request.getParameter("serviceId"));
        String name = request.getParameter("name");
        Integer area = Integer.valueOf(request.getParameter("area"));
        Double cost = Double.valueOf(request.getParameter("cost"));
        Integer maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        Integer rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        Integer serviceTypeId = Integer.valueOf(request.getParameter("serviceTypeId"));
        String standard = request.getParameter("standard");
        String otherConvenient = request.getParameter("otherConvenient");
        Double poolArea = Double.valueOf(request.getParameter("poolArea"));
        Integer floorNumber = Integer.valueOf(request.getParameter("floorNumber"));

        FuramaService service = new FuramaService(serviceId, name, area, cost, maxPeople, rentTypeId, serviceTypeId, standard, otherConvenient, poolArea, floorNumber);
        serviceService.insertService(service);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/furama_service/create.jsp");
        dispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createServiceForm(request, response);
                break;
            default:
                displayAllService(request, response);
                break;
        }
    }

    private void createServiceForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<FuramaService> serviceList = serviceService.selectAllService();
        List<RentType> rentTypeList = rentTypeService.selectAllRentType();
        List<ServiceType> serviceTypeList = serviceTypeService.selectAllServiceType();
        request.setAttribute("serviceList", serviceList);
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("serviceTypeList", serviceTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/furama_service/create.jsp");
        dispatcher.forward(request, response);
    }

    private void displayAllService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<FuramaService> serviceList = serviceService.selectAllService();
        List<RentType> rentTypeList = rentTypeService.selectAllRentType();
        List<ServiceType> serviceTypeList = serviceTypeService.selectAllServiceType();
        request.setAttribute("serviceList", serviceList);
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("serviceTypeList", serviceTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/furama_service/list.jsp");
        dispatcher.forward(request, response);
    }
}
