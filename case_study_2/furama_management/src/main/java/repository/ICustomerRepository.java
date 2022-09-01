package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> displayAll();

    Customer findById(int id);

    boolean delete(int id);

    boolean update(int id, Customer customer);

    void create(Customer customer);


}
