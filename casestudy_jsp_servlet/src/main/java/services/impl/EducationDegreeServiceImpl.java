package services.impl;

import model.EducationDegree;
import repository.EducationDegreeRepositiory;
import repository.impl.EducationDegreeRepositioryImpl;
import services.EducationDegreeService;

import java.util.List;

public class EducationDegreeServiceImpl implements EducationDegreeService {
    EducationDegreeRepositiory educationDegreeRepo = new EducationDegreeRepositioryImpl();
    @Override
    public List<EducationDegree> selectAllEducationDegree() {
        return educationDegreeRepo.selectAllEducationDegree();
    }
}
