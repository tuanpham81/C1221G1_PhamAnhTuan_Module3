package services.impl;

import model.Customer;
import model.CustomerType;
import repository.CustomerTypeRepository;
import repository.impl.CustomerTypeRepositoryImpl;

import java.util.List;

public class CustomerTypeService {
    private CustomerTypeRepository customerTypeRepo = new CustomerTypeRepositoryImpl();

    public List<CustomerType> selectAllCustomerType() {
        return customerTypeRepo.selectAllCustomerType();
    }

}
