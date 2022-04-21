package repository;

import model.FuramaService;

import java.sql.SQLException;

public interface FuramaServiceRepository {
    void insertService(FuramaService furamaService) throws SQLException;
}
