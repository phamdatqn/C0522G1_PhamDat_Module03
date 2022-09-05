package service.I_customer;

import model.customer.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    List<Customer> displayAll();

    boolean delete(int id);

    Customer findById(int id);

    boolean update(int id, Customer customer);

    Map<String,String> create(Customer customer);

    List<Customer> search(String nameSearch, String nameAddress, String phoneNumber);
}
