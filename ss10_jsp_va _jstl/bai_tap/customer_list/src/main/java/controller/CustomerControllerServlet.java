package controller;

import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerControllerServlet",urlPatterns = {"/customer"})
public class CustomerControllerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer(1,"Pham Anh Tuan","08-01-1996", "Ha Tinh", "https://cdn2.vectorstock.com/i/1000x1000/38/21/male-face-avatar-logo-template-pictograph-vector-11333821.jpg"));
        customerList.add(new Customer(1,"Pham Việt Khoa","08-01-1996", "Ha Tinh", "https://cdn2.vectorstock.com/i/1000x1000/38/21/male-face-avatar-logo-template-pictograph-vector-11333821.jpg"));
        customerList.add(new Customer(1,"Pham Quang Trường","08-01-1996", "Ha Tinh", "https://cdn2.vectorstock.com/i/1000x1000/38/21/male-face-avatar-logo-template-pictograph-vector-11333821.jpg"));
        customerList.add(new Customer(1,"Pham Anh Tuan","08-01-1996", "Ha Tinh", "https://cdn2.vectorstock.com/i/1000x1000/38/21/male-face-avatar-logo-template-pictograph-vector-11333821.jpg"));
        customerList.add(new Customer(1,"Pham Anh Tuan","08-01-1996", "Ha Tinh", "https://cdn2.vectorstock.com/i/1000x1000/38/21/male-face-avatar-logo-template-pictograph-vector-11333821.jpg"));
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }
}
