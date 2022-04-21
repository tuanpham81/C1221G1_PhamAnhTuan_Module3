package services.impl;

import model.Customer;
import repository.CustomerRepository;
import repository.impl.CustomerRepositoryImpl;
import services.CustomerService;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    private CustomerRepository customerRepo = new CustomerRepositoryImpl();

    @Override
    public void insertCustomer(Customer customer) throws SQLException{
        customerRepo.insertCustomer(customer);
    }

    @Override
    public Customer selectCustomer(int id) {
        return customerRepo.selectCustomer(id);
    }

    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepo.selectAllCustomer();
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException{
        return customerRepo.updateCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException{
        return customerRepo.deleteCustomer(id);
    }

    @Override
    public void deleteCustomerSP(int id) throws SQLException{
        customerRepo.deleteCustomerSP(id);
    }

    @Override
    public List<Customer> searchCustomerByName(String searchName) {
        return customerRepo.searchCustomerByName(searchName);
    }
}

