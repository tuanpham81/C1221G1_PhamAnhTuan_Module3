package repository.impl;

import model.CustomerType;
import model.Division;
import repository.DivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepositoryImpl implements DivisionRepository {
    private static final String SELECT_ALL_DIVISION = "select * from bo_phan";
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Division> selectAllDivision() {
        List<Division> divisionList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DIVISION);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int divisionId = rs.getInt("ma_bo_phan");
                String divisionName = rs.getString("ten_bo_phan");
                divisionList.add(new Division(divisionId, divisionName));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return divisionList;
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
