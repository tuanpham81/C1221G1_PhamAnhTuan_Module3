package services.impl;

import model.Division;
import repository.DivisionRepository;
import repository.impl.DivisionRepositoryImpl;
import services.DivisionService;

import java.util.List;

public class DivisionServiceImpl implements DivisionService {
    DivisionRepository divisionRepo = new DivisionRepositoryImpl();
    @Override
    public List<Division> selectAllDivision() {
        return divisionRepo.selectAllDivision();
    }
}
