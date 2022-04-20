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
        customerRepo.insertCustomer();
    }

    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepo.selectAllCustomer();
    }

    @Override
    public void editCustomer() throws SQLException{
        customerRepo.editCustomer();
    }

    @Override
    public void deleteCustomer() throws SQLException{
        customerRepo.deleteCustomer();
    }
}

