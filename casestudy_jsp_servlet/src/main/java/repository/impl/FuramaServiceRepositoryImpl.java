package repository.impl;

import model.FuramaService;
import repository.FuramaServiceRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FuramaServiceRepositoryImpl implements FuramaServiceRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String SQL_SELECT_ALL_SERVICES = "select * from dich_vu";
    private static final String SQL_INSERT_SERVICES = "INSERT into dich_vu values " +
            "(?,?,?,?,?,?,?,?,?,?,?)";
    @Override
    public void insertService(FuramaService furamaService) throws SQLException {
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(SQL_INSERT_SERVICES)) {
            statement.setInt(1, furamaService.serviceId);
            statement.setString(2, furamaService.name);
            statement.setFloat(3, furamaService.area);
            statement.setFloat(4, furamaService.cost);
            statement.setInt(5, furamaService.maxPeople);
            statement.setInt(6, furamaService.rentTypeId);
            statement.setInt(7, furamaService.serviceTypeId);
            statement.setString(8, furamaService.standard);
            statement.setString(9, furamaService.otherConvenient);
            statement.setFloat(10, furamaService.poolArea);
            statement.setInt(11, furamaService.floorNumber);
            statement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public List<FuramaService> selectAllService() {
        List<FuramaService> serviceList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_SELECT_ALL_SERVICES);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int serviceId = rs.getInt("ma_dich_vu");
                String name = rs.getString("ten_dich_vu");
                float area = rs.getFloat("dien_tich");
                float cost = rs.getFloat("chi_phi_thue");
                int maxPeople = rs.getInt("so_nguoi_toi_da");
                int rentTypeId = rs.getInt("ma_kieu_thue");
                int serviceTypeId = rs.getInt("ma_loai_dich_vu");
                String standard = rs.getString("tieu_chuan_phong");
                String otherConvenient = rs.getString("mo_ta_tien_nghi_khac");
                float poolArea = rs.getFloat("dien_tich_ho_boi");
                int floorNumber = rs.getInt("so_tang");
                serviceList.add(new FuramaService(serviceId, name, area, cost, maxPeople, rentTypeId, serviceTypeId, standard, otherConvenient,poolArea,floorNumber));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return serviceList;
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
