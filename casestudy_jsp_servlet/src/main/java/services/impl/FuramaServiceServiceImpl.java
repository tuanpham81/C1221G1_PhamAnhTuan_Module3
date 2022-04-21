package services.impl;

import model.FuramaService;
import services.FuramaServiceService;

import java.sql.SQLException;

public class FuramaServiceServiceImpl implements FuramaServiceService {
    FuramaServiceService furamaServiceService = new FuramaServiceServiceImpl();
    @Override
    public void insertService(FuramaService furamaService) throws SQLException {
        furamaServiceService.insertService(furamaService);
    }
}
