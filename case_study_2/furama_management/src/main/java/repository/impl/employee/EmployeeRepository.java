package repository.impl.employee;

import model.customer.Customer;
import model.employee.Employee;
import model.facility.Facility;
import repository.BaseRepository;
import repository.i_employee.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private static String SELECT_ALL_EMPLOYEE = "SELECT * FROM employee where is_delete=0;";
    private static String INSERT_EMPLOYEE="INSERT INTO employee(name,date_of_birth,id_card,salary,phone_number,email,address,position_id,education_degree_id,division_id)" +
            "value(?,?,?,?,?,?,?,?,?,?)";
    private static String DELETE_EMPLOYEE="update employee set is_delete=1 where id=? and is_delete=0;";
    private static String UPDATE_EMPLOYEE="update employee set name=?,date_of_birth=?,id_card=?,salary=?,phone_number=?,email=?,address=?,position_id=?," +
            "education_degree_id=?,division_id=? where id=? and is_delete=0;";
    private static String SELECT_FIND_BY_ID="select * from employee where id=? and is_delete=0;";

    @Override
    public List<Employee> displayAll() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL_EMPLOYEE);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name=resultSet.getString("name");
                String dateOfBirth=resultSet.getString("date_of_birth");
                String idCard=resultSet.getString("id_card");
                double salary =resultSet.getDouble("salary");
                String phoneNumber=resultSet.getString("phone_number");
                String email=resultSet.getString("email");
                String address=resultSet.getString("address");
                int positionId=resultSet.getInt("position_id");
                int educationDegreeId=resultSet.getInt("education_degree_id");
                int divisionId=resultSet.getInt("division_id");
//                String userName=resultSet.getString("user_name");
                employeeList.add(new Employee(id,name,dateOfBirth,idCard,salary,phoneNumber,email,address,positionId,educationDegreeId,divisionId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employeeList;
    }

    @Override
    public Employee findById(int id) {
        Employee employee = null;
        Connection connection = BaseRepository.getConnectDB();
        try (
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FIND_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String name=resultSet.getString("name");
                String dateOfBirth=resultSet.getString("date_of_birth");
                String idCard=resultSet.getString("id_card");
                double salary =resultSet.getDouble("salary");
                String phoneNumber=resultSet.getString("phone_number");
                String email=resultSet.getString("email");
                String address=resultSet.getString("address");
                int positionId=resultSet.getInt("position_id");
                int educationDegreeId=resultSet.getInt("education_degree_id");
                int divisionId=resultSet.getInt("division_id");
                employee=new Employee(id,name,dateOfBirth,idCard,salary,phoneNumber,email,address,positionId,educationDegreeId,divisionId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public boolean delete(int id) {
        boolean rowDelete = false;
        Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(DELETE_EMPLOYEE);
            preparedStatement.setInt(1,id);
            rowDelete =preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public boolean update(int id, Employee employee) {
        boolean rowUpdate=false;
        Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(UPDATE_EMPLOYEE);
            preparedStatement.setString(1,employee.getName());
            preparedStatement.setString(2,employee.getDateOfBirth());
            preparedStatement.setString(3,employee.getIdCard());
            preparedStatement.setDouble(4,employee.getSalary());
            preparedStatement.setString(5,employee.getPhoneNumber());
            preparedStatement.setString(6,employee.getEmail());
            preparedStatement.setString(7,employee.getAddress());
            preparedStatement.setInt(8,employee.getPositionId());
            preparedStatement.setInt(9,employee.getEducationDegreeId());
            preparedStatement.setInt(10,employee.getDivisionId());
            preparedStatement.setInt(11,employee.getId());
            rowUpdate=preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdate;
    }

    @Override
    public void create(Employee employee) {
        Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement= connection.prepareStatement(INSERT_EMPLOYEE);
           preparedStatement.setString(1,employee.getName());
           preparedStatement.setString(2,employee.getDateOfBirth());
           preparedStatement.setString(3,employee.getIdCard());
           preparedStatement.setDouble(4,employee.getSalary());
           preparedStatement.setString(5,employee.getPhoneNumber());
           preparedStatement.setString(6,employee.getEmail());
           preparedStatement.setString(7,employee.getAddress());
           preparedStatement.setInt(8,employee.getPositionId());
           preparedStatement.setInt(9,employee.getEducationDegreeId());
           preparedStatement.setInt(10,employee.getDivisionId());
//           preparedStatement.setString(11,employee.getEmail());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
