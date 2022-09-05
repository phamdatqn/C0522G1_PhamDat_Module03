package repository.i_employee;

import model.employee.Employee;
import model.facility.Facility;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> displayAll();

    Employee findById(int id);

    boolean delete(int id);

    boolean update(int id, Employee employee);

    void create(Employee employee);

    List<Employee> search(String nameSearch,String nameAddress,String phoneNumberSearch);
}
