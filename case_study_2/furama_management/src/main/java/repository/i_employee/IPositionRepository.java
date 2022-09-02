package repository.i_employee;

import model.employee.EducationDegree;
import model.employee.Position;

import java.util.List;

public interface IPositionRepository {
    List<Position> displayAll();
}
