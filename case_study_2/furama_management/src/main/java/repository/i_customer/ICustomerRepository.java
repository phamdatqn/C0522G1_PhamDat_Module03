package repository.i_customer;

import model.customer.Customer;
import model.employee.Employee;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> displayAll();

    Customer findById(int id);

    boolean delete(int id);

    boolean update(int id, Customer customer);

    void create(Customer customer);

    List<Customer> search(String nameSearch, String nameAddress, String phoneNumberSearch);
}
