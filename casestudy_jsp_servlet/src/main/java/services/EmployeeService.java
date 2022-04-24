package services;

import model.Employee;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeService {

    void insertEmployee(Employee employee) throws SQLException;

    Employee selectEmployee(int id);

    List<Employee> selectAllEmployee();

    boolean updateEmployee(Employee employee) throws SQLException;

    void deleteEmployeeSP(int id) throws SQLException;

    List<Employee> searchEmployeeByName(String searchName);

    List<Employee> searchEmployee(String searchName, String searchAddress, String searchDivision); //search theo nhiều thuộc tính
}
