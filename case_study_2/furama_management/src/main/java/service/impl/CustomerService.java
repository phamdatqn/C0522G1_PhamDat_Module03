package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository iCustomerRepository =new CustomerRepository();

    @Override
    public List<Customer> displayAll() {
        return iCustomerRepository.displayAll();
    }

    @Override
    public boolean delete(int id) {
       return iCustomerRepository.delete(id);
    }

    @Override
    public Customer findById(int id) {
        return iCustomerRepository.findById(id);
    }

    @Override
    public boolean update(int id, Customer customer) {
        return iCustomerRepository.update(id,customer);
    }

    @Override
    public void create(Customer customer) {
        iCustomerRepository.create(customer);
    }
}
