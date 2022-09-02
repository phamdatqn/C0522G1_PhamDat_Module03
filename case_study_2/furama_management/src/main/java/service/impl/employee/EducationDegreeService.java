package service.impl.employee;

import model.employee.EducationDegree;
import repository.i_employee.IEducationDegreeRepository;
import repository.impl.employee.EducationDegreeRepository;
import service.i_employee.IEducationDegreeService;

import java.util.List;

public class EducationDegreeService implements IEducationDegreeService {
    private static IEducationDegreeRepository iEducationDegreeRepository=new EducationDegreeRepository();
    @Override
    public List<EducationDegree> displayAll() {
        return iEducationDegreeRepository.displayAll();
    }
}
