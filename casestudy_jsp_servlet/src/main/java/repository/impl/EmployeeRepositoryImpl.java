package repository.impl;

import model.Customer;
import model.Employee;
import repository.EmployeeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository {


    private BaseRepository baseRepository = new BaseRepository();
    private static final String INSERT_EMPLOYEE = "insert into nhan_vien values(?,?,?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_EMPLOYEE_BY_ID = "select * from nhan_vien where ma_nhan_vien=?";
    private static final String SELECT_ALL_EMPLOYEE = "select * from nhan_vien";
    private static final String UPDATE_EMPLOYEE = "update nhan_vien set ho_ten=?, ngay_sinh=?,so_cmnd=?,luong=?," +
            "so_dien_thoai=?,email=?,dia_chi=?,ma_vi_tri=?,ma_trinh_do=?,ma_bo_phan=?" +
            "where ma_nhan_vien=?;";
    private static final String SEARCH_EMPLOYEE_BY_NAME = "select * from nhan_vien where ho_ten like ?;";

    @Override
    public void insertEmployee(Employee employee) throws SQLException {
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_EMPLOYEE)) {
            statement.setInt(1, employee.getEmployeeId());
            statement.setString(2, employee.getName());
            statement.setString(3, employee.getBirthday());
            statement.setString(4, employee.getIdCardNumber());
            statement.setDouble(5, employee.getSalary());
            statement.setString(6, employee.getEmail());
            statement.setString(7, employee.getPhone());
            statement.setString(8, employee.getAddress());
            statement.setInt(9, employee.getPositionId());
            statement.setInt(10, employee.getEducationDegree());
            statement.setInt(11, employee.getDivisionId());
            statement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public Employee selectEmployee(int id) {
        Employee employee = null;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer employeeId = rs.getInt("ma_nhan_vien");
                String name = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                String idCardNumber = rs.getString("so_cmnd");
                Double salary = Double.valueOf(rs.getString("luong"));
                String phone = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String address = rs.getString("dia_chi");
                Integer positionId = Integer.valueOf(rs.getString("ma_vi_tri"));
                Integer educationDegree = Integer.valueOf(rs.getString("ma_trinh_do"));
                Integer divisionId = Integer.valueOf(rs.getString("ma_bo_phan"));
                employee = new Employee(employeeId,name, birthday, idCardNumber, salary, phone, email, address, positionId, educationDegree, divisionId);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employee;
    }

    @Override
    public List<Employee> selectAllEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer employeeId = rs.getInt("ma_nhan_vien");
                String name = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                String idCardNumber = rs.getString("so_cmnd");
                Double salary = Double.valueOf(rs.getString("luong"));
                String phone = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String address = rs.getString("dia_chi");
                Integer positionId = Integer.valueOf(rs.getString("ma_vi_tri"));
                Integer educationDegree = Integer.valueOf(rs.getString("ma_trinh_do"));
                Integer divisionId = Integer.valueOf(rs.getString("ma_bo_phan"));
                employeeList.add(new Employee(employeeId,name, birthday, idCardNumber, salary, phone, email, address, positionId, educationDegree, divisionId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employeeList;
    }

    @Override
    public void deleteEmployeeSP(int id) throws SQLException {
        String query = "{CALL delete_employee_by_id(?)}";
        try (Connection connection = baseRepository.getConnection();
             CallableStatement callableStatement = connection.prepareCall(query);) {
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }

    @Override
    public boolean updateEmployee(Employee employee) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_EMPLOYEE);) {
            statement.setString(1, employee.getName());
            statement.setString(2, employee.getBirthday());
            statement.setString(3, employee.getIdCardNumber());
            statement.setDouble(4, employee.getSalary());
            statement.setString(5, employee.getPhone());
            statement.setString(6, employee.getEmail());
            statement.setString(7, employee.getAddress());
            statement.setInt(8, employee.getPositionId());
            statement.setInt(9, employee.getEducationDegree());
            statement.setInt(9, employee.getDivisionId());
            statement.setInt(9, employee.getEmployeeId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }



    @Override
    public List<Employee> searchEmployeeByName(String searchName) {
        List<Employee> employeeList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_EMPLOYEE_BY_NAME);) {
            preparedStatement.setString(1, '%' + searchName + '%');
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer employeeId = rs.getInt("ma_nhan_vien");
                String name = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                String idCardNumber = rs.getString("so_cmnd");
                Double salary = Double.valueOf(rs.getString("luong"));
                String phone = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                String address = rs.getString("dia_chi");
                Integer positionId = Integer.valueOf(rs.getString("ma_vi_tri"));
                Integer educationDegree = Integer.valueOf(rs.getString("ma_trinh_do"));
                Integer divisionId = Integer.valueOf(rs.getString("ma_bo_phan"));
                employeeList.add(new Employee(employeeId,name, birthday, idCardNumber, salary, phone, email, address, positionId, educationDegree, divisionId));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return employeeList;
    }
}
