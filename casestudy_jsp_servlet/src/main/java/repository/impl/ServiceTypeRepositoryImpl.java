package repository.impl;

import model.RentType;
import model.ServiceType;
import repository.ServiceTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRepositoryImpl implements ServiceTypeRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_SERVICE_TYPE = "select * from loai_dich_vu";
    @Override
    public List<ServiceType> selectAllServiceType() {
        List<ServiceType> serviceTypeList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE_TYPE);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int serviceTypeId = rs.getInt("ma_loai_dich_vu");
                String serviceTypeName = rs.getString("ten_loai_dich_vu");
                serviceTypeList.add(new ServiceType(serviceTypeId, serviceTypeName));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return serviceTypeList;
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
