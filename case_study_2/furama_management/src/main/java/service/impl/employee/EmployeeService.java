package service.impl.employee;

import model.employee.Employee;
import model.facility.Facility;
import repository.i_employee.IEmployeeRepository;
import repository.impl.employee.EmployeeRepository;
import service.i_employee.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
   private static IEmployeeRepository iEmployeeRepository=new EmployeeRepository();
    @Override
    public List<Employee> displayAll() {
        return iEmployeeRepository.displayAll();
    }

    @Override
    public Employee findById(int id) {
        return iEmployeeRepository.findById(id);
    }

    @Override
    public boolean delete(int id) {
        return iEmployeeRepository.delete(id);
    }

    @Override
    public boolean update(int id, Employee employee) {
        return iEmployeeRepository.update(id,employee);
    }

    @Override
    public void create(Employee employee) {
        iEmployeeRepository.create(employee);
    }
}
