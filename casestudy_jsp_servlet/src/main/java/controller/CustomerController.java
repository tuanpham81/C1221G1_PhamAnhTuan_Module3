package controller;

import model.Customer;
import model.CustomerType;
import repository.impl.BaseRepository;
import services.CustomerService;
import services.impl.CustomerServiceImpl;
import services.impl.CustomerTypeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerController", urlPatterns = {"/customers"})
public class CustomerController extends HttpServlet {
    private CustomerService customerService;
    private CustomerTypeService customerTypeService;

    public void init() {
        customerService = new CustomerServiceImpl();
        customerTypeService = new CustomerTypeService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertCustomer(request, response);
                    break;
                case "edit":
                    updateCustomer(request, response);
                    break;
                case "delete":
                    deleteCustomer(request, response);
                    break;
                case "search":
                    searchCustomerByName(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomerForm(request, response);
                break;
            case "edit":
                editCustomerForm(request, response);
            default:
                displayAllCustomer(request, response);
                break;
        }
    }

    private void editCustomerForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CustomerType> customerTypeList = customerTypeService.selectAllCustomerType();
        String id = request.getParameter("customerId");
        Customer existingCustomer = customerService.selectCustomer(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        request.setAttribute("customer", existingCustomer);
        request.setAttribute("customerTypeList", customerTypeList);
        dispatcher.forward(request, response);

    }

    private void createCustomerForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customerService.selectAllCustomer();
        List<CustomerType> customerTypeList = customerTypeService.selectAllCustomerType();
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
        dispatcher.forward(request, response);
    }


    private void displayAllCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customerService.selectAllCustomer();
        List<CustomerType> customerTypeList = customerTypeService.selectAllCustomerType();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String idCustomer = request.getParameter("idCustomer");
//        customerService.deleteCustomer(idCustomer);
        customerService.deleteCustomerSP(idCustomer);
        List<Customer> customerList = customerService.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        dispatcher.forward(request, response);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        Integer customerId = Integer.valueOf(request.getParameter("customerId"));
        Integer customerType = Integer.valueOf(request.getParameter("customerType"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        Integer gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Customer customer = new Customer(name, birthday, gender, idCard, phone, email, customerId, customerType, address);
        customerService.updateCustomer(customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        Integer customerId = Integer.valueOf(request.getParameter("customerId"));
        Integer customerType = Integer.valueOf(request.getParameter("customerType"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        Integer gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = new Customer(name, birthday, gender, idCard, phone, email, customerId, customerType, address);
        customerService.insertCustomer(customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        dispatcher.forward(request, response);
    }

    private void searchCustomerByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchName = request.getParameter("searchName");
        List<Customer> customerList = customerService.searchCustomerByName(searchName);
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("customer/list.jsp").forward(request, response);
    }
}
