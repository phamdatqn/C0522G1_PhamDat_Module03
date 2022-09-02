package service.I_customer;

import model.customer.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> displayAll();
    boolean delete(int id);
    Customer findById(int id);
    boolean update(int id, Customer customer);
    void create(Customer customer);
}
