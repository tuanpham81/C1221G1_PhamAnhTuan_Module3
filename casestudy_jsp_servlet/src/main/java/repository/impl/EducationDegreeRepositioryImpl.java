package repository.impl;

import model.Division;
import model.EducationDegree;
import repository.EducationDegreeRepositiory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepositioryImpl implements EducationDegreeRepositiory {
    private static final String SELECT_ALL_DEGREE = "select * from trinh_do";
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<EducationDegree> selectAllEducationDegree() {
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DEGREE);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int degreeId = rs.getInt("ma_trinh_do");
                String degreName = rs.getString("teb_trinh_do");
                educationDegreeList.add(new EducationDegree(degreeId, degreName));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return educationDegreeList;
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
