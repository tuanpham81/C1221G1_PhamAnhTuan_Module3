package services;


import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerService {
    void insertCustomer(Customer customer) throws SQLException;
    Customer selectCustomer(int id);
    List<Customer> selectAllCustomer();
    boolean updateCustomer(Customer customer) throws SQLException;
    boolean deleteCustomer(int id) throws SQLException;
    void deleteCustomerSP(int id) throws SQLException;
    List<Customer> searchCustomerByName(String searchName);
}
