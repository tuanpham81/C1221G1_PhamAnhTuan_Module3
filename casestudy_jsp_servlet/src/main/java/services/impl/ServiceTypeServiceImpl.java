package services.impl;

import model.ServiceType;
import repository.ServiceTypeRepository;
import repository.impl.ServiceTypeRepositoryImpl;
import services.ServiceTypeService;

import java.util.List;

public class ServiceTypeServiceImpl implements ServiceTypeService {
    private ServiceTypeRepository serviceTypeRepo = new ServiceTypeRepositoryImpl();
    @Override
    public List<ServiceType> selectAllServiceType() {
        return serviceTypeRepo.selectAllServiceType();
    }
}
