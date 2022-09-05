package service.impl.customer;

import common.Validation;
import model.customer.Customer;
import repository.i_customer.ICustomerRepository;
import repository.impl.customer.CustomerRepository;
import service.I_customer.ICustomerService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    private ICustomerRepository iCustomerRepository = new CustomerRepository();

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
        return iCustomerRepository.update(id, customer);
    }

    @Override
    public Map<String, String> create(Customer customer) {
        Map<String, String> map = new HashMap<>();

        if ("".equals(customer.getPhoneNumber())) {
            map.put("phoneNumber", "Số điện thoại không được để trống !!!");
        } else if (!Validation.checkPhoneNumber(customer.getPhoneNumber())) {
            map.put("phoneNumber", "Số điện thoại phải có định dạng: 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx.!!!");
        }

        if ("".equals(customer.getIdCard())) {
            map.put("idCard", "CMND không được để trống !!!");
        } else if (!Validation.checkCard(customer.getIdCard())) {
            map.put("idCard", "CMND không đúng định dạng !!!");
        }

        if ("".equals(customer.getName())) {
            map.put("name", "Tên không được để trống !!!");
        } else if (!Validation.checkName(customer.getName())) {
            map.put("name", "Tên không đúng định dạng !!!");
        }

        if ("".equals(customer.getEmail())) {
            map.put("email", "Email không được để trống !!!");
        } else if (!Validation.checkEmail(customer.getEmail())) {
            map.put("email", "Email không đúng định dạng !!!");
        }
        if (map.isEmpty()) {
            iCustomerRepository.create(customer);
        }
        return map;
    }

    @Override
    public List<Customer> search(String nameSearch, String nameAddress, String phoneNumberSearch) {
        return iCustomerRepository.search(nameSearch, nameAddress, phoneNumberSearch);
    }
}
