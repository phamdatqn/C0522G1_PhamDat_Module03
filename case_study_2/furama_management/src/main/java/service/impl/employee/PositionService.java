package service.impl.employee;

import model.employee.Position;
import repository.i_employee.IPositionRepository;
import repository.impl.employee.PositionRepository;
import service.i_employee.IPositionService;

import java.util.List;

public class PositionService implements IPositionService {
    private static IPositionRepository iPositionRepository=new PositionRepository();
    @Override
    public List<Position> displayAll() {
        return iPositionRepository.displayAll();
    }
}
