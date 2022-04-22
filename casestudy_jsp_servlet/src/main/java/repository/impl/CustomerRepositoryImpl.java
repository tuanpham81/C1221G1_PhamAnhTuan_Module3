package repository.impl;

import model.Customer;
import repository.CustomerRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {

    private BaseRepository baseRepository = new BaseRepository();
    private static final String SQL_INSERT_CUSTOMER = "insert into khach_hang values " +
            "(?,?,?,?,?,?,?,?,?);";
    private static final String SQL_SELECT_ALL_CUSTOMERS = "select * from khach_hang;";
    private static final String SQL_DELETE_CUSTOMER = "delete from khach_hang where ma_khach_hang = ?;";
    private static final String SQL_SELECT_CUSTOMER_BY_ID = "select * from khach_hang where ma_khach_hang = ?;";
    private static final String SQL_SEARCH_CUSTOMERS_BY_NAME = "select * from khach_hang where ho_ten like ?;";
    private static final String SQL_UPDATE_CUSTOMER =
            "update khach_hang set ma_loai_khach=?, ho_ten=?, ngay_sinh=?, gioi_tinh=?, so_cmnd=?,so_dien_thoai=?, email=?, dia_chi=? where ma_khach_hang=?;";


    @Override
    public void insertCustomer(Customer customer) {
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(SQL_INSERT_CUSTOMER)) {
            statement.setInt(1, customer.customerId);
            statement.setInt(2, customer.customerType);
            statement.setString(3, customer.name);
            statement.setString(4, customer.birthDay);
            statement.setInt(5, customer.gender);
            statement.setString(6, customer.idCardNumber);
            statement.setString(7, customer.phoneNumber);
            statement.setString(8, customer.email);
            statement.setString(9, customer.address);
            statement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public Customer selectCustomer(String id) {
        Customer customer = null;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_SELECT_CUSTOMER_BY_ID);) {
            preparedStatement.setString(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer customerId = rs.getInt("ma_khach_hang");
                String name = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                Integer gender = rs.getInt("gioi_tinh");
                String idCardNumber = rs.getString("so_cmnd");
                String phoneNumber = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                Integer customerType = rs.getInt("ma_loai_khach");
                String customerAddress = rs.getString("dia_chi");
                customer = new Customer(name, birthday, gender, idCardNumber, phoneNumber, email, customerId, customerType, customerAddress);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customer;
    }


    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_SELECT_ALL_CUSTOMERS);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Integer customerId = rs.getInt("ma_khach_hang");
                String name = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                Integer gender = rs.getInt("gioi_tinh");
                String idCardNumber = rs.getString("so_cmnd");
                String phoneNumber = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                Integer customerType = rs.getInt("ma_loai_khach");
                String customerAddress = rs.getString("dia_chi");
                customerList.add(new Customer(name, birthday, gender, idCardNumber, phoneNumber, email, customerId, customerType, customerAddress));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customerList;
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
    public boolean deleteCustomer(String idCustomer) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(SQL_DELETE_CUSTOMER);) {
            statement.setString(1, idCustomer);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public void deleteCustomerSP(String id) {
        String query = "{CALL delete_customer_by_id(?)}";
        try (Connection connection = baseRepository.getConnection();
             CallableStatement callableStatement = connection.prepareCall(query);) {
            callableStatement.setString(1, id);
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
    }

    @Override
    public List<Customer> searchCustomerByName(String searchName) {
        List<Customer> customerList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_SEARCH_CUSTOMERS_BY_NAME);) {
            preparedStatement.setString(1, '%' + searchName + '%');
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer customerId = rs.getInt("ma_khach_hang");
                String name = rs.getString("ho_ten");
                String birthday = rs.getString("ngay_sinh");
                Integer gender = rs.getInt("gioi_tinh");
                String idCardNumber = rs.getString("so_cmnd");
                String phoneNumber = rs.getString("so_dien_thoai");
                String email = rs.getString("email");
                Integer customerType = rs.getInt("ma_loai_khach");
                String customerAddress = rs.getString("dia_chi");
                customerList.add(new Customer(name, birthday, gender, idCardNumber, phoneNumber, email, customerId, customerType, customerAddress));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customerList;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(SQL_UPDATE_CUSTOMER);) {
            statement.setInt(1, customer.customerType);
            statement.setString(2, customer.name);
            statement.setString(3, customer.birthDay);
            statement.setInt(4, customer.gender);
            statement.setString(5, customer.idCardNumber);
            statement.setString(6, customer.phoneNumber);
            statement.setString(7, customer.email);
            statement.setString(8, customer.address);
            statement.setInt(9, customer.customerId);

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}


