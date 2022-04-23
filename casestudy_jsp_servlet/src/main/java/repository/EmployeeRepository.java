package repository;

import model.Employee;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeRepository {
    void insertEmployee(Employee employee) throws SQLException;

    Employee selectEmployee(int id);

    List<Employee> selectAllEmployee();

    boolean updateEmployee(Employee employee) throws SQLException;

    void deleteEmployeeSP(int id) throws SQLException;

    List<Employee> searchEmployeeByName(String searchName);
}
