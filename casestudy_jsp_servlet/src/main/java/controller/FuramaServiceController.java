package controller;

import model.Customer;
import model.CustomerType;
import model.FuramaService;
import services.FuramaServiceService;
import services.impl.CustomerServiceImpl;
import services.impl.CustomerTypeService;
import services.impl.FuramaServiceServiceImpl;

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
    public void init() {
        serviceService = new FuramaServiceServiceImpl();
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
        Integer serviceId = Integer.valueOf(request.getParameter("ma_dich_vu"));
        String name = request.getParameter("ten_dich_vu");
        Float area = Float.valueOf(request.getParameter("dien_tich"));
        Float cost = Float.valueOf(request.getParameter("chi_phi_thue"));
        Integer maxPeople = Integer.parseInt(request.getParameter("so_nguoi_toi_da"));
        Integer rentTypeId = Integer.parseInt(request.getParameter("ma_kieu_thue"));
        Integer serviceTypeId = Integer.valueOf(request.getParameter("ma_loai_dich_vu"));
        String standard = request.getParameter("tieu_chuan_phong");
        String otherConvenient = request.getParameter("mo_ta_tien_nghi_khac");
        Float poolArea = Float.valueOf(request.getParameter("dien_tich_ho_boi"));
        Integer floorNumber = Integer.valueOf(request.getParameter("so_tang"));

        FuramaService service = new FuramaService(serviceId, name, area, cost, maxPeople, rentTypeId, serviceTypeId, standard, otherConvenient, poolArea, floorNumber);
        serviceService.insertService(service);
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama_service/create.jsp");
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama_service/create.jsp");
        dispatcher.forward(request, response);
    }

    private void displayAllService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<FuramaService> serviceList = serviceService.selectAllService();
        request.setAttribute("serviceList", serviceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama_service/list.jsp");
        dispatcher.forward(request, response);
    }
}
