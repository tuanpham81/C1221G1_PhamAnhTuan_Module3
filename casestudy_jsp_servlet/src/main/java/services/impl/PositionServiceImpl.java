package services.impl;

import model.Position;
import repository.PositionRepository;
import repository.impl.PositionRepositoryImpl;
import services.PositionService;

import java.util.List;

public class PositionServiceImpl implements PositionService {
    PositionRepository positionRepo = new PositionRepositoryImpl();
    @Override
    public List<Position> selectAllPosition() {
        return positionRepo.selectAllPosition();
    }
}
