package controller;

import model.Customer;
import services.CustomerService;
import services.impl.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerController", urlPatterns = {"/customers", "/"})
public class CustomerController extends HttpServlet {
    private CustomerService customerService;

    public void init() {
        customerService = new CustomerServiceImpl();
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
                    editCustomer(request, response);
                    break;
//                case "delete":
//                    deleteUser(request, response);
//                    break;
//                case "search":
//                    searchUserByCountry(request, response);
//                    break;
//                case "sortbyname":
//                    sortByName(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String customerId = request.getParameter("customerId");
        Integer customerType = Integer.parseInt(request.getParameter("customerType"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        Integer gender = Integer.parseInt(request.getParameter("gender"));
        Integer idCard = Integer.parseInt(request.getParameter("idCard"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Customer customer = new Customer(name, birthday, gender, idCard, phone, email, customerId, customerType, address);
        customerService.insertCustomer(customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        dispatcher.forward(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
//        try {
            switch (action) {
                case "create":
                    createNewCustomer(request, response);
                    break;
                case "edit":
                    editCustomer(request, response);
                default:
                    displayAllCustomer(request, response);
                    break;
            }
//        } catch (SQLException ex) {
//            throw new ServletException(ex);
//        }
    }


    private void createNewCustomer(HttpServletRequest request, HttpServletResponse response) {
    }

    private void displayAllCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customerService.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        dispatcher.forward(request, response);
    }
}
