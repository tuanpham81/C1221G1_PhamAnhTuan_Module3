package controller;

import model.Customer;
import service.CustomerService;
import service.impl.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerController", urlPatterns = "/customers")
public class CustomerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerService customerService;

    public void init() {
        customerService = new CustomerServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getParameter("action");
//        if (action == null) {
//            action = "";
//        }
//        try {
//            switch (action) {
////                case "create":
////                    insertUser(request, response);
////                    break;
////                case "edit":
////                    updateUser(request, response);
////                    break;
////                case "search":
////                    searchUserByCountry(request, response);
////                    break;
////                case "delete":
////                    deleteUser(request, response);
////                    break;
////                case "sortbyname":
////                    sortByName(request, response);
//            }
//        } catch (SQLException ex) {
//            throw new ServletException(ex);
//        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateCustomerForm(request, response);
                break;
            case "edit":
                showEditCustomerForm(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
//                case "permision":
//                    addUserPermision(request, response);
//                    break;
            default:
                listCustomer(request, response);
                break;
        }
    }

    private void showEditCustomerForm(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showCreateCustomerForm(HttpServletRequest request, HttpServletResponse response) {
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
    }

    private void listCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> listCustomer = customerService.selectAllCustomers();
        request.setAttribute("listCustomer", listCustomer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        dispatcher.forward(request, response);
        System.out.println("Da chuyen");
    }

}
