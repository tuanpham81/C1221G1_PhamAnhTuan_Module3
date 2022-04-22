package services;

import model.FuramaService;

import java.sql.SQLException;
import java.util.List;

public interface FuramaServiceService {
     void insertService(FuramaService furamaService) throws SQLException;

    List<FuramaService> selectAllService();
}
