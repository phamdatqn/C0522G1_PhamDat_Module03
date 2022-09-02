package service.impl.customer;

import model.customer.CustomerType;
import repository.i_customer.ICustomerTypeRepository;
import repository.impl.customer.CustomerTypeRepository;
import service.I_customer.ICustomerTypeService;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {
    private ICustomerTypeRepository iCustomerTypeRepository=new CustomerTypeRepository();
    @Override
    public List<CustomerType> findAll() {
        return iCustomerTypeRepository.findAll();
    }
}
