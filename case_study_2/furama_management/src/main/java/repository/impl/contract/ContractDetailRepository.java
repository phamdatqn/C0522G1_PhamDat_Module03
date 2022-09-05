package repository.impl.contract;

import model.contract.ContractDetail;
import repository.BaseRepository;
import repository.i_contract.IContractDetailRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractDetailRepository implements IContractDetailRepository {
    private static String SELECT_CONTRACT_DETAIL="select * from contract_detail where is_delete=0; ";
    private static String INSERT_CONTRACT_DETAIL ="INSERT INTO contract_detail(contract_id,attach_facility_id,quantity) value(?,?,?);";
    @Override
    public List<ContractDetail> displayAll() {
        List<ContractDetail>contractDetailList=new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_CONTRACT_DETAIL);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                int contractId=resultSet.getInt("contract_id");
                int attachFacilityId=resultSet.getInt("attach_facility_id");
                int quantity=resultSet.getInt("quantity");
                contractDetailList.add(new ContractDetail(id,contractId,attachFacilityId,quantity));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractDetailList;
    }

    @Override
    public void create(ContractDetail contractDetail) {
        Connection connection=BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(INSERT_CONTRACT_DETAIL);
            preparedStatement.setInt(1,contractDetail.getContractId());
            preparedStatement.setInt(2,contractDetail.getAttachFacilityId());
            preparedStatement.setInt(3,contractDetail.getQuantity());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
