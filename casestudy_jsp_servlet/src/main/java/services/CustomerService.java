package services;


import model.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerService {
    void insertCustomer(Customer customer) throws SQLException;
    List<Customer> selectAllCustomer();
    void editCustomer() throws SQLException;
    void deleteCustomer() throws SQLException;
}
