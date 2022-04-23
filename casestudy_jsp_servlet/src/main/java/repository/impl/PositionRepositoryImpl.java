package repository.impl;

import model.Division;
import model.Position;
import repository.PositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepositoryImpl implements PositionRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_POSITION = "select * from vi_tri";

    @Override
    public List<Position> selectAllPosition() {
        List<Position> positionList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_POSITION);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int positionId = rs.getInt("ma_vi_tri");
                String positionName = rs.getString("ten_vi_tri");
                positionList.add(new Position(positionId, positionName));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return positionList;
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
