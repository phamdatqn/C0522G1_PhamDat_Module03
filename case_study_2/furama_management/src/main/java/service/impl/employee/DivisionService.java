package service.impl.employee;

import model.employee.Division;
import repository.i_employee.IDivisionRepository;
import repository.impl.employee.DivisionRepository;
import service.i_employee.IDivisionService;

import java.util.List;

public class DivisionService implements IDivisionService {
    private static IDivisionRepository iDivisionRepository = new DivisionRepository();

    @Override
    public List<Division> displayAll() {
        return iDivisionRepository.displayALL();
    }
}
