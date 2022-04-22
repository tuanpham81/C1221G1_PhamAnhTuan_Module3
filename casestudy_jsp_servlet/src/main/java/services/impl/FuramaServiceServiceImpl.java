package services.impl;

import model.FuramaService;
import repository.FuramaServiceRepository;
import repository.impl.FuramaServiceRepositoryImpl;
import services.FuramaServiceService;

import java.sql.SQLException;
import java.util.List;

public class FuramaServiceServiceImpl implements FuramaServiceService {
    private FuramaServiceRepository serviceRepo = new FuramaServiceRepositoryImpl();
    @Override
    public void insertService(FuramaService furamaService) throws SQLException {
        serviceRepo.insertService(furamaService);
    }

    @Override
    public List<FuramaService> selectAllService() {
        return serviceRepo.selectAllService();
    }
}
