package repository.impl;

import model.CustomerType;
import repository.BaseRepository;
import repository.ICustomerTypeRepository;

import javax.servlet.RequestDispatcher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CustomerTypeRepository implements ICustomerTypeRepository {
    private static String SELECT_ALL_CUSTOMER_TYPE ="SELECT * FROM customer_type;";

    @Override
    public List<CustomerType> findAll() {
        List<CustomerType> customerTypeList=new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
           PreparedStatement preparedStatement= connection.prepareStatement(SELECT_ALL_CUSTOMER_TYPE);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id =resultSet.getInt("id");
                String name=resultSet.getString("name");
            CustomerType customerType=new CustomerType(id,name);
            customerTypeList.add(customerType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypeList;
    }
}
