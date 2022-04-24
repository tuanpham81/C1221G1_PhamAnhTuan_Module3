package services.impl;

import model.Customer;
import model.Employee;
import repository.EmployeeRepository;
import repository.impl.EmployeeRepositoryImpl;
import services.EmployeeService;

import java.sql.SQLException;
import java.util.List;

public class EmployeeServiceImpl implements EmployeeService {
    private EmployeeRepository employeeRepo = new EmployeeRepositoryImpl();
    @Override
    public void insertEmployee(Employee employee) throws SQLException {
        employeeRepo.insertEmployee(employee);
    }

    @Override
    public Employee selectEmployee(int id) {
        return employeeRepo.selectEmployee(id);
    }

    @Override
    public List<Employee> selectAllEmployee() {
        return employeeRepo.selectAllEmployee();
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        return employeeRepo.updateEmployee(employee);
    }

    @Override
    public void deleteEmployeeSP(int id) throws SQLException {
        employeeRepo.deleteEmployeeSP(id);

    }

    @Override
    public List<Employee> searchEmployeeByName(String searchName) {
        return employeeRepo.searchEmployeeByName(searchName);
    }

    @Override
    public List<Employee> searchEmployee(String searchName, String searchAddress, String searchDivision) {
        return employeeRepo.searchEmployee(searchName,searchAddress,searchDivision);
    }
}
