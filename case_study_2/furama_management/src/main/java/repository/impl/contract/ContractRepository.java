package repository.impl.contract;

import model.contract.Contract;
import repository.BaseRepository;
import repository.i_contract.IContractRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository {
    private static String SELECT_ALL_CONTRACT = "select * from contract where is_delete=0;";
    private static String INSERT_CONTRACT = "INSERT INTO contract(start_date,end_date,deposit,employee_id,customer_id,facility_id) " +
            "value (?,?,?,?,?,?);";

    @Override
    public List<Contract> displayAll() {
        List<Contract> contractList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CONTRACT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String startDate = resultSet.getString("start_date");
                String endDate = resultSet.getString("end_date");
                double deposit = Double.parseDouble(resultSet.getString("deposit"));
                int employeeId = resultSet.getInt("employee_id");
                int customerId = resultSet.getInt("customer_id");
                int facilityId = resultSet.getInt("facility_id");
                contractList.add(new Contract(id, startDate, endDate, deposit, employeeId, customerId, facilityId));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractList;
    }

    @Override
//    start_date,end_date,deposit,employee_id,customer_id,facility_id
    public void create(Contract contract) {
        Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(INSERT_CONTRACT);
            preparedStatement.setString(1,contract.getStartDate());
            preparedStatement.setString(2,contract.getEndDate());
            preparedStatement.setDouble(3,contract.getDeposit());
            preparedStatement.setInt(4,contract.getEmployeeId());
            preparedStatement.setInt(5,contract.getCustomerId());
            preparedStatement.setInt(6,contract.getFacilityId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
