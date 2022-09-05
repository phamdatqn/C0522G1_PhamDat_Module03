package repository.impl.facility;

import model.facility.AttachFacility;
import repository.BaseRepository;
import repository.i_facility.IAttachFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AttachFacilityRepository implements IAttachFacilityRepository {
    private static String SELECT_ACTACT_FACILITY="SELECT * FROM attach_facility;";
    @Override
    public List<AttachFacility> displayAll() {
        List<AttachFacility> attachFacilityList =new ArrayList<>();
        Connection connection= BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ACTACT_FACILITY);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                double cost=resultSet.getDouble("cost");
                String unit=resultSet.getString("unit");
                String status=resultSet.getString("status");
                attachFacilityList.add(new AttachFacility(id,name,cost,unit,status));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return attachFacilityList;
    }
}
