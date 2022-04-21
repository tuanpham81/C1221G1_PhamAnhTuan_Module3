package repository.impl;

import model.Customer;
import repository.CustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String SQL_SELECT_ALL_CUSTOMERS = "select * from khach_hang";
    private static final String SQL_DELETE_CUSTOMER = "delete from khach_hang where id = ?";
    @Override
    public void insertCustomer(Customer customer) throws SQLException {

    }

    @Override
    public Customer selectCustomer(int id) {
        return null;
    }

    @Override
    public List<Customer> selectAllCustomers() {
        List<Customer> customerList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_SELECT_ALL_CUSTOMERS);   ) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name =rs.getString("ho_ten");
                String birthday =rs.getString("ngay_sinh");
                int gender =rs.getInt("gioi_tinh");
                int idNumber = rs.getInt("so_cmnd");
                String phoneNumber =rs.getString("so_dien_thoai");
                String email =rs.getString("email");
                String customerId =rs.getString("ma_khach_hang");
                int customerType = Integer.parseInt(rs.getString("ma_loai_khach"));
                String customerAddress =rs.getString("dia_chi");
                customerList.add(new Customer(name,birthday,gender,idNumber,phoneNumber,email,customerId,customerType,customerAddress));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return customerList;
    }


    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean updateCustomer(Customer customer) throws SQLException {
        return false;
    }

    @Override
    public Customer getCustomerById(int id) {
        return null;
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
}
