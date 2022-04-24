package controller;

import model.*;
import repository.impl.EmployeeRepositoryImpl;
import services.*;
import services.impl.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "EmployeeController", urlPatterns = {"/employees"})

public class EmployeeController extends HttpServlet {
//    EmployeeRepositoryImpl employeeRepository = new EmployeeRepositoryImpl();
    private EmployeeService employeeService;
    private PositionService positionService;
    private EducationDegreeService educationDegreeService;
    private DivisionService divisionService;

    public void init() {
        employeeService = new EmployeeServiceImpl();
        positionService = new PositionServiceImpl();
        educationDegreeService = new EducationDegreeServiceImpl();
        divisionService = new DivisionServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertEmployee(request, response);
                    break;
                case "edit":
                    updateEmployee(request, response);
                    break;
                case "delete":
                    deleteEmployee(request, response);
                    break;
                case "search":
                    searchEmployeeByName(request, response);
                    break;
                case "search2":
                    searchEmployee(request, response);
                    break;
            }
        }catch(SQLException ex){
            throw new ServletException(ex);
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createEmployeeForm(request, response);
                break;
            case "edit":
                editEmployeeForm(request, response);
            default:
                displayAllEmployee(request, response);
                break;
        }
    }

    private void displayAllEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList = employeeService.selectAllEmployee();
        List<Position> positionList = positionService.selectAllPosition();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAllEducationDegree();
        List<Division> divisionList = divisionService.selectAllDivision();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("divisionList", divisionList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        dispatcher.forward(request, response);
    }

    private void createEmployeeForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Position> positionList = positionService.selectAllPosition();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAllEducationDegree();
        List<Division> divisionList = divisionService.selectAllDivision();
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/create.jsp");
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("divisionList", divisionList);
        dispatcher.forward(request, response);
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Integer employeeId = Integer.valueOf(request.getParameter("employeeId"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCardNumber = request.getParameter("idCardNumber");
        Double salary = Double.valueOf(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer position = Integer.valueOf(request.getParameter("position"));
        Integer educationDegree = Integer.valueOf(request.getParameter("educationDegree"));
        Integer division = Integer.valueOf(request.getParameter("division"));
        Employee employee = new Employee(employeeId, name, birthday, idCardNumber, salary, phone, email, address, position, educationDegree, division);
        employeeService.insertEmployee(employee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/create.jsp");
        dispatcher.forward(request, response);
    }


    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        employeeService.deleteEmployeeSP(employeeId);
        displayAllEmployee(request,response);
    }

    private void editEmployeeForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));// ko sửa tên tham số
        Employee existingEmployee = employeeService.selectEmployee(id);
        List<Position> positionList = positionService.selectAllPosition();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAllEducationDegree();
        List<Division> divisionList = divisionService.selectAllDivision();
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/edit.jsp");
        request.setAttribute("employee", existingEmployee);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("divisionList", divisionList);
        dispatcher.forward(request, response);
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        Integer employeeId = Integer.valueOf(request.getParameter("employeeId"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCardNumber = request.getParameter("idCardNumber");
        Double salary = Double.valueOf(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer position = Integer.valueOf(request.getParameter("position"));
        Integer educationDegree = Integer.valueOf(request.getParameter("educationDegree"));
        Integer division = Integer.valueOf(request.getParameter("division"));
        Employee employee = new Employee(employeeId, name, birthday, idCardNumber, salary, phone, email, address, position, educationDegree, division);
        employeeService.updateEmployee(employee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void searchEmployeeByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchName = request.getParameter("searchName");
        List<Employee> employeeList = employeeService.searchEmployeeByName(searchName);
        List<Position> positionList = positionService.selectAllPosition();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAllEducationDegree();
        List<Division> divisionList = divisionService.selectAllDivision();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("divisionList", divisionList);
        request.getRequestDispatcher("view/employee/list.jsp").forward(request, response);
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchName = request.getParameter("searchName");
        String searchAddress = request.getParameter("searchAddress");
        String searchDivision = request.getParameter("searchDivision") ;
        List<Employee> employeeList = employeeService.searchEmployee(searchName,searchAddress,searchDivision);
        List<Position> positionList = positionService.selectAllPosition();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAllEducationDegree();
        List<Division> divisionList = divisionService.selectAllDivision();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("divisionList", divisionList);
        request.getRequestDispatcher("view/employee/list.jsp").forward(request, response);
    }
}
