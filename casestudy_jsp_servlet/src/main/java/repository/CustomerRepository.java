package repository;

import model.Customer;

import java.util.List;

public interface CustomerRepository {
    void insertCustomer();
    List<Customer> selectAllCustomer();
    void editCustomer();
    void deleteCustomer();
}
