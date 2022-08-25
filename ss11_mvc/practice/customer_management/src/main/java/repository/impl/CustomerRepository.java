package repository.impl;

import model.Customer;
import repository.ICustomerRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerRepository implements ICustomerRepository {
    private static Map<Integer, Customer>customersList =new HashMap<>();

    static {
        customersList.put(1, new Customer(1, "John", "john@codegym.vn", "Hanoi"));
        customersList.put(2, new Customer(2, "Bill", "bill@codegym.vn", "Danang"));
        customersList.put(3, new Customer(3, "Alex", "alex@codegym.vn", "Saigon"));
        customersList.put(4, new Customer(4, "Adam", "adam@codegym.vn", "Beijin"));
        customersList.put(5, new Customer(5, "Sophia", "sophia@codegym.vn", "Miami"));
        customersList.put(6, new Customer(6, "Rose", "rose@codegym.vn", "Newyork"));
    }
    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customersList.values());
    }

    @Override
    public void save(Customer customer) {
        customersList.put(customer.getId(),customer);
    }

    @Override
    public Customer findById(int id) {
        return customersList.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customersList.put(id,customer);
    }

    @Override
    public void remove(int id) {
        customersList.remove(id);
    }
}
