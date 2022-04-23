package repository.impl;

import model.FuramaService;
import model.RentType;
import repository.RentTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepositoryImpl implements RentTypeRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_RENT_TYPE = "select * from kieu_thue";
    @Override
    public List<RentType> selectAllRentType() {
        List<RentType> rentTypeList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RENT_TYPE);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int rentTypeId = rs.getInt("ma_kieu_thue");
                String rentTypeName = rs.getString("ten_kieu_thue");
                rentTypeList.add(new RentType(rentTypeId, rentTypeName));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rentTypeList;
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
