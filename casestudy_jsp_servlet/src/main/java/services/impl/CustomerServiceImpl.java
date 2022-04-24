package services.impl;

import model.Customer;
import repository.CustomerRepository;
import repository.impl.CustomerRepositoryImpl;
import services.CustomerService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    private CustomerRepository customerRepo = new CustomerRepositoryImpl();

    @Override
    public Map<String, String> insertCustomer(Customer customer) throws SQLException {
        Map<String, String> map = new HashMap<>();
        if (customer.idCardNumber.equals("")) {
            map.put("cmnd", "CMND không được để trống");
        } else if (!customer.idCardNumber.matches("^\\d{9}|\\d{12}$")) {
            map.put("cmnd", "CMND không hợp lệ");
        }

        if (customer.phoneNumber.equals("")) {
            map.put("phone", "Số điện thoại không được để trống");
        } else if (!customer.phoneNumber.matches("^((090)|(091)|([(]84[)][+]90)|([(]84[)][+]91))\\d{7}$")) {
            map.put("phone", "Số điện thoại không hợp lệ");
        }

        if (customer.email.equals("")) {
            map.put("email", "Email không được để trống");
        } else if (!customer.email.matches("^(?=.{1,64}@)[A-Za-z0-9_-]+(\\\\.[A-Za-z0-9_-]+)*@" +
                "[^-][A-Za-z0-9-]+(\\\\.[A-Za-z0-9-]+)*(\\\\.[A-Za-z]{2,})$"))

            if (map.isEmpty()) {
                customerRepo.insertCustomer(customer);
            }
        return map;
    }
//        customerRepo.insertCustomer(customer);
//    }

    @Override
    public Customer selectCustomer(String id) {
        return customerRepo.selectCustomer(id);
    }

    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepo.selectAllCustomer();
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        return customerRepo.updateCustomer(customer);
    }

//    @Override
//    public boolean deleteCustomer(String id) throws SQLException{
//        return customerRepo.deleteCustomer(id);
//    }

    @Override
    public void deleteCustomerSP(String id) throws SQLException {
        customerRepo.deleteCustomerSP(id);
    }

    @Override
    public List<Customer> searchCustomerByName(String searchName) {
        return customerRepo.searchCustomerByName(searchName);
    }
}

