package services.impl;

import model.RentType;
import repository.RentTypeRepository;
import repository.impl.RentTypeRepositoryImpl;
import services.RentTypeService;

import java.util.List;

public class RentTypeServiceImpl implements RentTypeService {
    private RentTypeRepository rentTypeRepo = new RentTypeRepositoryImpl();
    @Override
    public List<RentType> selectAllRentType() {
        return rentTypeRepo.selectAllRentType();
    }
}
