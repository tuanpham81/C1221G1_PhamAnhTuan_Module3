package services;


import model.Customer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface CustomerService {
    Map<String, String> insertCustomer(Customer customer) throws SQLException;

//    void insertCustomer(Customer customer) throws SQLException;

    Customer selectCustomer(String id);

    List<Customer> selectAllCustomer();

    boolean updateCustomer(Customer customer) throws SQLException;

//    boolean deleteCustomer(String id) throws SQLException;

    void deleteCustomerSP(String id) throws SQLException;

    List<Customer> searchCustomerByName(String searchName);

}
