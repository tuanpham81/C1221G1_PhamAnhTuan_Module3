package repository;

import model.FuramaService;

import java.sql.SQLException;
import java.util.List;

public interface FuramaServiceRepository {
    void insertService(FuramaService furamaService) throws SQLException;
    List<FuramaService> selectAllService();
}
