package service.impl.customer;

import model.customer.Customer;
import repository.i_customer.ICustomerRepository;
import repository.impl.customer.CustomerRepository;
import service.I_customer.ICustomerService;

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
